@echo off
setlocal

echo Creating and Activating Virtual Environment...

REM Create a virtual environment named "venv"
python -m venv venv

REM Activate the virtual environment
call venv\Scripts\activate.bat

REM Upgrade pip
python -m pip install --upgrade pip wheel

REM Install dependencies from requirements.txt
pip install -r App\Config\requirement.txt

echo Installation completed.


:end
