# Smart Microgrid System – Prototype Website

## 📌 Project Overview
This is a **prototype website** created as part of the **Smart Microgrid System** project for the SIH Hackathon.  
The website serves as the **problem statement portal**, where visitors can:
- Understand the **problem statement** we are addressing.
- Learn about the **developer/team members** behind the project.
- Explore the **homepage** showcasing the prototype.

---

## 🌍 Problem Statement
The **Smart Microgrid System** focuses on building an efficient, scalable, and intelligent energy management solution.  
The challenges include:
- Monitoring and controlling distributed energy resources.
- Enabling renewable energy integration.
- Providing real-time analytics for smart energy decisions.
- Ensuring sustainability and reliability of microgrids.

This website acts as a **platform** to communicate the problem statement, objectives, and our proposed solution.

---

## 👨‍💻 Developers
This project is developed by **Team SmartGridX**.  
Contributors:
- Avinash Rout  
- [Add other team members here...]

---

## 🏠 Website Pages
- **Home Page** – Introduction and quick overview.  
- **Problem Statement** – Detailed description of the challenge.  
- **Developers** – About the developers and contributors.  

---

## ⚙️ Development Setup

### 1. Clone the Repository
```bash
git clone https://github.com/SmartGridX/Smart_Microgrid_System.git
cd Smart_Microgrid_System/website
```
### 2. Build and Run with Docker

Make sure you have Docker Desktop installed and running.


Your site will be available at 👉 http://localhost:8080
Without compose (manual):
```
docker build -t my-website .
docker run -d -p 8080:80 my-website
```

### 📂 Project Structure
```text
website/
│── assets
    │── dev_img        # Images of Developers
    │── logo.jpg        # Logo of Project
│── scripts   # scripting Files
    │── script.js         # JavaScript logic
│── Struct        # Structures
    │── dev.html        # Homepage
    │── features.html        # Homepage
│── styles        # Stylesheet Files
    │── styles.css        # Stylesheet logic
│── Dockerfile        # Docker build instructions
│── index.html        # Homepage
│── README.md        # Readme File
│── docker-compose.yml # Compose configuration
```