---
name: brain-ops
description: "Gestión de memoria viva y persistente inspirada en RSC Brain y Karpathy LLM Wiki. Permite procesar y consolidar notas del Inbox (02-DOCS/wiki/inbox/) hacia páginas del wiki permanente y mantener sincronizado el mapa de conocimiento y las decisiones ADR."
tags: [brain, memory, wiki, inbox, karpathy, adr, knowledge]
---

# HABILIDAD: OPERACIONES DE MEMORIA Y WIKI (BRAIN-OPS)

Esta habilidad dota a DeepSeek Harness de memoria continua a largo plazo, evitando la pérdida de contexto entre conversaciones sucesivas.

---

## 1. Estructura de Memoria del Proyecto

```text
02-DOCS/wiki/
├── index.md             <-- Mapa de conocimiento vivo (Knowledge Map)
├── constitution.md      <-- Constitución inmutable y principios rectores
├── decisions.md         <-- Registro acumulativo de decisiones arquitectónicas (ADRs)
├── inbox/               <-- Buzón de entrada de notas en bruto, audios, requerimientos
└── knowledge/           <-- Guías y conocimientos técnicos permanentes
```

---

## 2. Flujo de Ingesta desde el Inbox (`02-DOCS/wiki/inbox/`)

Cuando el usuario deposita notas, transcripciones o ideas en bruto dentro de `02-DOCS/wiki/inbox/`:

1. **Lectura y Triaje**:
   - Analizar el contenido del archivo depositado.
   - Determinar si contiene:
     - Un requisito de producto $\rightarrow$ Redactar una propuesta o especificación en `02-DOCS/wiki/sdd/specs/`.
     - Una decisión técnica $\rightarrow$ Registrar un ADR en `02-DOCS/wiki/decisions.md`.
     - Información de dominio o arquitectura $\rightarrow$ Consolidar en `02-DOCS/wiki/knowledge/`.
2. **Consolidación**:
   - Integrar la información de forma limpia y estructurada en el destino correspondiente.
   - Añadir el enlace relevante en `02-DOCS/wiki/index.md`.
3. **Limpieza**:
   - Mover el archivo procesado a un archivo histórico o eliminarlo del inbox una vez consolidado, informando al usuario.

---

## 3. Registro de Decisiones de Arquitectura (ADRs)

Cuando se tome una decisión relevante (ejemplo: elección de base de datos, librería de estado móvil, proveedor de autenticación o arquitectura de navegación):
1. Abrir `02-DOCS/wiki/decisions.md`.
2. Asignar el siguiente identificador correlativo (`ADR-001`, `ADR-002`, etc.).
3. Documentar obligatoriamente:
   - **Título**: Acción y contexto.
   - **Fecha**: Fecha actual.
   - **Estado**: Aprobado / En Evaluación.
   - **Contexto**: El problema que resuelve.
   - **Alternativas consideradas**: Opciones descartadas y por qué.
   - **Decisión adoptada**: Opción seleccionada.
   - **Consecuencias**: Beneficios y compromisos adquiridos.
