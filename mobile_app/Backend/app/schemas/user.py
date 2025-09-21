from pydantic import BaseModel, EmailStr, Field

class UserCreate(BaseModel):
    name: str
    email: EmailStr
    password: str

class UserOut(BaseModel):
    # id: int
    # The database/SQLAlchemy model has user_id, but in this Pydantic model, I want to call it id.
    id: int = Field(..., alias="user_id")  # map SQLAlchemy user_id -> Pydantic id
    name: str
    email: EmailStr

    # class Config:
    #     orm_mode = True
    #     fields = {'id': 'user_id'}  # map SQLAlchemy user_id -> Pydantic id
    model_config = {
        "from_attributes": True  # enables ORM mapping
    }