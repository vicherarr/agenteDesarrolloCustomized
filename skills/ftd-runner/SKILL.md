---
name: ftd-runner
description: "Ejecutor del carril rápido FTD (Fast-Track Development) para tareas cotidianas y cambios acotados. Mantiene un único documento vivo con intención, alcance, checklist de tareas, evidencia observada y siguiente paso sin burocracia innecesaria."
tags: [ftd, lane, fast-track, evidence, agility]
---

# HABILIDAD: EJECUTOR FTD (FAST-TRACK DEVELOPMENT)

Esta habilidad rige los cambios cotidianos y de bajo riesgo: corrección de bugs, endpoints sencillos, ajustes de estilos visuales o refactorizaciones locales.

---

## 1. Filosofía de FTD
*«Fricción proporcional al riesgo: la misma disciplina de evidencia que ASDD, pero sin la ceremonia de múltiples documentos cuando el cambio es directo y seguro.»*

---

## 2. El Documento Único de Característica

Todo cambio bajo FTD se registra en un único archivo en `02-DOCS/wiki/ftd/<slug>.md` basado en la plantilla `02-DOCS/wiki/ftd/templates/feature_template.md`:

```markdown
---
author: <Nombre del usuario>
branch: <feature/slug-del-cambio>
status: in-progress
---
# <Título de la Tarea>

## 1. Intención (Intent)
¿Por qué se hace este cambio y qué valor aporta?

## 2. Alcance (Scope)
Qué entra exactamente y qué queda fuera.

## 3. Checklist
- [ ] Tarea 1 — Criterio de prueba observable
- [ ] Tarea 2 — Criterio de prueba observable

## 4. Evidencia (Evidence)
Salida real pegada del comando de prueba para cada tarea marcada [x].

## 5. Siguiente Paso (Next)
Una sola línea con el paso exacto a realizar a continuación para permitir retomar el trabajo ante cualquier interrupción.
```

---

## 3. Reglas de Ejecución
1. El documento se crea **antes de comenzar a escribir código**, no después.
2. Una tarea del checklist **NO se marca con `[x]` sin haber ejecutado la prueba y copiado la evidencia observada** en la sección de Evidencias.
3. Si el cambio se complica y afecta a la arquitectura general o al contrato de base de datos, el agente debe proponer escalar la tarea al carril **ASDD**.
4. Al finalizar y verificar todas las tareas, se actualiza el estado a `status: completed` y se notifica al usuario.
