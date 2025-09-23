# app/schemas/reading.py
from pydantic import BaseModel
from datetime import datetime

class ReadingCreate(BaseModel):
    sensor_id: int
    timestamp: datetime | None = None  # if None, server will set current time
    value: float

class ReadingOut(BaseModel):
    data_id: int
    sensor_id: int
    timestamp: datetime
    value: float

    # class Config:
    #     orm_mode = True
    model_config = {
        "from_attributes": True  # enables ORM mapping
    }