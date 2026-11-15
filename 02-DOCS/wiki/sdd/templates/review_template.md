# Plantilla de Revisión y Evidencia de Cierre ASDD

```markdown
# REVISIÓN DE CIERRE: [Nombre de la Característica]

- **Especificación**: `02-DOCS/wiki/sdd/specs/[slug].md`
- **Plan**: `02-DOCS/wiki/sdd/plans/[slug].md`
- **Fecha de Verificación**: [AAAA-MM-DD]
- **Veredicto**: [APROBADO / REQUIERE CORRECCIÓN]

---

## 1. Verificación contra la Especificación Original
| Pregunta de la Especificación | Estado | Evidencia Observada |
| :--- | :--- | :--- |
| 1. ¿El usuario puede ejecutar la acción descrita? | Cumplido | [Salida del comando o log de UI] |
| 2. ¿El resultado coincide con la referencia aprobada? | Cumplido | [Comparativa de respuesta DTO/JSON] |
| 3. ¿Se respetaron las decisiones arquitectónicas? | Cumplido | [Verificación de Clean Architecture / capas] |
| 4. ¿Se ha aportado la evidencia real de pruebas? | Cumplido | [Test log con N pruebas en verde] |
| 5. ¿Se respetó el Fuera de Alcance (sin dispersión)? | Cumplido | [Revisión de diff sin código no solicitado] |

---

## 2. Registro de Evidencias de Terminal
```text
[Pegar aquí la salida real del comando de test, compilación o ejecución]
```

---

## 3. Estado de la Rama y Preparación para Cierre
- Rama verificada: `feature/[slug]`
- Tests globales del proyecto: [Pasando en verde]
- Aprobación humana para merge a rama principal: [Pendiente / Concedida]
```
