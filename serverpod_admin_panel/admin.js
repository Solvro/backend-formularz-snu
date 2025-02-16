import AdminJS from "adminjs";
import AdminJSExpress from "@adminjs/express";
import Adapter, { Database, Resource } from "@adminjs/sql";
import Connect from "connect-pg-simple";
import session from "express-session";
import { ComponentLoader } from "adminjs";
import config from "config";
import importExportFeature from "@adminjs/import-export";
import { dark, light, noSidebar } from "@adminjs/themes";
import pg from "pg";
const { Client } = pg;

// Configs
const baseConfig = config.get("base_config");
const dbTables = config.get("tables");
const logTables = config.get("log_tables");
const dbConfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_DATABASE,
};
const adminLoginConfig = {
  email: process.env.ADMIN_EMAIL,
  password: process.env.ADMIN_PASSWORD,
};
const postgresUrl = `postgresql://${dbConfig.user}:${dbConfig.password}@${dbConfig.host}:${dbConfig.port}/${dbConfig.database}`;
const componentLoader = new ComponentLoader();

export const setupAdminJS = async (app) => {
  const Components = {
    Dashboard: componentLoader.add("Dashboard", "./components/dashboard"),
    Custom: componentLoader.add("Custom", "./components/custom"),
    PostgresQuery: componentLoader.add(
      "PostgresQuery",
      "./components/postgres_query"
    ),
  };

  AdminJS.registerAdapter({
    Database,
    Resource,
  });

  const db = await new Adapter("postgresql", {
    connectionString: postgresUrl,
    database: baseConfig.table_title,
  }).init();

  const admin = new AdminJS({
    rootPath: "/",
    componentLoader,
    dashboard: {
      component: Components.Dashboard,
    },
    databases: baseConfig.show_all_tables ? [db] : [],
    resources: [...setupTables(db)],
    assets: {
      styles: ["/main.css"],
    },
    locale: {
      language: "en",
      translations: {
        en: {
          components: {
            Login: {
              welcomeHeader: "Elo żelo!",
              welcomeMessage:
                "Witamy w panelu administracyjnym Formularza Snu Solvro",
            },
          },
        },
      },
    },
    branding: {
      logo: "https://docs.solvro.pl/_astro/logo_dark.CVKYDfDL.png",

      companyName: "KN Solvro",
      withMadeWithLove: false,
      favicon: "https://serverpod.dev/assets/img/favicon/favicon.ico",
      theme: {
        colors: {
          primary100: "#152959",
          text: "#122758",
        },
      },
    },
    pages: {
      runQuery: {
        label: "Run Query",
        component: Components.PostgresQuery,
      },
      aboutServerpod: {
        label: "About Serverpod",
        component: Components.Custom,
        handler: rawQueryHandler,
      },
    },
    //  defaultTheme: noSidebar.id,
    availableThemes: [light, dark, noSidebar],
  });

  admin.renderLogin;

  /// Setup AdminJs Routes
  app.use(admin.options.rootPath, authRouter(admin));

  admin.watch();
};

/// Execute raw query on database
const rawQueryHandler = async (request, response, context) => {
  try {
    let query = request.query.query;
    // execute query on database
    const client = new Client(postgresUrl);
    await client.connect();
    const res = await client.query(query);
    await client.end();
    return res;
  } catch (err) {
    throw new Error(err);
  }
};

// Setup AdminJS Tables
// User  and Serverpod Tables
const setupTables = (db) => {
  var tables = [];

  // User Tables
  dbTables.forEach((table) => {
    tables.push({
      resource: db.table(table),
      features: [importExportFeature({ componentLoader })],
      options: {
        navigation: {
          name: "Tables",
        },
      },
    });
  });

  // Log Tables
  if (baseConfig.show_log_tables) {
    logTables.forEach((table) => {
      tables.push({
        resource: db.table(table),
        features: [importExportFeature({ componentLoader })],
        options: {
          navigation: {
            name: "Logs",
          },
        },
      });
    });
  }

  return tables;
};

/// Setup admin login session
/// Auth session will be stored in the postgres database
const authRouter = (admin) => {
  let isProduction = process.env.NODE_ENV === "production";
  const authenticate = async (email, password) => {
    if (
      email === adminLoginConfig.email &&
      password === adminLoginConfig.password
    ) {
      return Promise.resolve(adminLoginConfig);
    }
    return null;
  };
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
};
