#!/bin/sh

echo "Starting Medusa app at: $(date)"

# Start Medusa in the background
dotenv -e /app/.env -- npm run start &

# Start a 2-hour sleep in the background
sleep 7200 &

# Wait for all background processes to finish
wait
