from sqlalchemy.orm import Session
from database.models import Device, Sensor
from typing import Optional

def get_devices(db: Session):
    return db.query(Device).all()

def get_device(db: Session, device_id: int):
    return db.query(Device).filter(Device.device_id == device_id).first()

def create_device(db: Session, user_id: int, device_name: str, location: Optional[str] = None):
    new_device = Device(user_id=user_id, device_name=device_name, location=location, status="active")
    db.add(new_device)
    db.commit()
    db.refresh(new_device)
    return new_device

def update_device(db: Session, device_id: int, data: dict):
    device = get_device(db, device_id)
    if not device:
        return None
    for key, value in data.items():
        setattr(device, key, value)
    db.commit()
    db.refresh(device)
    return device

def delete_device(db: Session, device_id: int):
    device = get_device(db, device_id)
    if not device:
        return None
    db.delete(device)
    db.commit()
    return device
