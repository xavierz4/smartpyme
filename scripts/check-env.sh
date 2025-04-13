#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=== Verificación de Variables de Entorno ===${NC}\n"

# Verificar archivos .env
echo -e "${BLUE}=== Archivos .env ===${NC}"
if [ -f "../config/.env" ]; then
    echo -e "${GREEN}Archivo .env central encontrado en:${NC} $(realpath ../config/.env)"
else
    echo -e "${YELLOW}No se encontró archivo .env central${NC}"
fi

if [ -f "../apps/frontend/.env" ]; then
    echo -e "${GREEN}Archivo .env del frontend encontrado en:${NC} $(realpath ../apps/frontend/.env)"
else
    echo -e "${YELLOW}No se encontró archivo .env del frontend${NC}"
fi

# Verificar entorno de backend
echo -e "\n${BLUE}=== Backend ===${NC}"
if [ -d "../apps/backend/venv" ]; then
    echo -e "${GREEN}Entorno virtual de Python activo${NC}"
    source ../apps/backend/venv/bin/activate
    echo "Python path: $(which python)"
    echo "Python version: $(python --version)"
    deactivate
else
    echo -e "${YELLOW}Entorno virtual de Python no encontrado${NC}"
fi

# Verificar variables de entorno del backend
if [ -f "../config/.env" ]; then
    echo -e "\n${GREEN}Variables de entorno del backend:${NC}"
    grep -E "^(APP_|DB_|BACKEND_|JWT_)" ../config/.env
fi

# Verificar entorno de frontend
echo -e "\n${BLUE}=== Frontend ===${NC}"
if [ -d "../apps/frontend/node_modules" ]; then
    echo -e "${GREEN}Node.js dependencias instaladas${NC}"
    echo "Node version: $(node --version)"
    echo "NPM version: $(npm --version)"
else
    echo -e "${YELLOW}Node.js dependencias no encontradas${NC}"
fi

# Verificar variables de entorno del frontend
if [ -f "../apps/frontend/.env" ]; then
    echo -e "\n${GREEN}Variables de entorno del frontend:${NC}"
    grep -E "^(NEXT_PUBLIC_)" ../apps/frontend/.env
fi

# Verificar Docker
echo -e "\n${BLUE}=== Docker ===${NC}"
if command -v docker &> /dev/null; then
    echo -e "${GREEN}Docker está instalado${NC}"
    echo "Docker version: $(docker --version)"
    echo "Docker Compose version: $(docker-compose --version)"
    
    # Verificar servicios Docker
    if [ -f "../docker-compose.yml" ]; then
        echo -e "\n${GREEN}Servicios Docker configurados:${NC}"
        docker-compose config --services
    fi
else
    echo -e "${YELLOW}Docker no está instalado${NC}"
fi

echo -e "\n${BLUE}=== Integraciones ===${NC}"
if [ -f "../config/.env" ]; then
    echo -e "${GREEN}Variables de integración:${NC}"
    grep -E "^(OPENAI_|HUGGINGFACE_)" ../config/.env
fi

echo -e "\n${YELLOW}Nota: Algunas variables sensibles pueden estar ocultas por seguridad${NC}" 