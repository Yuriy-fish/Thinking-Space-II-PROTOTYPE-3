# GeoAnalog Matchmaker 🚀
### NASA Space Apps Challenge 2026 // Planetary Analog Intelligence Platform

> **"Identify Earth Locations that Analog the Permanent Moon Base Locations and Mars."**

GeoAnalog Matchmaker is an advanced planetary science decision-support platform designed to compare, rank, discover, and characterize high-fidelity terrestrial analogs for high-priority exploration targets on the **Moon** (Artemis south pole candidates, lava tubes, maria) and **Mars** (Jezero, Gale, Valles Marineris, Mawrth Vallis).

---

## ⚡ One-Click Quick Launch

You do not need to configure complex environments or install packages manually. Use any of the one-click launchers:

### Option 1: Windows Double-Click (Recommended)
Simply double-click **`launch.bat`** (or **`run.bat`**) in the project folder.
- Automatically verifies or locates Node.js.
- Automatically installs dependencies (`npm install`) on first run.
- Starts the web server on `http://localhost:5173/`.
- Opens your default web browser automatically.

### Option 2: PowerShell
Open PowerShell in this directory and run:
```powershell
.\launch.ps1
```

### Option 3: Standard Node / npm CLI
```bash
# 1. Install dependencies (first time only)
npm install

# 2. Start server and auto-open browser
npm start

# Or start dev server:
npm run dev
```

---

## 🧪 Automated Testing & Scientific Verification

Run all 6 scientific engine test suites (120 unit tests verifying MCDA, HADE, ML, Portfolio Optimization, Knowledge Graph, and Mission Dossier export):
```bash
npm test
```

To create a production-optimized build:
```bash
npm run build
```

---

## 🗺️ Key Platform Capabilities

1. **Analysis Workspace**: Multi-Criteria Decision Analysis (MCDA) evaluating Analog Similarity Index (ASI), Data Coverage & Confidence (DCC), Operational Feasibility (OFS), and Landing Safety Tiers across 7 scientific categories.
2. **Hidden Analog Discovery Engine (HADE)**: Geospatial discovery engine conducting coarse-to-fine global screening, process-based analog matching (impact cratering, volcanism, lacustrine, hydrothermal, aeolian), multispectral mineral similarity (EMIT & CRISM), and environmental clustering.
3. **Multi-Objective Composite Portfolio Optimizer**: Synthesizes multi-site analog field campaign portfolios to maximize comprehensive planetary coverage (PCI > 90%).
4. **Explainable ML & Novelty Detection**: k-NN feature similarity search, Isolation Forest-inspired multivariate outlier detection, and non-dominated Pareto frontier trade-off analysis.
5. **Interactive Mapping & 3D Celestial Globes**: High-resolution 2D MapLibre GL mapping (Earth OpenFreeMap, NASA Worldview GIBS, ESA Copernicus DEM) and 3D Three.js celestial globes for Moon and Mars.
6. **Mission Dossier & Multi-Format Reporting**: One-click generation of briefing dossiers with radar charts, delta tables, and exports in JSON, CSV, GeoJSON, PNG, and print-ready PDF.

---

## 📜 Scientific Datasets & Space Agency Provenance
All baseline data is verified from official planetary archives:
- **NASA Planetary Data System (PDS)** & Astromaterials Acquisition and Curation Office
- **NASA LRO** (LROC, LOLA, Diviner Lunar Radiometer)
- **NASA MRO** (CRISM, HiRISE, CTX) & Mars Odyssey (THEMIS)
- **NASA POWER API** (Live surface climatology & solar irradiance)
- **ESA Copernicus** & USGS Astrogeology Science Center

---

## 📄 License
MIT License. Developed for NASA Space Apps Challenge 2026.
