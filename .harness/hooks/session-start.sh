#!/usr/bin/env bash
# ==============================================================================
# Hook: SessionStart (DeepSeek Harness)
# Verifica la presencia de la Constitución, el estado de la memoria (RSC Brain)
# y tareas activas en los carriles ASDD y FTD.
# ==============================================================================

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_ROOT"

echo "================================================================================"
echo "⚡ [DeepSeek Harness] Iniciando sesión en: $(basename "$PROJECT_ROOT")"
echo "================================================================================"

# 1. Comprobar Constitución
if [ -f "02-DOCS/wiki/constitution.md" ]; then
    echo "✓ Constitución activa: 02-DOCS/wiki/constitution.md"
else
    echo "⚠️ AVISO: No se encontró constitution.md. Se requiere inicialización."
fi

# 2. Comprobar decisiones arquitectónicas
if [ -f "02-DOCS/wiki/decisions.md" ]; then
    DECISIONS_COUNT=$(grep -c "^### " "02-DOCS/wiki/decisions.md" 2>/dev/null || echo "0")
    echo "✓ Registro de decisiones (ADR): $DECISIONS_COUNT decisión(es) registrada(s)."
fi

# 3. Comprobar notas pendientes en Inbox (RSC Brain)
INBOX_COUNT=$(find "02-DOCS/wiki/inbox" -type f ! -name ".*" 2>/dev/null | wc -l || echo "0")
if [ "$INBOX_COUNT" -gt 0 ]; then
    echo "📥 Inbox (Brain): Hay $INBOX_COUNT elemento(s) sin procesar en 02-DOCS/wiki/inbox/."
fi

# 4. Comprobar tareas en progreso ASDD
ASDD_PROGRESS_COUNT=$(find "02-DOCS/wiki/sdd/progress" -type f ! -name ".*" 2>/dev/null | wc -l || echo "0")
if [ "$ASDD_PROGRESS_COUNT" -gt 0 ]; then
    echo "📋 ASDD en progreso: $ASDD_PROGRESS_COUNT ejecución(es) activa(s) en 02-DOCS/wiki/sdd/progress/."
fi

# 5. Comprobar características en progreso FTD
FTD_COUNT=$(find "02-DOCS/wiki/ftd" -maxdepth 1 -type f -name "*.md" 2>/dev/null | wc -l || echo "0")
if [ "$FTD_COUNT" -gt 0 ]; then
    echo "⚡ FTD activo: $FTD_COUNT documento(s) de cambio directo en 02-DOCS/wiki/ftd/."
fi

# 6. Comprobar rama Git
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "desconocida")
    echo "🌿 Rama Git actual: $CURRENT_BRANCH"
    if [ "$CURRENT_BRANCH" = "main" ] || [ "$CURRENT_BRANCH" = "master" ]; then
        echo "⚠️ PRECAUCIÓN: Estás en la rama raíz ($CURRENT_BRANCH). Se recomienda trabajar en ramas 'feature/*'."
    fi
fi

echo "================================================================================"
exit 0
