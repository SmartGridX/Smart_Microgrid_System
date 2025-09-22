# app/controllers/analytics_controller.py
from sqlalchemy.orm import Session
from sqlalchemy import func
from datetime import datetime
from database import models

def summary_daily(db: Session, dt_from: datetime | None = None, dt_to: datetime | None = None):
    # Returns daily total energy (sum of values) grouped by date
    q = db.query(
        func.date_trunc('day', models.SensorData.timestamp).label('day'),
        func.sum(models.SensorData.value).label('total')
    )
    if dt_from and dt_to:
        q = q.filter(models.SensorData.timestamp.between(dt_from, dt_to))
    q = q.group_by('day').order_by('day')
    return [{"day": r.day, "total": float(r.total or 0)} for r in q.all()]

def summary_monthly(db: Session, dt_from: datetime | None = None, dt_to: datetime | None = None):
    q = db.query(
        func.date_trunc('month', models.SensorData.timestamp).label('month'),
        func.sum(models.SensorData.value).label('total')
    )
    if dt_from and dt_to:
        q = q.filter(models.SensorData.timestamp.between(dt_from, dt_to))
    q = q.group_by('month').order_by('month')
    return [{"month": r.month, "total": float(r.total or 0)} for r in q.all()]

def performance_by_source(db: Session, source: str, dt_from: datetime | None = None, dt_to: datetime | None = None):
    q = db.query(
        func.date_trunc('day', models.SensorData.timestamp).label('day'),
        func.sum(models.SensorData.value).label('total')
    ).join(models.Sensor, models.Sensor.sensor_id == models.SensorData.sensor_id).filter(models.Sensor.type == source)
    if dt_from and dt_to:
        q = q.filter(models.SensorData.timestamp.between(dt_from, dt_to))
    q = q.group_by('day').order_by('day')
    return [{"day": r.day, "total": float(r.total or 0)} for r in q.all()]

def performance_by_device(db: Session, device_id: int, dt_from: datetime | None = None, dt_to: datetime | None = None):
    q = db.query(
        func.date_trunc('day', models.SensorData.timestamp).label('day'),
        func.sum(models.SensorData.value).label('total')
    ).join(models.Sensor, models.Sensor.sensor_id == models.SensorData.sensor_id).filter(models.Sensor.device_id == device_id)
    if dt_from and dt_to:
        q = q.filter(models.SensorData.timestamp.between(dt_from, dt_to))
    q = q.group_by('day').order_by('day')
    return [{"day": r.day, "total": float(r.total or 0)} for r in q.all()]

def comparison_sources(db: Session, sources: list[str], dt_from: datetime | None = None, dt_to: datetime | None = None):
    # For simplicity return total per source in the range
    q = db.query(models.Sensor.type.label('source'), func.sum(models.SensorData.value).label('total'))\
        .join(models.Sensor, models.Sensor.sensor_id == models.SensorData.sensor_id)\
        .filter(models.Sensor.type.in_(sources))
    if dt_from and dt_to:
        q = q.filter(models.SensorData.timestamp.between(dt_from, dt_to))
    q = q.group_by(models.Sensor.type)
    return [{"source": r.source, "total": float(r.total or 0)} for r in q.all()]
