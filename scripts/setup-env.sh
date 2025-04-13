#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Configurando entorno de desarrollo...${NC}"

# Crear directorio config si no existe
mkdir -p ../config

# Copiar archivo de ejemplo si no existe
if [ ! -f "../config/.env" ]; then
    cp "../config/.env.example" "../config/.env"
    echo -e "${GREEN}Archivo .env creado desde .env.example${NC}"
else
    echo -e "${YELLOW}El archivo .env ya existe, no se sobrescribirá${NC}"
fi

# Configurar backend
cd ../apps/backend
if [ ! -d "venv" ]; then
    python -m venv venv
    echo -e "${GREEN}Entorno virtual de Python creado${NC}"
fi

# Activar entorno virtual y instalar dependencias
source venv/bin/activate  # En Windows: .\venv\Scripts\activate
pip install -r requirements.txt
echo -e "${GREEN}Dependencias de Python instaladas${NC}"

# Configurar frontend
cd ../frontend
npm install
echo -e "${GREEN}Dependencias de Node.js instaladas${NC}"

echo -e "${GREEN}Configuración completada!${NC}"
echo -e "${YELLOW}Recuerda editar el archivo config/.env con tus configuraciones específicas${NC}" 