import { ConfigModule } from "@medusajs/framework"
import * as dotenv from "dotenv"

dotenv.config({ path: "/app/.env" })

export default async (): Promise<ConfigModule> => {
  return {
    projectConfig: {
      // Inject SSL mode directly if needed
      databaseUrl: `${process.env.DATABASE_URL}?sslmode=require`,
      redisUrl: process.env.REDIS_URL || "redis://localhost:6379",
      workerMode:
        (process.env.MEDUSA_WORKER_MODE as "server" | "worker" | "shared") || "shared",
      http: {
        storeCors: process.env.STORE_CORS || "",
        adminCors: process.env.ADMIN_CORS || "",
        authCors: process.env.AUTH_CORS || "",
        jwtSecret: process.env.JWT_SECRET || "supersecret",
        cookieSecret: process.env.COOKIE_SECRET || "supersecret",
      },
    },

    admin: {
      disable: process.env.DISABLE_MEDUSA_ADMIN === "true",
      backendUrl: process.env.MEDUSA_BACKEND_URL || "http://localhost:9000",
      path: "/app", // Required for routing even if admin is disabled
    },

    modules: {
      "@medusajs/cache-redis": {
        resolve: "@medusajs/cache-redis",
        options: {
          redisUrl: process.env.REDIS_URL,
        },
      },
      "@medusajs/event-bus-redis": {
        resolve: "@medusajs/event-bus-redis",
        options: {
          redisUrl: process.env.EVENTS_REDIS_URL || process.env.REDIS_URL,
        },
      },
      "@medusajs/workflow-engine-redis": {
        resolve: "@medusajs/workflow-engine-redis",
        options: {
          redis: {
            url: process.env.WE_REDIS_URL || process.env.REDIS_URL,
          },
        },
      },
      "@medusajs/medusa/file": {
        resolve: "@medusajs/medusa/file",
        options: {
          providers: [
            {
              resolve: "@medusajs/medusa/file-s3",
              id: "s3",
              options: {
                file_url: process.env.S3_FILE_URL,
                access_key_id: process.env.S3_ACCESS_KEY_ID,
                secret_access_key: process.env.S3_SECRET_ACCESS_KEY,
                region: process.env.S3_REGION,
                bucket: process.env.S3_BUCKET,
                endpoint: process.env.S3_ENDPOINT,
                additional_client_config: {
                  forcePathStyle: true,
                },
              },
            },
          ],
        },
      },
      "@medusajs/medusa/notification": {
        resolve: "@medusajs/medusa/notification",
        options: {
          providers: [
            {
              resolve: "@medusajs/medusa/notification-sendgrid",
              id: "sendgrid",
              options: {
                channels: ["email"],
                api_key: process.env.SENDGRID_API_KEY,
                from: process.env.SENDGRID_FROM,
              },
            },
          ],
        },
      },
    },

    plugins: [],        // Optional placeholder — ready for plugin integrations
    featureFlags: {},   // Optional placeholder — activate specific Medusa features here
  }
}
