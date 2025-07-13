import { ConfigModule } from "@medusajs/framework"

export default async () => {
  require("dotenv").config({ path: "/app/.env" })

  return {
    projectConfig: {
      database: {
        clientUrl: process.env.DATABASE_URL!,
        type: process.env.DATABASE_TYPE || "postgres",
        connectionOptions: {
          ssl: {
            rejectUnauthorized: false,
          },
        },
      },
      redisUrl: process.env.REDIS_URL || "redis://localhost:6379",
      workerMode: process.env.MEDUSA_WORKER_MODE as "server" | "worker" | "shared",
      http: {
        storeCors: process.env.STORE_CORS!,
        adminCors: process.env.ADMIN_CORS!,
        authCors: process.env.AUTH_CORS!,
        jwtSecret: process.env.JWT_SECRET || "supersecret",
        cookieSecret: process.env.COOKIE_SECRET || "supersecret",
      },
    },

    admin: {
      disable: process.env.DISABLE_MEDUSA_ADMIN === "true",
      backendUrl: process.env.MEDUSA_BACKEND_URL,
    },

    modules: [
      {
        resolve: "@medusajs/cache-redis",
        options: {
          redisUrl: process.env.REDIS_URL,
        },
      },
      {
        resolve: "@medusajs/event-bus-redis",
        options: {
          redisUrl: process.env.REDIS_URL,
        },
      },
      {
        resolve: "@medusajs/workflow-engine-redis",
        options: {
          redis: {
            url: process.env.REDIS_URL,
          },
        },
      },
    ],
  }
}
