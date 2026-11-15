# Plantilla de Especificación ASDD (Agent Spec-Driven Development)

> **Regla de la Constitución**: El agente NO escribirá código de implementación hasta que el usuario humano haya revisado y aprobado explícitamente esta especificación.

---

```markdown
# SPEC: [Nombre descriptivo de la funcionalidad o módulo]

- **Slug**: [slug-identificador]
- **Autor**: [Nombre del desarrollador / usuario]
- **Fecha**: [AAAA-MM-DD]
- **Estado**: [Borrador / Pendiente de Aprobación / Aprobada]
- **Riesgo Estimado**: [Bajo / Medio / Alto]

---

## 1. ¿Qué puede hacer el usuario exactamente?
Describe el flujo de usuario de extremo a extremo en términos funcionales y observables.
- **Acción inicial**: ¿Dónde pulsa o qué endpoint invoca?
- **Flujo paso a paso**: ¿Qué pasos intermedios realiza el sistema?
- **Casos límite (Edge Cases)**: ¿Qué ocurre si falla la red, el token expira o el dato es inválido?

---

## 2. ¿Qué resultado observable obtiene? (Frente a una referencia aprobada)
- **Resultado esperado**: Detalle de la pantalla o respuesta JSON exacta.
- **Referencia de contraste**: Mockup visual, respuesta HTTP de referencia (RFC 7807 o JSON DTO), o contrato OpenAPI pactado.
```json
{
  "ejemplo_campo": "valor_esperado"
}
```

---

## 3. ¿Qué restricciones y decisiones previas debe respetar?
- Decisiones vigentes en `02-DOCS/wiki/decisions.md` (ADRs).
- Principios de la Constitución (`02-DOCS/wiki/constitution.md`).
- Convenciones del stack (Clean Architecture, MVVM, nombres de archivos, inyección de dependencias).

---

## 4. ¿Cómo se demuestra que funciona? (Criterio de Evidencia)
El agente debe demostrar que funciona ejecutando y documentando:
- [ ] Comando de prueba unitaria o de integración: `[comando exacto]`
- [ ] Verificación de contrato de API o tipo: `[comando de lint / test]`
- [ ] Comprobación visual o funcional: `[pasos para reproducir]`
- **Evidencia requerida**: Captura de terminal o log de ejecución real incorporado al progreso.

---

## 5. Fuera de Alcance (Out of Scope)
*Lista explícita de lo que el agente NO debe implementar en esta tarea para evitar sobrediseño o dispersión (feature creep).*
- NO implementar: [Ejemplo: Pagos con Apple Pay en esta fase]
- NO refactorizar: [Ejemplo: Sistema de navegación global]
- NO asumir: [Ejemplo: Sincronización multi-dispositivo en tiempo real]
```
