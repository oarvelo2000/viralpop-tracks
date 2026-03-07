#!/bin/bash

# Uso:
# ./rename_tracks.sh TEXTO_A_BUSCAR TEXTO_NUEVO

SEARCH="$1"
REPLACE="$2"
ROOT="."

if [ -z "$SEARCH" ] || [ -z "$REPLACE" ]; then
    echo "Uso: $0 texto_a_buscar texto_reemplazo"
    exit 1
fi

find "$ROOT" -type f -name "*.mp3" | while read file
do
    dir=$(dirname "$file")
    base=$(basename "$file")

    newname=$(echo "$base" | sed "s/$SEARCH/$REPLACE/g")

    if [ "$base" != "$newname" ]; then
        echo "Renaming: $base → $newname"
        mv "$file" "$dir/$newname"
    fi
done

echo "Rename process completed."