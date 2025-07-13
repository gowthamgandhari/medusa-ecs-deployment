# Stage 1: Build
FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Runtime
FROM node:20
WORKDIR /app

# Copy built app from build stage
COPY --from=build /app /app

# Copy environment and entrypoint script
COPY .env /app/.env
COPY entrypoint.sh /app/entrypoint.sh

# Install dotenv-cli globally (used by entrypoint.sh)
RUN npm install -g dotenv-cli

# Make the script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to run the script
ENTRYPOINT ["/app/entrypoint.sh"]

# Expose backend port
EXPOSE 9000

# Ensure local binaries are available in PATH
ENV PATH="/app/node_modules/.bin:${PATH}"
