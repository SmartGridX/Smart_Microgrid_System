# app/controllers/reading_controller.py
from sqlalchemy.orm import Session
from sqlalchemy import and_, func
from datetime import datetime
from database import models

def create_reading(db: Session, sensor_id: int, value: float, timestamp: datetime | None = None):
    if timestamp is None:
        timestamp = datetime.utcnow()
    reading = models.SensorData(sensor_id=sensor_id, value=value, timestamp=timestamp)
    db.add(reading)
    db.commit()
    db.refresh(reading)
    return reading

def list_readings(db: Session, limit: int = 100, offset: int = 0):
    return db.query(models.SensorData).order_by(models.SensorData.timestamp.desc()).limit(limit).offset(offset).all()

def get_reading(db: Session, reading_id: int):
    return db.query(models.SensorData).filter(models.SensorData.data_id == reading_id).first()

def get_readings_by_device(db: Session, device_id: int, limit: int = 100, offset: int = 0):
    # join sensors to get device
    return (
        db.query(models.SensorData)
        .join(models.Sensor, models.Sensor.sensor_id == models.SensorData.sensor_id)
        .filter(models.Sensor.device_id == device_id)
        .order_by(models.SensorData.timestamp.desc())
        .limit(limit).offset(offset)
        .all()
    )

def get_readings_by_source(db: Session, source: str, limit: int = 100, offset: int = 0):
    return (
        db.query(models.SensorData)
        .join(models.Sensor, models.Sensor.sensor_id == models.SensorData.sensor_id)
        .filter(models.Sensor.type == source)
        .order_by(models.SensorData.timestamp.desc())
        .limit(limit).offset(offset)
        .all()
    )

def get_readings_by_date_range(db: Session, start_ts, end_ts, limit: int = 100, offset: int = 0):
    return (
        db.query(models.SensorData)
        .filter(and_(models.SensorData.timestamp >= start_ts, models.SensorData.timestamp <= end_ts))
        .order_by(models.SensorData.timestamp.desc())
        .limit(limit).offset(offset)
        .all()
    )
