# ⚡ Microgrid Monitoring System

A real-time IoT-based microgrid monitoring system that collects field data from sensors, stores it in the cloud, and provides an interactive dashboard and mobile app for monitoring energy usage, generation, and system health.

---

## 🚀 Project Overview
Microgrids are small-scale power systems that integrate renewable energy, storage, and local loads. Effective monitoring is essential to ensure stability, reliability, and efficiency.  
This project provides a *cloud-based microgrid monitoring solution* using IoT devices, scalable databases, and modern dashboards.

---

## 🔑 Features
- 📡 *Real-time Data Collection* from IoT devices (voltage, current, power, frequency, etc.)
- ☁ *Cloud Database* for scalable and reliable storage
- 📊 *Interactive Dashboard* to visualize energy usage and system performance
- 🔔 *Alerts & Notifications* for overloads and anomalies
- 👥 *Multi-user Support* (500+ concurrent users)
- 📱 *Cross-Platform Access* via web and mobile app

---

## 🛠 Tech Stack
- *IoT Devices*: ESP32 / Raspberry Pi + sensors (ACS712, ZMPT101B, etc.)
- *Protocols*: MQTT, HTTP
- *Backend*: Node.js (Express) / Python (FastAPI)
- *Databases*:
  - PostgreSQL → Users, Devices, Alerts
  - InfluxDB / TimescaleDB → Sensor data (time-series)
- *Frontend*: React.js Dashboard, Grafana for quick visualization
- *Mobile App*: Flutter / React Native

---

## 📂 System Architecture
```text
 IoT Devices (ESP32, Pi, etc.)
        |
        v
   MQTT Broker (Mosquitto / AWS IoT Core)
        |
        v
  Ingestion Service (Node.js / FastAPI)
        |
        |--- Writes → Time-series DB (InfluxDB / TimescaleDB)
        |--- Writes → SQL DB (PostgreSQL for Users/Devices/Alerts)
        |
        v
   API Layer (REST/GraphQL, behind Load Balancer)
        |
        v
  Dashboard (React / Grafana)  <-->  Mobile App (Flutter / React Native)