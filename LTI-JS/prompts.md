# Prompts — LTI-JS (Jainer Samper)

Registro de instrucciones enviadas al asistente de IA para el ejercicio de **análisis y diseño del ATS de LTI** (MasterIA4Dev, Design-1).

| Campo | Valor |
|-------|-------|
| **Autor** | Jainer Samper (iniciales: JS) |
| **Entrega** | Carpeta `LTI-JS/` · documento `LTI-JS.md` |
| **Herramientas** | ChatGPT 4.5, Claude (Lean Canvas HTML), Copilot en VS Code (diagrama AWS), Cursor (revisión final) |

Antes de producir los entregables, definí el contexto de negocio: motivación de LTI, problema en PYMEs con alto volumen de candidatos y objetivo del primer release.

---

## Prompt 1

Somos LTI, empresa de software que crea soluciones SaaS y PaaS orientadas a pymes. Varios clientes nos han pedido un sistema de seguimiento de candidatos: unos no están contentos con lo que usan y otros gestionan el proceso sin herramienta dedicada.

Actúa como responsable de producto con conocimiento del mercado ATS y de las necesidades de las pymes. Yo soy Jainer Samper, director general de LTI, y hoy arrancamos el proyecto. El objetivo de la sesión es pasar de cero a un diseño de sistema amplio que podamos presentar al CTO.

Primero: enumera entre 10 y 15 capacidades más relevantes de los ATS SaaS que ya existen en el mercado, ordenadas de mayor a menor importancia.

## Prompt 2

Gracias. Me llama la atención que la publicación y difusión de ofertas aparezca tan arriba. ¿Por qué la consideras más crítica que las posiciones 2, 3 y 5, que en mi día a día suelen consumir muchísimo tiempo?

## Prompt 3

Has dicho «históricamente» y creo que ahí está la clave. En los últimos años el contexto económico ha sido complicado (¿coincides?) y muchas vacantes reciben un aluvión de solicitudes en muy poco tiempo. ¿Tienes referencias o datos recientes sobre este comportamiento?

## Prompt 4

La lista revisada me convence, pero veo 14 puntos frente a los 15 originales. ¿Cuál falta?

## Prompt 4 (continuación)

Perfecto. Con una priorización alineada al mercado actual, apóyate en tendencias de selección y en avances tecnológicos (por ejemplo IA) y propón: (a) funcionalidades nuevas que podríamos incorporar y (b) capacidades existentes que convendría modernizar.

## Prompt 5

De acuerdo, plantea una arquitectura general del sistema.

## Prompt 5 (continuación)

¿Puedes representarla con un diagrama en sintaxis Mermaid?

## Prompt 5 (continuación)

Añade también un Lean Canvas para entender el modelo de negocio.

## Prompt 6

Me refería a que generes el Lean Canvas como artefacto aparte, no solo la descripción.

## Prompt 7

¿Puedes acercarlo al formato clásico de Lean Canvas? Referencia: https://www.leanfoundry.com/articles/what-is-lean-canvas  
Si Mermaid se queda corto, sugiere otra herramienta.

## Prompt 8

Probemos con PlantUML y regenera el diagrama respetando el layout del ejemplo anterior.

## Prompt 8 (continuación)

Aún no encaja. Genera un HTML autocontenido (CSS incluido) inspirado en: https://litslink.com/wp-content/uploads/2020/06/google-lean-canvas-model-1.png

## Prompt 9

Voy a probar otro modelo. Entre los LLM de OpenAI disponibles, ¿cuál tiene más probabilidad de generar bien esa tabla en HTML?

## Prompt 10

No conozco «4 Turbo». Tengo 4o, 4, 4.5 (tú) y o3-mini-high (indica buen rendimiento en código y razonamiento).

## Prompt 10 (continuación)

Dices que usas GPT-4, pero la interfaz indica GPT-4.5. ¿Puedes aclararlo?

## Prompt 11

Entonces crea un archivo HTML independiente que se parezca lo máximo posible a la imagen de referencia.

*Aquí dejé GPT-4.5 y usé Claude; obtuve el HTML del Lean Canvas.*

## Prompt 12

*De vuelta en ChatGPT:*  
Ya tengo el Lean Canvas en HTML. Léelo y devuélveme aquí los 12 encabezados de bloques.

## Prompt 13

Tus propuestas me gustan, pero necesito textos más breves para que quepan en la plantilla. Condensa lo acordado y reescríbelo aquí.

## Prompt 13 (continuación)

Integra lo ya validado con las nuevas ideas y sintetiza el resultado para que encaje en el formato del canvas.

## Prompt 14

Profundicemos en diseño: enumera los 10 casos de uso más importantes, en orden, como se los explicarías a otro analista de software.

## Prompt 15

Elabora diagramas de casos de uso en PlantUML para estos tres escenarios:

1. Recepción y análisis automático del currículum del candidato  
2. Filtrado y clasificación de candidatos asistido por IA  
3. Preselección mediante chatbot conversacional  

## Prompt 16

Ahora, como arquitecto de software, dibuja el modelo entidad-relación en Mermaid.

## Prompt 17

Mantén el rol de arquitecto: plantea tres alternativas de arquitectura con detalle razonable y defiende cuál recomendarías.

## Prompt 18

Genera un diagrama de sistema en PlantUML asumiendo despliegue en AWS.

## Prompt 19

¿Puedes incorporar los iconos oficiales de AWS desde la librería estándar de PlantUML?

## Prompt 20

Falló: error 404 en `Compute/ECS.puml`. Usa los iconos empaquetados con `!include <awslib/...>` en lugar de URLs remotas.

## Prompt 21

Sigue fallando. Según la documentación, la v18 va integrada y se referencia así:

```
!include <aws/common>
!include <aws/Compute/AmazonECS/AmazonECS>
```

Actualiza el resto de includes. Referencia útil: https://github.com/milo-minderbinder/AWS-PlantUML

*En este punto probé Copilot en VS Code; mejoró los imports, pero el diagrama seguía con errores.*

## Prompt 22

*De nuevo en ChatGPT:*  
He invertido mucho tiempo sin éxito. ¿Qué alternativas hay para renderizar este diagrama?

## Prompt 23

Optemos por Python. ¿Qué dependencias y pasos necesito?

## Prompt 24

Tres indicaciones:

1. Tuve que corregir el script para ejecutarlo; usa siempre la versión que ya funciona como base.  
2. No me convence que los microservicios accedan directo a la base de datos; deberían pasar por el servicio central salvo que propongas otra opción.  
3. Orienta el diagrama de izquierda a derecha, no de arriba abajo.

## Prompt 25

Redacta media página de introducción al ATS/LTI, después ventajas frente a competidores y valor aportado, y al final el listado de funcionalidades principales (las ~15 que acordamos). Colócalo al inicio del README.

## Prompt 26

Desarrolla cada funcionalidad con un poco más de detalle.

---

## Prompts adicionales (diagramas finales)

* Genera el diagrama de casos de uso «Recepción y análisis de CV» en PlantUML y añade una explicación breve en texto.  
* Genera el diagrama de casos de uso «Filtrado y ranking con IA» en PlantUML y añade una explicación breve en texto.  
* Genera el diagrama de casos de uso «Preselección con chatbot» en PlantUML y añade una explicación breve en texto.

---

* Elabora el diagrama C4 de contexto (nivel 1) con la librería C4 de PlantUML.  
* Elabora el diagrama C4 de contenedores (nivel 2) con la misma librería.  
* Elabora el diagrama C4 de componentes del contenedor «Microservicios de IA» (nivel 3).
