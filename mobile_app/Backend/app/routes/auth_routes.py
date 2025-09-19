from fastapi import APIRouter, Depends, HTTPException
from typing import cast 
from sqlalchemy.orm import Session
from database.config import SessionLocal
from schemas.user import UserCreate
from controllers import user_controller
from auth.auth_handler import verify_password, encode_jwt

router = APIRouter(prefix="/auth", tags=["Auth"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/register")
def register(user: UserCreate, db: Session = Depends(get_db)):
    existing_user = user_controller.get_user_by_email(db, user.email)
    if existing_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    return user_controller.create_user(db, user)


@router.post("/login")
def login(user: UserCreate, db: Session = Depends(get_db)):
    db_user = user_controller.get_user_by_email(db, user.email)
    if not db_user or not verify_password(user.password, str(db_user.password)):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    user_id: int = cast(int, db_user.user_id)
    token = encode_jwt(user_id)

    return {"access_token": token, "token_type": "bearer"}