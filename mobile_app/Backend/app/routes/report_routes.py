from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database.config import SessionLocal
from controllers import report_controller
from database.models import Alert
from pydantic import BaseModel
from typing import List
from auth.auth_bearer import JWTBearer  # protect routes

# DB dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

router = APIRouter(tags=["Reports & Alerts"] , dependencies=[Depends(JWTBearer())])

class AlertCreate(BaseModel):
    user_id: int
    device_id: int
    type: str
    message: str

# Reports
@router.get("/reports/generation")
def get_generation_report(db: Session = Depends(get_db)):
    return report_controller.total_generation(db)

@router.get("/reports/consumption")
def get_consumption_report(db: Session = Depends(get_db)):
    return report_controller.total_consumption(db)

# Alerts
@router.get("/alerts/", response_model=List[dict])
def list_alerts(db: Session = Depends(get_db)):
    return report_controller.list_alerts(db)

@router.post("/alerts/", response_model=dict)
def create_alert(data: AlertCreate, db: Session = Depends(get_db)):
    return report_controller.create_alert(db, data.user_id, data.device_id, data.type, data.message)
