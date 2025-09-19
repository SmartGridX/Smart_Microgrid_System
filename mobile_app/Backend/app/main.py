from fastapi import FastAPI
from fastapi.concurrency import asynccontextmanager
from app.database.config import engine, Base
from app.database.init_db import init_db


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup code
    init_db()
    print("✅ Database initialized")
    yield
    # Shutdown code (optional)
    print("⚡️ App shutting down")

app = FastAPI(title="Microgrid Monitoring Backend", lifespan=lifespan)

@app.get("/")
def health_check():
    return {"status": "Backend running, DB initialized"}
