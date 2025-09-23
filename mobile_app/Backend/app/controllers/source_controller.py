from sqlalchemy.orm import Session
from database.models import EnergySource  # adjust import if your Tables file is named differently
from schemas.source import SourceCreate, SourceOut

def get_sources(db: Session):
    return db.query(EnergySource).all()

def get_source(db: Session, source_id: int):
    return db.query(EnergySource).filter(EnergySource.source_id == source_id).first()

# def create_source(db: Session, data: dict):
def create_source(db: Session, data: SourceCreate):
    new_source = EnergySource(**data.dict())
    db.add(new_source)
    db.commit()
    db.refresh(new_source)
    return new_source

# def update_source(db: Session, source_id: int, data: dict):
def update_source(db: Session, source_id: int, data: SourceCreate):
    source = get_source(db, source_id)
    if not source:
        return None
    for key, value in data.model_dump().items():
        setattr(source, key, value)
    db.commit()
    db.refresh(source)
    return source

def delete_source(db: Session, source_id: int):
    source = get_source(db, source_id)
    if not source:
        return None
    db.delete(source)
    db.commit()
    return source
