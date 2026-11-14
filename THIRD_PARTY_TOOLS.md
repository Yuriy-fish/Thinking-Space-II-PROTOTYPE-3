# THIRD PARTY TOOLS, LIBRARIES & ACCESS SERVICES

**Project:** GeoAnalog Matchmaker — NASA Space Apps Challenge 2026  
**Document ID:** `THIRD_PARTY_TOOLS.md`  
**Date:** 2026-11-14  
**Compliance Standard:** Open Source Licensing & Intellectual Property Integrity

---

## 1. RUNTIME LIBRARIES & TOOLCHAIN

| Component | Version | License | Role in Application | Repository / Provider |
| :--- | :--- | :--- | :--- | :--- |
| **Vite** | 5.4.21 | MIT | Production bundling, ES module dev server, asset optimization | `github.com/vitejs/vite` |
| **MapLibre GL JS** | 5.5.0 | BSD-3-Clause | 2D vector & raster planetary cartography, custom WebGL styles | `github.com/maplibre/maplibre-gl-js` |
| **Three.js** | 0.167.0 | MIT | 3D WebGL celestial sphere rendering, orbital controls, raycasting | `github.com/mrdoob/three.js` |
| **Chart.js** | 4.4.4 | MIT | Multi-criteria radar charts, dimensional weighting visualization | `github.com/chartjs/Chart.js` |
| **Node.js LTS** | 20.18.0 | MIT / Node.js Foundation | Client build runtime, headless validation test harnesses | `nodejs.org` |
| **ESLint** | 9.x | MIT | Static code analysis and syntax enforcement | `eslint.org` |

---

## 2. FONTS & DESIGN ASSETS

| Asset | Provider | License | Role |
| :--- | :--- | :--- | :--- |
| **Space Grotesk** | Florian Karsten / Google Fonts | SIL Open Font License (OFL 1.1) | Primary interface and heading typography |
| **Inter** | Rasmus Andersson / Google Fonts | SIL Open Font License (OFL 1.1) | Body text and high-legibility UI components |
| **IBM Plex Mono** | Mike Abbink / IBM / Google Fonts | SIL Open Font License (OFL 1.1) | Technical telemetry, coordinates, and parameter data |

---

## 3. SCIENTIFIC DATA ACCESS APIS & SERVICES

| Service Name | Operator | Endpoint / Access Protocol | Authentication | Operational Status |
| :--- | :--- | :--- | :--- | :--- |
| **NASA POWER API** | NASA Langley Research Center | `https://power.larc.nasa.gov/api/temporal/daily/point` | None (Open REST API) | **VERIFIED & OPERATIONAL** |
| **NASA PDS Geosciences** | Washington University / NASA | `https://pds-geosciences.wustl.edu/` | None (Direct HTTP directory) | **VERIFIED & OPERATIONAL** |
| **OpenFreeMap** | Community / OpenMapTiles | `https://tiles.openfreemap.org/styles/liberty` | None (Public Vector Server) | **OPERATIONAL** |
| **NASA Trek WMTS** | NASA JPL / SSERVI | `https://trek.nasa.gov/tiles/` | None (Public WMTS Tiles) | **OPERATIONAL (CORS-Proxy ready)** |
| **Copernicus Data Space** | ESA / European Commission | `https://dataspace.copernicus.eu/` | Open Access Copernicus License | **CATALOGED** |
| **JAXA G-Portal** | JAXA | `https://gportal.jaxa.jp/gpr/` | Open Data Policy | **CATALOGED** |
| **CSA EODMS** | Canadian Space Agency | `https://www.eodms-sgdot.nrcan-rncan.gc.ca/` | Open Government Licence | **CATALOGED** |

---

## 4. ARCHITECTURAL BOUNDARIES & GOVERNANCE

1. **Client-Side Heavy Architecture:** All MCDA algorithms, spatial geometry calculations (Haversine distances, polygon areas), and rendering execute client-side inside the browser.
2. **Zero Synthetic Datasets:** No simulated or placeholder data is substituted for unobserved measurements. Missing values remain `null`.
3. **Resource Disposal:** All MapLibre maps, Three.js WebGL renderers, animation loops, and Chart.js instances implement explicit `cleanup()` lifecycles to prevent GPU and memory leaks.
4. **Bandwidth Governance:** Full multi-gigabyte planetary orbital rasters are not downloaded to the browser; standard tiling and AOI-focused bounding boxes are utilized.
