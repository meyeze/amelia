# AMELIA ✈️
*Finding your lost flights.*

An interactive map of every drone flight in the Drone Lawrence archive — 796 flights and counting, spanning 2017 to today, recovered from DJI flight logs, Aloft exports, footage telemetry (SRT), and archive folder forensics.

**Live site:** https://meyeze.github.io/amelia/

Named for Amelia Earhart of Atchison, KS — because this project exists to find flights that DJI's abandoned cloud lost.

## How it works

- `index.html` — the whole app: CesiumJS globe, filters, flight cards, stats
- `data/flights.json` — the unified flight dataset (all sources, deduped)
- `data/tracks/*.json` — full-resolution GPS tracks for decrypted DJI logs

Flight data comes from a parsing pipeline (run in Claude Cowork sessions) that decrypts DJI `.txt` flight records via the DJI keychain API, parses Aloft CSV exports, reconstructs paths from video SRT telemetry, and geocodes pre-GPS archive folders.

## Deploying updates

Run `Deploy Amelia.command` (double-click). It commits everything in this folder and pushes to `main`; GitHub Pages redeploys automatically.

## Data sources

| Source | Era | What it provides |
|---|---|---|
| DJI RC (RM330) flight records | 2022–present | Full decrypted telemetry, flight paths |
| Aloft (Kittyhawk) export | 2017–2021 | Flight summaries, locations |
| Video SRT telemetry | 2021–present | Recovered paths for lost flights |
| Archive folder metadata | 2018+ | Approximate locations for pre-log era |
