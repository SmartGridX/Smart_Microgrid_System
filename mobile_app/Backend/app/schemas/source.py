from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime

class SourceBase(BaseModel):
    name: str
    # description: str | None = None
    type: Optional[str] = None
    capacity_kw: Optional[float]  
    location: Optional[str]
    status: Optional[str] = "inactive"
    last_maintenance: Optional[datetime] = None


class SourceCreate(SourceBase):
    pass

class SourceOut(SourceBase):
    id: int = Field(..., alias="source_id")

    # class Config:
    #     orm_mode = True
    model_config = {
        "from_attributes": True  # enables ORM mapping
    }
