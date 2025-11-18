@echo off
echo Actualizando API Total Mundo...

git pull
docker-compose down
docker-compose pull
docker-compose up -d

echo ¡Actualización completada!
docker-compose ps
pause