import AdminJS from "adminjs";
import Adapter, { Database, Resource } from "@adminjs/sql";

import { dark, light, noSidebar } from "@adminjs/themes";
import { setupTables } from "./adminjs/tables";
import { baseConfig, componentLoader, postgresUrl } from "./adminjs/config";
import { authRouter } from "./adminjs/auth";
import { locale } from "./adminjs/locale";
import { branding } from "./adminjs/branding";

// Configs
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
    locale,
    branding,
    pages: {},
    availableThemes: [light, dark, noSidebar],
  });

  admin.renderLogin;

  /// Setup AdminJs Routes
  app.use(admin.options.rootPath, authRouter(admin));

  admin.watch();
};
