# Plantilla de Plan de Tareas ASDD

```markdown
# PLAN: [Nombre de la Característica]

- **Especificación asociada**: `02-DOCS/wiki/sdd/specs/[slug].md`
- **Fecha**: [AAAA-MM-DD]
- **Estado**: [En Progreso / Completado]

---

## 1. Desglose de Tareas de Implementación

Cada tarea es atómica y define su propio criterio de prueba y evidencia antes de pasar a la siguiente.

### Tarea 1: [Nombre de la tarea - Ej: Definir entidad de dominio y contrato de repositorio]
- **Archivos a modificar/crear**:
  - `[NEW] src/Domain/Entities/MiEntidad.ext`
  - `[NEW] src/Domain/Repositories/IMiEntidadRepository.ext`
- **Criterio de Verificación**: Compilación de la capa de Dominio sin dependencias externas.
- **Riesgo**: [Bajo / Medio / Alto]

### Tarea 2: [Nombre de la tarea - Ej: Implementar fuente de datos y repositorio]
- **Archivos a modificar/crear**:
  - `[NEW] src/Infrastructure/DataSources/RemoteDataSource.ext`
  - `[NEW] src/Infrastructure/Repositories/MiEntidadRepository.ext`
- **Criterio de Verificación**: Test unitario del repositorio con mocks pasando en verde.
- **Riesgo**: [Bajo / Medio / Alto]

### Tarea 3: [Nombre de la tarea - Ej: Conectar ViewModel / Caso de uso en UI]
- **Archivos a modificar/crear**:
  - `[NEW] src/Presentation/ViewModels/MiViewModel.ext`
  - `[NEW] src/Presentation/Views/MiVista.ext`
- **Criterio de Verificación**: Prueba de integración de estado y renderizado.
- **Riesgo**: [Bajo / Medio / Alto]

---

## 2. Matriz de Riesgos y Mitigaciones
| Riesgo Potencial | Impacto | Estrategia de Mitigación |
| :--- | :--- | :--- |
| Pérdida de conexión en móvil | Alto | Almacenamiento local previo a la emisión HTTP (Offline-First) |
| Incompatibilidad de contrato API | Alto | Generación de DTOs compartidos o tipado OpenAPI |

---

## 3. Cola de Decisiones (Decision Queue)
*Preguntas no resueltas que requieren validación del usuario humano durante la ejecución.*
- [ ] Decisión 1: [¿Se permite reintento automático infinito o máximo 3 intentos con backoff?]
```
