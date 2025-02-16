// Setup AdminJS Tables

import importExportFeature from "@adminjs/import-export";
import { DatabaseMetadata } from "@adminjs/sql";
import { baseConfig, componentLoader, logTables } from "./config";

// User and Serverpod Tables
export function setupTables(db: DatabaseMetadata) {
  const tables = [
    {
      resource: db.table("participants"),
      features: [importExportFeature({ componentLoader })],
      options: {
        navigation: {
          name: "Ustawienia Formularza Snu",
          icon: "Sleep",
        },
      },
    },
    {
      resource: db.table("form_entries"),
      features: [importExportFeature({ componentLoader })],
      options: {
        navigation: {
          name: "Ustawienia Formularza Snu",
        },
      },
    },
    {
      resource: db.table("global_config"),
      features: [importExportFeature({ componentLoader })],
      options: {
        navigation: {
          name: "Ustawienia Formularza Snu",
        },
      },
    },
  ];

  // Log Tables
  if (baseConfig.show_log_tables) {
    logTables.forEach((table) => {
      tables.push({
        resource: db.table(table),
        features: [importExportFeature({ componentLoader })],
        options: {
          navigation: {
            name: "Logi",
          },
        },
      });
    });
  }

  return tables;
}
