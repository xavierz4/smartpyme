# Colores para la salida
$Green = [System.ConsoleColor]::Green
$Yellow = [System.ConsoleColor]::Yellow
$Blue = [System.ConsoleColor]::Blue

Write-Host "=== Verificación de Variables de Entorno ===" -ForegroundColor $Blue
Write-Host ""

# Verificar archivo .env activo
$envPath = Join-Path -Path ".." -ChildPath "config\.env"
if (Test-Path $envPath) {
    Write-Host "Archivo .env activo encontrado en: $envPath" -ForegroundColor $Green
} else {
    Write-Host "No se encontró archivo .env activo" -ForegroundColor $Yellow
}

# Verificar entorno de backend
Write-Host "`n=== Backend ===" -ForegroundColor $Blue
$venvPath = Join-Path -Path ".." -ChildPath "apps\backend\venv"
if (Test-Path $venvPath) {
    Write-Host "Entorno virtual de Python activo" -ForegroundColor $Green
    $pythonPath = Join-Path -Path $venvPath -ChildPath "Scripts\python.exe"
    if (Test-Path $pythonPath) {
        Write-Host "Python path: $pythonPath"
        Write-Host "Python version: $(& $pythonPath --version)"
    }
} else {
    Write-Host "Entorno virtual de Python no encontrado" -ForegroundColor $Yellow
}

# Verificar variables de entorno del backend
if (Test-Path $envPath) {
    Write-Host "`nVariables de entorno del backend:" -ForegroundColor $Green
    Get-Content $envPath | Select-String -Pattern "^(APP_|DB_|BACKEND_|JWT_)"
}

# Verificar entorno de frontend
Write-Host "`n=== Frontend ===" -ForegroundColor $Blue
$nodeModulesPath = Join-Path -Path ".." -ChildPath "apps\frontend\node_modules"
if (Test-Path $nodeModulesPath) {
    Write-Host "Node.js dependencias instaladas" -ForegroundColor $Green
    Write-Host "Node version: $(node --version)"
    Write-Host "NPM version: $(npm --version)"
} else {
    Write-Host "Node.js dependencias no encontradas" -ForegroundColor $Yellow
}

# Verificar variables de entorno del frontend
if (Test-Path $envPath) {
    Write-Host "`nVariables de entorno del frontend:" -ForegroundColor $Green
    Get-Content $envPath | Select-String -Pattern "^(NEXT_PUBLIC_)"
}

# Verificar Docker
Write-Host "`n=== Docker ===" -ForegroundColor $Blue
if (Get-Command docker -ErrorAction SilentlyContinue) {
    Write-Host "Docker está instalado" -ForegroundColor $Green
    Write-Host "Docker version: $(docker --version)"
    Write-Host "Docker Compose version: $(docker-compose --version)"
    
    # Verificar servicios Docker
    $dockerComposePath = Join-Path -Path ".." -ChildPath "docker-compose.yml"
    if (Test-Path $dockerComposePath) {
        Write-Host "`nServicios Docker configurados:" -ForegroundColor $Green
        docker-compose config --services
    }
} else {
    Write-Host "Docker no está instalado" -ForegroundColor $Yellow
}

Write-Host "`n=== Integraciones ===" -ForegroundColor $Blue
if (Test-Path $envPath) {
    Write-Host "Variables de integración:" -ForegroundColor $Green
    Get-Content $envPath | Select-String -Pattern "^(OPENAI_|HUGGINGFACE_)"
}

Write-Host "`nNota: Algunas variables sensibles pueden estar ocultas por seguridad" -ForegroundColor $Yellow 