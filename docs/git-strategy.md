# Estrategia de Git y GitHub para SmartPyme

## 1. Estructura de Ramas

### Ramas Principales
- `main`: Rama de producción
- `develop`: Rama de desarrollo principal

### Ramas de Soporte
- `feature/*`: Nuevas funcionalidades
- `bugfix/*`: Correcciones de errores
- `release/*`: Preparación de releases
- `hotfix/*`: Correcciones urgentes en producción

## 2. Flujo de Trabajo

### Desarrollo de Características
1. Crear rama desde `develop`:
   ```bash
   git checkout develop
   git pull
   git checkout -b feature/nombre-caracteristica
   ```

2. Desarrollar y hacer commits:
   ```bash
   git add .
   git commit -m "feat: descripción de la característica"
   ```

3. Actualizar con develop:
   ```bash
   git checkout develop
   git pull
   git checkout feature/nombre-caracteristica
   git merge develop
   ```

4. Crear Pull Request a `develop`

### Releases
1. Crear rama de release:
   ```bash
   git checkout develop
   git pull
   git checkout -b release/1.0.0
   ```

2. Preparar release:
   - Actualizar versiones
   - Actualizar changelog
   - Realizar pruebas finales

3. Merge a `main` y `develop`:
   ```bash
   git checkout main
   git merge release/1.0.0
   git tag -a v1.0.0 -m "Release 1.0.0"
   git checkout developgit remote add origin
   git merge release/1.0.0
   ```

### Hotfixes
1. Crear rama desde `main`:
   ```bash
   git checkout main
   git pull
   git checkout -b hotfix/nombre-fix
   ```

2. Realizar corrección y crear PR a `main`

3. Merge a `develop` después de aprobación

## 3. Convenciones de Commits

### Formato
```
<tipo>(<ámbito>): <descripción>

[body opcional]

[footer(s) opcional(es)]
```

### Tipos de Commits
- `feat`: Nueva característica
- `fix`: Corrección de error
- `docs`: Cambios en documentación
- `style`: Cambios de formato
- `refactor`: Refactorización de código
- `test`: Adición o modificación de tests
- `chore`: Actualizaciones de tareas, configuraciones, etc.

### Ejemplos
```
feat(auth): implementar autenticación con JWT
fix(api): corregir error en endpoint de usuarios
docs(readme): actualizar instrucciones de instalación
```

## 4. Configuración de GitHub

### Protección de Ramas
- `main` y `develop`:
  - Requerir revisión de código (2 aprobaciones)
  - Requerir que los tests pasen
  - Requerir que esté actualizada con la rama base
  - Bloquear cambios directos

### Pull Requests
- Título descriptivo
- Descripción detallada
- Checklist de tareas
- Screenshots para cambios de UI
- Referencia a issues

### GitHub Actions
- CI/CD pipeline:
  ```yaml
  name: CI/CD Pipeline
  on:
    push:
      branches: [ main, develop ]
    pull_request:
      branches: [ main, develop ]
  ```

## 5. Gestión de Issues

### Etiquetas
- `bug`: Error a corregir
- `enhancement`: Mejora de funcionalidad
- `documentation`: Cambios en docs
- `question`: Preguntas o dudas
- `help wanted`: Necesita ayuda
- `good first issue`: Bueno para nuevos contribuidores

### Templates
- Bug Report
- Feature Request
- Pull Request
- Documentation Update

## 6. Automatización

### GitHub Actions
- Lint y formateo
- Tests
- Build y deploy
- Análisis de seguridad
- Coverage reports

### Bots
- Dependabot: Actualizaciones de dependencias
- Stale: Cierre automático de issues inactivos
- Labeler: Etiquetado automático de PRs

## 7. Documentación

### Repositorio
- README.md
- CONTRIBUTING.md
- CHANGELOG.md
- LICENSE

### Wiki
- Guías de instalación
- Arquitectura
- Guías de contribución
- FAQs

## 8. Seguridad

### Configuración
- Branch protection rules
- Required status checks
- Required reviewers
- Code owners

### Prácticas
- No commitear credenciales
- Usar secrets para variables sensibles
- Revisión de seguridad en PRs
- Escaneo de dependencias 