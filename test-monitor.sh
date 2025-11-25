#!/bin/bash

LOGFILE="/var/log/monitoring.log"
PROCESS_NAME="test"
MONITOR_URL="https://test.com/monitoring/test/api"
STATE_FILE="/var/run/test-monitor.prevpid"

# Проверяем, запущен ли процесс
PID=$(pgrep -o "$PROCESS_NAME")

# Если процесс не запущен — ничего не делаем
if [[ -z "$PID" ]]; then
    exit 0
fi

# Проверяем, был ли процесс перезапущен
if [[ -f "$STATE_FILE" ]]; then
    PREV_PID=$(cat "$STATE_FILE")
else
    PREV_PID=""
fi

if [[ "$PID" != "$PREV_PID" ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') Процесс $PROCESS_NAME был перезапущен. Новый PID: $PID" >> "$LOGFILE"
fi

# Сохраняем текущий PID
echo "$PID" > "$STATE_FILE"

# Стук на сервер мониторинга
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$MONITOR_URL")

if [[ "$HTTP_CODE" -ne 200 ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') Сервер мониторинга недоступен (код $HTTP_CODE)" >> "$LOGFILE"
fi

exit 0
