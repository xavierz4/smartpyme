# SmartPyme

SmartPyme es una plataforma integral diseñada para ayudar a las pequeñas y medianas empresas a optimizar sus operaciones y mejorar su eficiencia mediante el uso de inteligencia artificial.

## Características Principales

- **Asistente Virtual Inteligente**: Interfaz conversacional para interactuar con la plataforma
- **Gestión de Inventario**: Control y optimización de stock
- **Análisis de Ventas**: Visualización y análisis de datos de ventas
- **Gestión de Clientes**: Base de datos de clientes y seguimiento de interacciones
- **Automatización de Procesos**: Optimización de tareas repetitivas
- **Reportes y Analytics**: Generación de informes y análisis de datos

## Estructura del Proyecto

```
smartpyme/
├── apps/                # Aplicaciones principales
├── docker/             # Configuraciones Docker
├── docs/               # Documentación
├── tests/              # Tests
├── infra/              # Infraestructura y configuración
├── scripts/            # Scripts de utilidad
├── data/               # Datos y recursos
├── shared/             # Código compartido
├── integrations/       # Integraciones con servicios externos
├── agents/             # Agentes de IA y automatización
├── docker-compose.yml  # Configuración de Docker Compose
├── .env.example        # Ejemplo de variables de entorno
├── .env                # Variables de entorno (no versionado)
├── .gitignore         # Archivos ignorados por Git
└── LICENSE            # Licencia del proyecto
```

## Configuración del Entorno

### Requisitos Previos
- Python 3.11+
- Node.js 18+
- Docker y Docker Compose
- Git

### Configuración Inicial

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/smartpyme.git
cd smartpyme
```

2. Ejecutar script de configuración:
```bash
# Linux/Mac
chmod +x scripts/setup-env.sh
./scripts/setup-env.sh

# Windows (PowerShell)
.\scripts\setup-env.ps1
```

3. Configurar variables de entorno:
```bash
# Copiar archivo de ejemplo
cp config/.env.example config/.env

# Editar el archivo .env con tus configuraciones
```

4. Iniciar los servicios con Docker:
```bash
docker-compose up -d
```

### Estructura de Configuración

```
smartpyme/
├── config/
│   ├── .env.example      # Ejemplo de variables de entorno
│   ├── .env.development  # Variables para desarrollo
│   └── .env.production   # Variables para producción
├── apps/
│   ├── backend/
│   │   └── venv/        # Entorno virtual de Python
│   └── frontend/
└── docker/
    └── ...
```

### Variables de Entorno

Las variables de entorno están organizadas en secciones:

1. **Configuración General**
   - APP_NAME
   - APP_ENV
   - APP_DEBUG
   - APP_URL

2. **Base de Datos**
   - DB_HOST
   - DB_PORT
   - DB_DATABASE
   - DB_USERNAME
   - DB_PASSWORD

3. **Backend**
   - BACKEND_PORT
   - BACKEND_URL
   - JWT_SECRET
   - JWT_EXPIRATION

4. **Frontend**
   - NEXT_PUBLIC_API_URL
   - NEXT_PUBLIC_APP_URL

5. **Integraciones**
   - OPENAI_API_KEY
   - HUGGINGFACE_API_KEY

6. **Docker**
   - DOCKER_NETWORK
   - DOCKER_BACKEND_SERVICE
   - DOCKER_FRONTEND_SERVICE
   - DOCKER_DB_SERVICE

## Desarrollo

### Estructura de Directorios

- **apps/**: Contiene las aplicaciones principales del proyecto
- **docker/**: Configuraciones y archivos relacionados con Docker
- **docs/**: Documentación del proyecto
- **tests/**: Pruebas unitarias y de integración
- **infra/**: Configuración de infraestructura
- **scripts/**: Scripts de utilidad para desarrollo y despliegue
- **data/**: Datos y recursos utilizados por la aplicación
- **shared/**: Código compartido entre diferentes partes del proyecto
- **integrations/**: Integraciones con servicios externos
- **agents/**: Agentes de IA y automatización

## Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Tu Nombre - [@tu-twitter](https://twitter.com/tu-twitter) - email@ejemplo.com

Link del Proyecto: [https://github.com/tu-usuario/smartpyme](https://github.com/tu-usuario/smartpyme)
