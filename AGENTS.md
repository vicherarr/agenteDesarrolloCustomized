# GUÍA UNIVERSAL PARA AGENTES DE IA (AGENTS.md)

Este repositorio está estructurado bajo los principios del **RSC Harness** (meta-arnés para agentes de IA) y preparado para operar de forma nativa con **DeepSeek Harness (`dsh`)**, **Claude Code**, **Cursor**, **Gemini / Antigravity** y agentes basados en el estándar abierto de herramientas y habilidades.

---

## 1. Regla Primaria
Lee [DEEPSEEK.md](file:///home/victor/develop/AgenteIaDesarrolloCustomized/DEEPSEEK.md) y la Constitución en [02-DOCS/wiki/constitution.md](file:///home/victor/develop/AgenteIaDesarrolloCustomized/02-DOCS/wiki/constitution.md) antes de ejecutar cualquier comando modificador o escribir código.

## 2. Idioma
Todo el proyecto (interacción, documentación técnica, nombres de tareas, explicaciones y especificaciones) se gestiona en **español**.

## 3. Asesoramiento de Stack Inicial
Si el proyecto no tiene aún tecnología seleccionada, ejecuta siempre el flujo de `skills/stack-advisor/SKILL.md`:
1. Preguntar si el enfoque es **Multiplataforma** (presentar Flutter, React Native/Expo, Kotlin Multiplatform y el ecosistema .NET: .NET MAUI, Blazor Hybrid, Uno Platform / Avalonia) o **100% Nativo** (Android con Jetpack Compose vs iOS con Swift/SwiftUI vs Ambos por separado).
2. Sugerir los **Top 5 Móvil** y **Top 5 Backend** razonados para el caso de uso del usuario.
3. Registrar la elección en `02-DOCS/wiki/decisions.md`.

## 4. Memoria Viva (RSC Brain / LLM Wiki)
- Mapa de conocimiento: [02-DOCS/wiki/index.md](file:///home/victor/develop/AgenteIaDesarrolloCustomized/02-DOCS/wiki/index.md).
- Buzón de ideas y requerimientos: [02-DOCS/wiki/inbox/](file:///home/victor/develop/AgenteIaDesarrolloCustomized/02-DOCS/wiki/inbox/).
- Registro de decisiones de arquitectura: [02-DOCS/wiki/decisions.md](file:///home/victor/develop/AgenteIaDesarrolloCustomized/02-DOCS/wiki/decisions.md).

## 5. Habilidades Modulares
Todas las habilidades residen en el directorio `skills/` bajo formato estándar `SKILL.md`. Consulta la habilidad correspondiente antes de abordar una tarea.
