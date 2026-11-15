#!/usr/bin/env bash
# ==============================================================================
# Hook: Stop (DeepSeek Harness)
# Se ejecuta al finalizar el turno o la sesión de trabajo.
# Registra el estado final y notifica si quedan tareas pendientes.
# ==============================================================================

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_ROOT"

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Crear directorio de logs de sesión si no existe
mkdir -p .harness/logs
echo "{\"session_stop\": \"$TIMESTAMP\"}" >> .harness/logs/sessions.log

echo "💾 [DeepSeek Harness] Sesión finalizada a las $TIMESTAMP."
exit 0
