# EMS — Central Tactical Dispatch & GraphHopper Routing System
### Lead Author & Architect: **Manish Kumar Sah** (Full-Stack Lead & Core Dispatch Architect)

> **College**: Arya College of Engineering and Information Technology (ACEIT), Jaipur  
> **Affiliation**: Rajasthan Technical University (RTU), Kota  
> **Course / Degree**: Bachelor of Technology (B.Tech) — Information Technology  
> **Project Guide / Mentor**: **Er Ram Babu Buri** (Associate Professor, Dept. of IT)  
> **Module Ownership**: Central Tactical Dispatcher Console, Autonomous Candidate Scoring Engine, and GraphHopper Road Network Routing  

---

## 1. Executive Summary & Module Scope
This standalone repository contains the **Central Tactical Dispatch & GraphHopper Routing Subsystem** of the Emergency Medical Services (EMS) Cloud Platform, engineered and maintained by **Manish Kumar Sah**.

This subsystem forms the operational nerve center of metropolitan emergency services. When a 911/108 call is initiated:
1. The **Tactical Dispatcher Web Console** ingests caller telemetry and MPDS priority (Alpha to Echo).
2. The **Autonomous Candidate Ranking Engine** evaluates all available ambulance units across Jaipur using a mathematically weighted multi-factor equation.
3. The **GraphHopper Routing Service** computes real turn-by-turn road network geometry on OpenStreetMap, eliminating straight-line Euclidean inaccuracies.
4. The system provides 1-click dispatch triggering simulated green-wave emergency traffic corridors.

```
 ┌────────────────────────────────────────────────────────┐
 │           911 Emergency Call & Incident Intake         │
 └───────────────────────────┬────────────────────────────┘
                             │
                             ▼
 ┌────────────────────────────────────────────────────────┐
 │       Central Tactical Dispatcher GIS Console          │
 │         (Leaflet.js · Real-Time Ambulance Fleet)       │
 └─────────────┬────────────────────────────┬─────────────┘
               │                            │
               ▼                            ▼
 ┌───────────────────────────┐ ┌───────────────────────────┐
 │ Candidate Scoring Engine  │ │  GraphHopper Road Engine  │
 │ S = 0.5·ETA + 0.3·Fit     │ │  OSM Turn-by-Turn Paths   │
 │   + 0.2·BedPressure       │ │  Drivable Traffic Travel  │
 └─────────────┬─────────────┘ └────────────┬──────────────┘
               │                            │
               └─────────────┬──────────────┘
                             ▼
 ┌────────────────────────────────────────────────────────┐
 │       1-Click Unit Assignment & Green-Wave Route       │
 └────────────────────────────────────────────────────────┘
```

---

## 2. Key Technical Contributions by Manish

### A. Central Tactical Dispatcher Console (`src/frontend/dispatcher/`)
- **Real-Time Fleet GIS**: Interactive high-performance Leaflet.js mapping console tracking 14 metropolitan ambulances with live pulsing markers.
- **Incident Intake System**: Captures emergency call details, incident coordinates, caller phone number, and MPDS triage classification (Alpha, Bravo, Charlie, Delta, Echo).
- **Fleet Filter Engine**: Live filtering by unit operational state (`AVAILABLE`, `DISPATCHED`, `EN_ROUTE`, `AT_SCENE`, `TRANSPORTING`, `OFFLINE`).
- **Green-Wave Corridor**: Visual 1-click activation that highlights the fastest path and simulates city traffic signal preemption.
- **Client-Side Simulation Bridge (`src/frontend/demo-bridge.js`)**: Dynamic state synchronization coordinating incident triggers, candidate ranking, and map route polylines.

### B. Autonomous Candidate Scoring Algorithm (`src/backend/dispatch-service/`)
- Developed and tuned the multi-factor candidate ranking algorithm:
  $$\text{Score} = (0.50 \times \text{ETA Score}) + (0.30 \times \text{Capability Fit}) + (0.20 \times \text{Hospital Bed Capacity})$$
- **ALS vs. BLS Clinical Conservation**: Prevents "ALS exhaustion" by reserving Advanced Life Support ambulances for cardiac and respiratory arrests, dispatching Basic Life Support units to non-critical calls.
- **Hospital Bed Pressure Awareness**: Integrates receiving emergency department resuscitation bay occupancy to avoid ambulance ramping delays.

