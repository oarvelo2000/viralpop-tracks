#!/bin/bash

SOURCE="/home/uadmin/n8n-data/Audios"
DEST="/home/uadmin/viralpop-tracks/tracks"

cd /home/uadmin/viralpop-tracks

echo "Syncing tracks..."

rsync -av --delete --exclude="Upload/" "$SOURCE/" "$DEST/"

echo "Generating index.json..."

python3 generate_index.py

echo "Committing changes..."

git add tracks index.json

git commit -m "auto update tracks $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes"

echo "Pushing to GitHub..."

git push origin main

echo "Done."