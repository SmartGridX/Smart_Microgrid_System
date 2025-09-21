# app/auth/auth_bearer.py
from typing import Optional
from fastapi import Request, HTTPException
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from .auth_handler import decode_jwt
from auth.auth_handler import SECRET_KEY, ALGORITHM
from jose import jwt, JWTError  
class JWTBearer(HTTPBearer):
    def __init__(self, auto_error: bool = True):
        super().__init__(auto_error=auto_error)

    # Note: return type is Optional[...] to match HTTPBearer.__call__ signature
    async def __call__(self, request: Request) -> str:
        # Call parent's __call__ which returns Optional[HTTPAuthorizationCredentials]
        credentials: Optional[HTTPAuthorizationCredentials] = await super(JWTBearer, self).__call__(request)

        if credentials:
            if not credentials.scheme == "Bearer":
                raise HTTPException(status_code=403, detail="Invalid authentication scheme.")
            user_id = self.verify_jwt(credentials.credentials)
            if not user_id:
                raise HTTPException(status_code=401, detail="Invalid or expired token")
            # return credentials.credentials
            return user_id
        else:
            raise HTTPException(status_code=403, detail="Invalid authorization code.")

    def verify_jwt(self, jwtoken: str) -> bool:
        try:
            payload = jwt.decode(jwtoken, SECRET_KEY, algorithms=[ALGORITHM])
            return payload.get("sub")
        except JWTError:
            return False
