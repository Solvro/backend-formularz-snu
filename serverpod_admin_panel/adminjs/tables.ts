// Setup AdminJS Tables

import importExportFeature from "@adminjs/import-export";
import { DatabaseMetadata } from "@adminjs/sql";
import {
  baseConfig,
  componentLoader,
  logTables,
  tableConfig,
} from "./config.js";

// User and Serverpod Tables
export function setupTables(db: DatabaseMetadata) {
  const tables = tableConfig.map((table) => ({
    resource: db.table(table),
    features: [importExportFeature({ componentLoader })],
    options: {
      navigation: {
        name: "Ustawienia Formularza Snu",
        icon: "Settings",
      },
    },
  }));

  // Log Tables
  if (baseConfig.show_log_tables) {
    logTables.forEach((table) => {
      tables.push({
        resource: db.table(table),
        features: [importExportFeature({ componentLoader })],
        options: {
          navigation: {
            name: "Logi",
            icon: "List",
          },
        },
      });
    });
  }

  return tables;
}
