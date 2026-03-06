import os
import json

BASE_URL = "https://raw.githubusercontent.com/oarvelo2000/viralpop-tracks/main/tracks"

tracks = []

for root, dirs, files in os.walk("tracks"):
    for file in files:
        if file.lower().endswith(".mp3"):

            path = os.path.join(root, file)
            relative = os.path.relpath(path, "tracks")

            folder = os.path.dirname(relative)

            tracks.append({
                "name": file,
                "category": folder,
                "url": f"{BASE_URL}/{relative}"
            })

with open("index.json","w") as f:
    json.dump(tracks, f, indent=2)

print("index.json generated with", len(tracks), "tracks")