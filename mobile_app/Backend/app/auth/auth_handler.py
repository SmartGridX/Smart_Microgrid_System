import time
import jwt
from passlib.context import CryptContext
from datetime import datetime, timedelta
from fastapi import HTTPException

SECRET_KEY = "SECRET123"  # ⚠️ move to env var in production
ALGORITHM = "HS256"

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def hash_password(password: str) -> str:
    return pwd_context.hash(password)

def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)

def encode_jwt(user_id: int) -> str:
    payload = {
        "sub": user_id,
        "exp": datetime.utcnow() + timedelta(hours=1)
    }
    return jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM)

def decode_jwt(token: str):
    try:
        decoded = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        return decoded if decoded["exp"] >= time.time() else None
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid or expired token")
