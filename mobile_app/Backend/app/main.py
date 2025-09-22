from fastapi import FastAPI
from fastapi.concurrency import asynccontextmanager
from database.config import engine, Base
from database.init_db import init_db
from routes import user_routes , auth_routes , analytics, readings ,device_routes, report_routes , source_routes


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup code
    init_db()
    print("✅ Database initialized")
    yield
    # Shutdown code (optional)
    print("⚡️ App shutting down")

app = FastAPI(title="Microgrid Monitoring Backend", lifespan=lifespan)


app.include_router(auth_routes.router)
app.include_router(user_routes.router)
app.include_router(readings.router)
app.include_router(analytics.router)
app.include_router(device_routes.router)
app.include_router(report_routes.router)
app.include_router(source_routes.router)  