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