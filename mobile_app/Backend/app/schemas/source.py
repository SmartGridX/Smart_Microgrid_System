from pydantic import BaseModel

class SourceBase(BaseModel):
    name: str
    description: str | None = None

class SourceCreate(SourceBase):
    pass

class SourceOut(SourceBase):
    id: int

    class Config:
        orm_mode = True
