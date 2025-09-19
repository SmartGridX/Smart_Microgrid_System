from .config import engine, Base
from time import sleep
from sqlalchemy import text
from sqlalchemy.exc import OperationalError
from . import models

def init_db(retries=10, delay=3):
    for i in range(retries):
        try:
                Base.metadata.create_all(bind=engine)
                print("✅ Database connected and tables created")
                with engine.connect() as conn:
                     conn.execute(
                          text("SELECT create_hypertable('sensor_data', 'timestamp', if_not_exists => TRUE);")  
                     )
                     conn.commit()
                print("✅ sensor_data is now a hypertable")
                return
        except OperationalError as e:
            print(f"Waiting for DB... attempt {i+1}/{retries}")
            sleep(delay)  
    raise Exception("DB connection failed after retries")
   