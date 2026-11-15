#!/usr/bin/env bash
# ==============================================================================
# Hook: PostToolUse (DeepSeek Harness)
# Se ejecuta tras el uso de herramientas.
# Comprueba que los archivos protegidos (como constitution.md) no se hayan
# alterado accidentalmente sin confirmación.
# ==============================================================================

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_ROOT"

# Si git está activo, verificar cambios en archivos protegidos
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    DIFF_CONSTITUTION=$(git status --porcelain 02-DOCS/wiki/constitution.md 2>/dev/null || echo "")
    if [ -n "$DIFF_CONSTITUTION" ]; then
        echo "⚠️ ALERTA DE INTEGRIDAD: Se han detectado modificaciones en '02-DOCS/wiki/constitution.md'."
        echo "   La Constitución sólo debe modificarse tras acuerdo explícito con el usuario."
    fi
fi

exit 0
