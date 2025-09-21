from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database.config import SessionLocal
from schemas.user import UserCreate, UserOut
from controllers import user_controller
from auth.auth_bearer import JWTBearer

# Router with JWT protection by default
router = APIRouter(
    prefix="/users",
    tags=["Users"],
    dependencies=[Depends(JWTBearer())]  # 🔒 Protect all routes
)

# DB dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# 👇 Registration: you might want this *unprotected* 
@router.post("/register", response_model=UserOut, dependencies=[])  
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    return user_controller.create_user(db, user)

@router.get("/me", response_model=UserOut)
def read_me(current_user=Depends(user_controller.get_current_user)):
    return current_user
    # return {
    #     "id": current_user.user_id,  # map user_id -> id
    #     "name": current_user.name,
    #     "email": current_user.email
    # }

# Get all users
@router.get("/", response_model=list[UserOut])
def read_users(db: Session = Depends(get_db)):
    return user_controller.get_users(db)

# Get a single user by ID
@router.get("/{user_id}", response_model=UserOut)
def read_user(user_id: int, db: Session = Depends(get_db)):
    user = user_controller.get_user(db, user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user
    # return {
    #     "id": user.user_id,  # map user_id -> id
    #     "name": user.name,
    #     "email": user.email
    # }

# Delete a user
@router.delete("/{user_id}")
def delete_user(user_id: int, db: Session = Depends(get_db)):
    if not user_controller.delete_user(db, user_id):
        raise HTTPException(status_code=404, detail="User not found")
    return {"msg": "User deleted"}
