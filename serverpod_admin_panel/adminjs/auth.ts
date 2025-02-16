/// Setup admin login session
import { adminLoginConfig, postgresUrl } from "./config";
import Connect from "connect-pg-simple";
import session from "express-session";
import AdminJSExpress from "@adminjs/express";
import AdminJS from "adminjs";

/// Auth session will be stored in the postgres database
export function authRouter(admin: AdminJS) {
  let isProduction = process.env.NODE_ENV === "production";
  async function authenticate(email: string, password: string) {
    if (
      email === adminLoginConfig.email &&
      password === adminLoginConfig.password
    ) {
      return Promise.resolve(adminLoginConfig);
    }
    return null;
  }
  let connectSession = Connect(session);

  return AdminJSExpress.buildAuthenticatedRouter(
    admin,
    {
      authenticate,
      cookieName: "serverpodAdmin",
      cookiePassword: "sessionSecret",
    },
    null,
    {
      store: new connectSession({
        conObject: {
          connectionString: postgresUrl,
          ssl: isProduction,
        },
        tableName: "session",
        createTableIfMissing: true,
      }),
      resave: true,
      saveUninitialized: true,
      secret: "sessionSecret",
      cookie: {
        httpOnly: isProduction,
        secure: isProduction,
      },
      name: "serverpodAdmin",
    }
  );
}
