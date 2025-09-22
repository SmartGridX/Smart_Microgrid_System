# app/routes/analytics.py
from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session
from datetime import datetime
from typing import List

from database.config import SessionLocal
from controllers import analytics_controller
from controllers.user_controller import get_current_user
from auth.auth_bearer import JWTBearer  # auth dependency

router = APIRouter(prefix="/analytics", tags=["Analytics"]  ,dependencies=[Depends(JWTBearer())])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/summary")
def analytics_summary(range_from: datetime | None = None, range_to: datetime | None = None, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    # Return combined daily and monthly summary (or choose one)
    daily = analytics_controller.summary_daily(db, range_from, range_to)
    monthly = analytics_controller.summary_monthly(db, range_from, range_to)
    return {"daily": daily, "monthly": monthly}

@router.get("/source/{source_id}")
def analytics_source(source_id: str, range_from: datetime | None = None, range_to: datetime | None = None, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return analytics_controller.performance_by_source(db, source_id, range_from, range_to)

@router.get("/device/{device_id}")
def analytics_device(device_id: int, range_from: datetime | None = None, range_to: datetime | None = None, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return analytics_controller.performance_by_device(db, device_id, range_from, range_to)

@router.get("/comparison")
def analytics_comparison(sources: List[str] = Query(...), range_from: datetime | None = None, range_to: datetime | None = None, db: Session = Depends(get_db), current_user=Depends(get_current_user)):
    return analytics_controller.comparison_sources(db, sources, range_from, range_to)
