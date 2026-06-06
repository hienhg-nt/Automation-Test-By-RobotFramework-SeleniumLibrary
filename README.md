# Robot Test Suite

This repository contains a Robot Framework test suite for an e-commerce demo site. It uses SeleniumLibrary for browser automation, Pabot for parallel execution, DataDriver for data-driven tests, and Allure for reporting.

**Requirements**
- Python 3.8+
- Git (optional)
- Chrome / Firefox browsers (for cross-browser runs)
- Install Python dependencies:

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

See [requirements.txt](requirements.txt) for exact packages.

**Environment**
Create a `.env` file in the project root (or set environment variables) with the following keys used by the tests:
- BASE_URL
- BROWSER
- EMAIL
- PASSWORD

These are loaded by [helpers/env_loader.py](helpers/env_loader.py).

**Run tests**
- Run all tests (single process):

```powershell
.\run.ps1
```

- Run a parallel suite (pabot):

```powershell
.\run_parallel.ps1
```

- Cross-browser parallel run (uses `chrome.txt` and `firefox.txt` argument files):

```powershell
.\run_crossbrowswer_parallel.ps1
```

The scripts run tests and then generate/open an Allure report. You can also run the Robot or Pabot commands directly; examples are in the scripts (`run.ps1`, `run_parallel.ps1`, `run_crossbrowswer_parallel.ps1`).

Allure manual commands (if needed):

```powershell
allure generate results/allure-results -o results/allure-report --clean
allure open results/allure-report
```

**Test data**
- JSON input for checkout tests: `testdata/checkout.json`
- Excel data for invalid register cases: `testdata/user.xlsx` (used via DataDriver)

**Project structure**
- `tests/` - Robot test cases (e.g. [tests/register.robot](tests/register.robot), [tests/login_logout.robot](tests/login_logout.robot))
- `resources/` - Robot resource files containing page keywords and locators
- `locator/` - Locator resources
- `helpers/` - Python helpers (`env_loader.py`, `data_reader.py`, `data_gen.py`)
- `config/` - Configuration resource files
- `testdata/` - Test data files (JSON, XLSX)
- `results/` - Test outputs and Allure report
- `allure-results/` - Allure results folder
- `pabot_results/` - Pabot execution output

**Key files**
- [run.ps1](run.ps1) — run tests and generate Allure report
- [run_parallel.ps1](run_parallel.ps1) — run parallel jobs with Pabot
- [run_crossbrowswer_parallel.ps1](run_crossbrowswer_parallel.ps1) — cross-browser Pabot run
- [requirements.txt](requirements.txt) — Python dependencies

**Notes & Troubleshooting**
- Ensure the `.env` values are correct (especially `BASE_URL`, `EMAIL`, `PASSWORD`).
- If Allure CLI isn't available, install it separately (e.g., via package manager) so `allure generate` and `allure open` work.
- For browser compatibility, make sure the appropriate WebDriver and browser versions are installed and accessible.

If you want, I can:
- Add a sample `.env.example` file
- Commit the README and a `.env.example`
- Add a small script to create/activate the virtual environment automatically

