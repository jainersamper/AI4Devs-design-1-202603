# Configuración del entorno (LTI-JS)

Entorno preparado para **Jainer Samper** en Windows.

## Dependencias instaladas

| Herramienta | Uso |
|-------------|-----|
| **OpenJDK 21** | Ejecutar PlantUML (`tools/plantuml.jar`) |
| **Graphviz** | Render de diagramas Python (`diagrams`) y PlantUML |
| **Python 3.13** + paquetes en `requirements.txt` | `diagrams`, `graphviz`, `plantuml` |

## Instalación rápida (otro equipo)

```powershell
winget install Microsoft.OpenJDK.21 Graphviz.Graphviz
pip install -r requirements.txt
```

Descargar PlantUML (si no existe `tools/plantuml.jar`):

```powershell
New-Item -ItemType Directory -Force -Path tools
Invoke-WebRequest -Uri "https://github.com/plantuml/plantuml/releases/download/v1.2024.8/plantuml-1.2024.8.jar" -OutFile tools/plantuml.jar
```

## Generar diagramas

Desde esta carpeta:

```powershell
# SVG (casos de uso + C4)
java -jar tools/plantuml.jar -tsvg -o . diagrams.puml

# PNG arquitectura AWS
python ats_architecture.py
```

O con Make (si tienes `make` instalado): `make all`

## Verificación automática

```powershell
powershell -ExecutionPolicy Bypass -File verify.ps1
```

Regenera diagramas, valida SVG/PNG y comprueba que existan todos los entregables.

## Autor

**Jainer Samper** — iniciales JS — MasterIA4Dev Design-1
