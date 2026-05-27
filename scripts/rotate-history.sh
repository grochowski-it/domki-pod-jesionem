#!/bin/bash
HISTORY_FILE="history.md"
ARCHIVE_FILE="history.archive.md"
TEMP_FILE="history.tmp"
DATE_CUTOFF=$(date -d "14 days ago" +%s)

if [ ! -f "$HISTORY_FILE" ]; then
    exit 0
fi

HEADER=$(head -n 1 "$HISTORY_FILE")
echo "$HEADER" > "$TEMP_FILE"

touch "$ARCHIVE_FILE"

tail -n +2 "$HISTORY_FILE" | while read -r line; do
    if [[ "$line" =~ \[(.*)\] ]]; then
        DATE_STR="${BASH_REMATCH[1]}"
        DATE_TS=$(date -d "$DATE_STR" +%s 2>/dev/null)
        if [ -n "$DATE_TS" ] && [ "$DATE_TS" -lt "$DATE_CUTOFF" ]; then
            echo "$line" >> "$ARCHIVE_FILE"
            continue
        fi
    fi
    echo "$line" >> "$TEMP_FILE"
done

mv "$TEMP_FILE" "$HISTORY_FILE"

if [ $(wc -l < "$HISTORY_FILE") -gt 50 ]; then
    echo "$HEADER" > "$TEMP_FILE"
    tail -n 49 "$HISTORY_FILE" >> "$TEMP_FILE"
    mv "$TEMP_FILE" "$HISTORY_FILE"
fi
