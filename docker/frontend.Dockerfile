FROM node:18-alpine

WORKDIR /apps/frontend

# Instalar dependencias
COPY apps/frontend/package*.json ./
RUN npm install

# Copiar el código de la aplicación
COPY apps/frontend/ ./

# Construir la aplicación
RUN npm run build

# Crear directorio para el build
RUN mkdir -p /apps/frontend/.next

# Exponer el puerto
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "run", "start"] 