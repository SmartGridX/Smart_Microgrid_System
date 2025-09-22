# app/routes/readings.py
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List
from datetime import datetime

from auth.auth_bearer import JWTBearer
from schemas.reading import ReadingCreate, ReadingOut
from controllers import reading_controller
from database.config import SessionLocal
from controllers.user_controller import get_current_user  # or your auth dependency that returns current user

router = APIRouter(prefix="/readings", tags=["Readings"]  ,dependencies=[Depends(JWTBearer())])

# DB dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Create reading (public or internal device auth) — restrict if you want devices to use a different auth
@router.post("/", response_model=ReadingOut)
def post_reading(payload: ReadingCreate, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    # current_user ensures only authenticated users/devices post readings
    reading = reading_controller.create_reading(db, payload.sensor_id, payload.value, payload.timestamp)
    return reading

@router.get("/", response_model=List[ReadingOut])
def list_readings(limit: int = Query(100, le=1000), offset: int = 0, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return reading_controller.list_readings(db, limit, offset)

@router.get("/{reading_id}", response_model=ReadingOut)
def get_reading(reading_id: int, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    r = reading_controller.get_reading(db, reading_id)
    if not r:
        raise HTTPException(status_code=404, detail="Reading not found")
    return r

@router.get("/source/{source}", response_model=List[ReadingOut])
def readings_by_source(source: str, limit: int = Query(100, le=1000), offset: int = 0, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return reading_controller.get_readings_by_source(db, source, limit, offset)

@router.get("/device/{device_id}", response_model=List[ReadingOut])
def readings_by_device(device_id: int, limit: int = Query(100, le=1000), offset: int = 0, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return reading_controller.get_readings_by_device(db, device_id, limit, offset)

@router.get("/date", response_model=List[ReadingOut])
def readings_by_date(from_ts: datetime, to_ts: datetime, limit: int = Query(100, le=1000), offset: int = 0, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return reading_controller.get_readings_by_date_range(db, from_ts, to_ts, limit, offset)
