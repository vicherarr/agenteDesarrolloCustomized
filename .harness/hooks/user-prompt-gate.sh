#!/usr/bin/env bash
# ==============================================================================
# Hook: UserPromptSubmit (DeepSeek Harness)
# Se ejecuta antes de procesar una petición del usuario.
# Recuerda la política de ramas y comprueba si hay decisiones pendientes.
# ==============================================================================

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_ROOT"

# Si estamos en un repositorio git, recordar no commitear en main sin aprobación
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "")
    if [ "$CURRENT_BRANCH" = "main" ] || [ "$CURRENT_BRANCH" = "master" ]; then
        echo "🛡️ [Guardia de Rama] Rama activa: $CURRENT_BRANCH. Recuerda: para features nuevas se recomienda crear una rama antes de escribir código."
    fi
fi

exit 0
