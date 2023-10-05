@echo off
echo Iniciando script...

REM Verificar si el directorio del entorno virtual existe.
if not exist "venv\" (
    echo Creando entorno virtual...
    python -m venv venv
) else (
    echo El entorno virtual ya existe.
)

REM Activar el entorno virtual
call venv\Scripts\activate.bat

REM Verificar si FastAPI está instalado en el entorno virtual.
pip list | findstr "FastAPI" >nul
if errorlevel 1 (
    echo Instalando dependencias...
    pip install -r requirements.txt
) else (
    echo FastAPI ya está instalado.
)

echo Ejecutando servidor FastAPI...
uvicorn app:app --reload
pause
