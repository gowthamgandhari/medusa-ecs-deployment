#!/bin/sh
# entrypoint.sh

set -e
echo "📦 Loading environment from /app/.env"

echo "🔧 Running predeploy..."
npx dotenv -e /app/.env -- npm run predeploy

echo "🚀 Starting Medusa server..."
npx dotenv -e /app/.env -- npm start
