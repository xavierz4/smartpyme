# SmartPyme

Plataforma de inteligencia artificial para pequeñas y medianas empresas.

## Descripción

SmartPyme es una plataforma que utiliza inteligencia artificial para ayudar a las PYMES a optimizar sus operaciones, mejorar la toma de decisiones y aumentar su productividad.

## Características

- Asistente virtual inteligente
- Análisis predictivo
- Automatización de tareas
- Integración con múltiples servicios
- Dashboard interactivo

## Requisitos del Sistema

- Docker y Docker Compose
- Node.js 18+
- Python 3.11+
- Git

## Instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/smartpyme.git
cd smartpyme
```

2. Configurar variables de entorno:
```bash
# Copiar archivos de ejemplo
cp config/.env.example config/.env
cp apps/frontend/.env.example apps/frontend/.env
cp apps/backend/.env.example apps/backend/.env

# Editar los archivos .env con tus configuraciones
```

3. Iniciar los servicios con Docker:
```bash
docker-compose up --build
```

## Estructura del Proyecto

```
smartpyme/
├── apps/
│   ├── frontend/          # Aplicación Next.js
│   └── backend/           # API FastAPI
├── config/                # Configuraciones
├── docker/               # Configuraciones Docker
├── docs/                 # Documentación
└── scripts/              # Scripts de utilidad
```

## Variables de Entorno

### Configuración General
- `APP_NAME`: Nombre de la aplicación
- `APP_ENV`: Entorno (development/production)

### Backend
- `BACKEND_PORT`: Puerto del backend
- `BACKEND_HOST`: Host del backend
- `JWT_SECRET`: Clave secreta para JWT
- `DB_*`: Configuración de base de datos

### Frontend
- `NEXT_PUBLIC_API_URL`: URL de la API
- `NEXT_PUBLIC_APP_URL`: URL de la aplicación

## Desarrollo

1. Iniciar el backend:
```bash
cd apps/backend
python -m venv venv
source venv/bin/activate  # o .\venv\Scripts\activate en Windows
pip install -r requirements.txt
uvicorn main:app --reload
```

2. Iniciar el frontend:
```bash
cd apps/frontend
npm install
npm run dev
```

## Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Tu Nombre - [@tutwitter](https://twitter.com/tutwitter) - email@ejemplo.com

Link del Proyecto: [https://github.com/tu-usuario/smartpyme](https://github.com/tu-usuario/smartpyme)
