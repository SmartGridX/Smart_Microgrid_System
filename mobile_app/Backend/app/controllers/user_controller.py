from sqlalchemy.orm import Session
from fastapi import HTTPException, status, Depends
from jose import JWTError, jwt
from fastapi.security import OAuth2PasswordBearer
from database import models
from routes.auth_routes import get_db
from schemas.user import UserCreate
from auth.auth_handler import hash_password

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")

SECRET_KEY = "SECRET123"
ALGORITHM = "HS256"

def create_user(db: Session, user: UserCreate):
    # Check if email already exists
    existing_user = db.query(models.User).filter(models.User.email == user.email).first()
    if existing_user:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Email already registered")

    # Hash the password
    hashed_pw = hash_password(user.password)

    # Create user
    db_user = models.User(
        name=user.name,   # 👈 Match schema naming
        email=user.email,
        password=hashed_pw
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Invalid or expired token",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        sub = payload.get("sub")
        if sub is None:
            raise credentials_exception
        
        user_id: int = int(sub)
        if user_id is None:
            raise credentials_exception
    except JWTError:
        raise credentials_exception
    # user = db.query(models.User).filter(models.User.id == user_id).first()
    user = db.query(models.User).filter(models.User.user_id == user_id).first()
    if user is None:
        raise credentials_exception
    return user

    #     try:
    #         user_id = int(sub)
    #         user = user = db.query(models.User).filter(models.User.id == user_id).first()
    #     except ValueError:
    #         user = user = db.query(models.User).filter(models.User.id == user_id).first()
        
    #     if not user:
    #         raise credentials_exception
    #     return user
    # except HTTPException:
    #     # just re-raise any exceptions from decode_jwt
    #     raise

def get_user_by_email(db: Session, email: str):
    return db.query(models.User).filter(models.User.email == email).first()

def get_users(db: Session):
    return db.query(models.User).all()

def get_user(db: Session, user_id: int):
    # return db.query(models.User).filter(models.User.id == user_id).first()
    return db.query(models.User).filter(models.User.user_id == user_id).first()

def delete_user(db: Session, user_id: int):
    # user = db.query(models.User).filter(models.User.id == user_id).first()
    user = db.query(models.User).filter(models.User.user_id == user_id).first()
    if user:
        db.delete(user)
        db.commit()
        return True
    return False
