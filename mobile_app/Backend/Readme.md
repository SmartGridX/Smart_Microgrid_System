# Backend Service – Microgrid Project

This backend service is containerized using **Docker** and managed via **docker-compose**.  
Follow the steps below to build, start, and stop the backend server.

---

## 📌 Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed and running
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- Navigate to the **`Mobile_app/Backend`** directory before running any commands

```bash
cd Mobile_app/Backend
```

## 🚀 Starting the Backend Server
1️⃣ Build the Docker images

Always build with --no-cache to ensure a clean rebuild:
```bash
docker-compose build --no-cache
```
2️⃣ Start the backend and dependencies
```bash 
docker-compose up
```


This will start the backend container along with the database (if defined in docker-compose.yml).

Logs will stream in your terminal.

If you want to run it in the background (detached mode):
```bash
docker-compose up -d
```
3️⃣ Access the backend

Once running, the backend should be available at:
```
http://localhost:8000
```

## 🛑 Stopping the Backend Server

To stop all running containers and remove volumes:
```bash
docker-compose down
```

This ensures all containers, networks, and volumes created by docker-compose are cleaned up.

---

# API Documentation

Base URL: `/`

## Auth Routes (`/auth`)

| Method | Endpoint        | Description                |
|--------|-----------------|----------------------------|
| POST   | /auth/register  | Register a new user        |
| POST   | /auth/login     | Login and get JWT token    |


## Users Routes (`/users`) 🔒 Protected (JWT required, except registration)

| Method | Endpoint        | Description                |
|--------|-----------------|----------------------------|
| POST   | /users/register | Register a new user        |
| GET    | /users/me       | Get current logged-in user |
| GET    | /users/         | List all users             |
| GET    | /users/{id}     | Get user by ID             |
| DELETE | /users/{id}     | Delete a user              |



## Device Routes (`/devices`) 🔒 Protected (JWT required)

| Method | Endpoint            | Description              |
|--------|---------------------|--------------------------|
| GET    | /devices/           | List all devices         |
| POST   | /devices/           | Add a new device         |
| GET    | /devices/{id}       | Get device details by ID |
| PUT    | /devices/{id}       | Update device            |
| DELETE | /devices/{id}       | Delete device            |


## Analytics Routes (`/analytics`) 🔒 Protected (JWT required)

| Method | Endpoint                    | Description                         |
|--------|-----------------------------|-------------------------------------|
| GET    | /analytics/summary          | Get daily & monthly analytics       |
| GET    | /analytics/source/{id}      | Get analytics by source             |
| GET    | /analytics/device/{id}      | Get analytics by device             |
| GET    | /analytics/comparison       | Compare multiple sources analytics  |


## Reading Routes (`/readings`) 🔒 Protected (JWT required)

| Method | Endpoint                    | Description                        |
|--------|-----------------------------|------------------------------------|
| POST   | /readings/                  | Create a new reading               |
| GET    | /readings/                  | List readings (with pagination)    |
| GET    | /readings/{id}              | Get reading by ID                  |
| GET    | /readings/source/{source}   | Get readings by source             |
| GET    | /readings/device/{device_id}| Get readings by device             |
| GET    | /readings/date              | Get readings by date range         |


## Reports & Alerts Routes 🔒 Protected (JWT required)

### Reports
| Method | Endpoint               | Description                  |
|--------|------------------------|------------------------------|
| GET    | /reports/generation    | Get total energy generation  |
| GET    | /reports/consumption   | Get total energy consumption |

### Alerts
| Method | Endpoint     | Description            |
|--------|--------------|------------------------|
| GET    | /alerts/     | List all alerts        |
| POST   | /alerts/     | Create a new alert     |


## Energy Sources Routes (`/sources`) 🔒 Protected (JWT required)

| Method | Endpoint           | Description               |
|--------|--------------------|---------------------------|
| GET    | /sources/          | List all energy sources   |
| POST   | /sources/          | Add a new energy source   |
| GET    | /sources/{id}      | Get source by ID          |
| PUT    | /sources/{id}      | Update source             |
| DELETE | /sources/{id}      | Delete source             |


