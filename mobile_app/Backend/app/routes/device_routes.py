from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from schemas.device import DeviceBase, DeviceCreate, DeviceOut
from controllers import device_controller
from database.models import Device
from pydantic import BaseModel
from typing import Optional, List

from database.config import SessionLocal
from auth.auth_bearer import JWTBearer  

# DB dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

router = APIRouter(prefix="/devices", tags=["Devices"] , dependencies=[Depends(JWTBearer())])  # protect all device routes

class DeviceCreate(BaseModel):
    user_id: int
    device_name: str
    location: Optional[str] = None

class DeviceUpdate(BaseModel):
    device_name: Optional[str] = None
    location: Optional[str] = None
    status: Optional[str] = None

# GET /devices → List all devices
# @router.get("/", response_model=List[dict])
@router.get("/", response_model=List[DeviceOut])
def list_devices(db: Session = Depends(get_db)):
    devices = device_controller.get_devices(db)
    return devices

# POST /devices → Add new device
# @router.post("/", response_model=dict)
@router.post("/", response_model=DeviceOut)
def add_device(data: DeviceCreate, db: Session = Depends(get_db)):
    return device_controller.create_device(db, data.user_id, data.device_name, data.location)

# GET /devices/{id} → Get device details
# @router.get("/{device_id}", response_model=dict)
@router.get("/{device_id}", response_model=DeviceOut)
def get_device(device_id: int, db: Session = Depends(get_db)):
    device = device_controller.get_device(db, device_id)
    if not device:
        raise HTTPException(status_code=404, detail="Device not found")
    return device

# PUT /devices/{id} → Update device
# @router.put("/{device_id}", response_model=dict)
@router.put("/{device_id}", response_model=DeviceOut)
def update_device(device_id: int, data: DeviceUpdate, db: Session = Depends(get_db)):
    updated = device_controller.update_device(db, device_id, data.dict(exclude_unset=True))
    if not updated:
        raise HTTPException(status_code=404, detail="Device not found")
    return updated

# DELETE /devices/{id}
@router.delete("/{device_id}")
def delete_device(device_id: int, db: Session = Depends(get_db)):
    deleted = device_controller.delete_device(db, device_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Device not found")
    return {"message": f"Device {device_id} deleted successfully"}
