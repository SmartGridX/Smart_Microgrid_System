from sqlalchemy.orm import Session
from database.models import SensorData, Alert
from sqlalchemy.sql import func

def total_generation(db: Session):
    # Example: sum of all sensor values of type "generation"
    result = db.query(func.sum(SensorData.value)).all()
    return {"total_generation": result[0][0] or 0}

def total_consumption(db: Session):
    # Example: sum of all sensor values of type "consumption"
    result = db.query(func.sum(SensorData.value)).all()
    return {"total_consumption": result[0][0] or 0}

def list_alerts(db: Session):
    return db.query(Alert).all()

def create_alert(db: Session, user_id: int, device_id: int, type: str, message: str):
    new_alert = Alert(user_id=user_id, device_id=device_id, type=type, message=message)
    db.add(new_alert)
    db.commit()
    db.refresh(new_alert)
    return new_alert
