from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Float, Text
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from .config import Base

# 1. User & Authentication
class User(Base):
    __tablename__ = "users"
    user_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    password_hash = Column(String(255), nullable=False)
    role = Column(String(20), default="normal user")
    created_at = Column(DateTime(timezone=True), server_default=func.now())

    devices = relationship("Device", back_populates="owner")

class UserSession(Base):
    __tablename__ = "user_sessions"
    session_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    login_time = Column(DateTime(timezone=True), server_default=func.now())
    logout_time = Column(DateTime(timezone=True))

# 2. IoT Device & Data
class Device(Base):
    __tablename__ = "devices"
    device_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    device_name = Column(String(100), nullable=False)
    location = Column(String(100))
    status = Column(String(20), default="inactive")
    last_seen = Column(DateTime(timezone=True))

    owner = relationship("User", back_populates="devices")
    sensors = relationship("Sensor", back_populates="device")

class Sensor(Base):
    __tablename__ = "sensors"
    sensor_id = Column(Integer, primary_key=True, index=True)
    device_id = Column(Integer, ForeignKey("devices.device_id"))
    type = Column(String(50))
    unit = Column(String(20))

    device = relationship("Device", back_populates="sensors")
    data = relationship("SensorData", back_populates="sensor")

class SensorData(Base):
    __tablename__ = "sensor_data"
    data_id = Column(Integer, primary_key=True)
    timestamp = Column(DateTime(timezone=True), primary_key=True, server_default=func.now())
    sensor_id = Column(Integer, ForeignKey("sensors.sensor_id"))
    value = Column(Float, nullable=False)

    sensor = relationship("Sensor", back_populates="data")

# 3. Alerts & Control
class Alert(Base):
    __tablename__ = "alerts"
    alert_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.user_id"))
    device_id = Column(Integer, ForeignKey("devices.device_id"))
    type = Column(String(50))
    message = Column(Text)
    timestamp = Column(DateTime(timezone=True), server_default=func.now())

class ControlCommand(Base):
    __tablename__ = "control_commands"
    command_id = Column(Integer, primary_key=True, index=True)
    device_id = Column(Integer, ForeignKey("devices.device_id"))
    command = Column(String(50))
    status = Column(String(20), default="pending")
    timestamp = Column(DateTime(timezone=True), server_default=func.now())
