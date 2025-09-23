from pydantic import BaseModel, Field

class DeviceBase(BaseModel):
    name: str = Field(..., alias="device_name")  # map SQLAlchemy user_id -> Pydantic id
    # type: str
    location: str | None = None
    # status: str

class DeviceCreate(DeviceBase):
    pass

class DeviceOut(DeviceBase):
    id: int = Field(..., alias="device_id")  # map SQLAlchemy user_id -> Pydantic id

    # class Config:
    #     orm_mode = True
    model_config = {
        "from_attributes": True  # enables ORM mapping
    }