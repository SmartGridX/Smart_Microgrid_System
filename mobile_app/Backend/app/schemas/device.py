from pydantic import BaseModel

class DeviceBase(BaseModel):
    name: str
    type: str
    location: str | None = None

class DeviceCreate(DeviceBase):
    pass

class DeviceOut(DeviceBase):
    id: int

    class Config:
        orm_mode = True
