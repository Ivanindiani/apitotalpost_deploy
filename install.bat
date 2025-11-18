@echo off
echo Instalando API Total Mundo - Docker Compose

echo 1. Verificando Docker...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Docker no está instalado.
    echo Instale Docker Desktop para Windows Server
    pause
    exit /b 1
)

echo 2. Verificando archivo .env...
if not exist ".env" (
    echo Creando .env desde .env.example...
    copy .env.example .env
    echo POR FAVOR: Edite el archivo .env con sus configuraciones
    pause
)

echo 3. Descargando y ejecutando contenedores...
docker-compose pull
docker-compose up -d

echo 4. Verificando servicios...
docker-compose ps

echo.
echo ==================================================
echo ¡Instalación completada!
echo API: http://localhost:8181
echo Redis: localhost:6379
echo.
echo Comandos:
echo   Ver logs: docker-compose logs -f app
echo   Detener: docker-compose down
echo   Actualizar: git pull && docker-compose up -d
echo ==================================================
pause