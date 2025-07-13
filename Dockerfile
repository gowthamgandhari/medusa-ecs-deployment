# Stage 1: Build
FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Runtime
FROM node:20
WORKDIR /app
COPY --from=build /app /app
COPY .env /app/.env
COPY entrypoint.sh /app/entrypoint.sh

# Install dotenv-cli globally
RUN npm install -g dotenv-cli

RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
EXPOSE 9000
ENV PATH="/app/node_modules/.bin:${PATH}"
