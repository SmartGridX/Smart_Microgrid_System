from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database.config import SessionLocal
from controllers import source_controller
from auth.auth_bearer import JWTBearer  # protect routes
from schemas.source import SourceCreate, SourceOut

router = APIRouter(
    prefix="/sources",
    tags=["Energy Sources"],
    dependencies=[Depends(JWTBearer())]  # only logged-in users
)

# Dependency to get DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[SourceOut])
def list_sources(db: Session = Depends(get_db)):
    return source_controller.get_sources(db)

@router.post("/", response_model=SourceOut)
# def add_source(data: dict, db: Session = Depends(get_db)):
def add_source(data: SourceCreate, db: Session = Depends(get_db)):
    return source_controller.create_source(db, data)

@router.get("/{source_id}", response_model=SourceOut)
def get_source(source_id: int, db: Session = Depends(get_db)):
    source = source_controller.get_source(db, source_id)
    if not source:
        raise HTTPException(status_code=404, detail="Source not found")
    return source

@router.put("/{source_id}", response_model=SourceOut)
# def update_source(source_id: int, data: dict, db: Session = Depends(get_db)):
def update_source(source_id: int, data: SourceCreate, db: Session = Depends(get_db)):
    updated = source_controller.update_source(db, source_id, data)
    if not updated:
        raise HTTPException(status_code=404, detail="Source not found")
    return updated

@router.delete("/{source_id}")
def delete_source(source_id: int, db: Session = Depends(get_db)):
    deleted = source_controller.delete_source(db, source_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Source not found")
    return {"message": "Source deleted"}