### C. GraphHopper Road Network Routing Service (`src/backend/routing-service/`)
- Integrated GraphHopper OpenStreetMap GIS routing core for road-accurate ETA calculations.
- Eliminates Euclidean straight-line distance errors caused by rivers, flyovers, railway crossings, and one-way grids.
- Computes turn-by-turn road geometry and dynamic distance matrices.

---

## 3. Directory Structure
```
manish-contribution/
├── README.md                      <-- Comprehensive project documentation
├── run_module.bat                 <-- 1-Click local dispatcher web runner
├── push_to_github.bat             <-- 1-Click personal GitHub deployment
├── .gitignore                     <-- Clean repository ignore configuration
└── src/
    ├── backend/
    │   ├── dispatch-service/      <-- Java Spring Boot 3 Core Dispatch Microservice
    │   │   ├── pom.xml
    │   │   ├── Dockerfile
    │   │   └── src/main/java/com/h8/ems/dispatch/
    │   └── routing-service/       <-- Java Spring Boot 3 GraphHopper Routing Microservice
    │       ├── pom.xml
    │       ├── Dockerfile
    │       └── src/main/java/com/h8/ems/routing/
    └── frontend/
        ├── dispatcher/            <-- Tactical Dispatcher Web Console (HTML5/CSS3/JS/Leaflet)
        │   └── index.html
        └── demo-bridge.js         <-- Real-time dispatch and simulation orchestration engine
```

---

## 4. How to Run & Verify Manish's Module

### Method 1: Instant Standalone Web Demo (Recommended)
1. Double-click `run_module.bat` or execute in terminal:
   ```cmd
   python -m http.server 8081 --directory src/frontend
   ```
2. Open your browser and navigate to:
   ```
   http://localhost:8081/dispatcher/
   ```
3. Enter Tactical Credentials:
   - **Username**: `admin`
   - **Password**: `admin123`
4. Test the End-to-End Workflow:
   - Click **`+ New Incident`**
   - Choose incident severity: `Cardiac Arrest (Delta)`
   - Click **`Calculate & Rank Ambulances`**
   - Inspect the top-ranked unit and click **`Dispatch Unit`**
   - Observe live route rendering on the Leaflet GIS map.

### Method 2: Running Backend Microservices (Java 17 + Spring Boot)
```cmd
cd src/backend/dispatch-service
mvn spring-boot:run
```
In a separate terminal:
```cmd
cd src/backend/routing-service
mvn spring-boot:run
```

---

## 5. Pushing This Repository to Your Personal GitHub
You can push this independent repository to your personal GitHub account at any time:

### Option A: 1-Click Script
Double-click `push_to_github.bat` and paste your GitHub repository URL when prompted.

### Option B: Command Line
```bash
git remote add origin https://github.com/<your-username>/<your-repo-name>.git
git push -u origin main
```

---

## 6. Academic Defense & Viva Q&A Guide

**Q1: What was your specific responsibility in the team project?**
> *Answer*: "I served as the Full-Stack Lead and Core Dispatch Architect. I had end-to-end ownership of the Tactical Dispatcher GIS Console, the autonomous candidate ambulance ranking algorithm, and the GraphHopper OpenStreetMap routing integration."

**Q2: Why not just dispatch the nearest ambulance?**
> *Answer*: "Simply picking the nearest ambulance causes 'ALS exhaustion'—where Advanced Life Support ambulances are consumed by minor calls, leaving critical cardiac patients waiting. Our algorithm balances ETA (50%), clinical capability fit (30%), and destination hospital bed availability (20%)."

**Q3: How does GraphHopper improve upon standard distance queries?**
> *Answer*: "Standard Euclidean (Haversine) distance ignores rivers, bridges, one-way street directions, and road restrictions. GraphHopper navigates the actual OpenStreetMap road network graph to compute exact travel time and turn-by-turn road geometry."

**Q4: How does the dispatcher console maintain sub-second state updates?**
> *Answer*: "The console uses client-side event broadcasting with Leaflet CSS marker transitions, updating coordinates smoothly without full page refreshes."
