// Setup AdminJS Tables

import importExportFeature from "@adminjs/import-export";
import { DatabaseMetadata } from "@adminjs/sql";
import {
  baseConfig,
  componentLoader,
  logTables,
  tableConfig,
} from "./config.js";
import { ResourceOptions, ResourceWithOptions, ViewHelpers } from "adminjs";

export function setupTables(db: DatabaseMetadata) {
  const tables: ResourceWithOptions[] = [
    ...tableConfig.map((table) => {
      const isSingleton = table === "global_config";
      return {
        resource: db.table(table),
        features: [importExportFeature({ componentLoader })],
        options: {
          href:
            table === "global_config"
              ? ({ h, resource }) => {
                  return h.showUrl(resource.decorate().id(), "1", undefined);
                }
              : undefined,
          navigation: {
            name: "Ustawienia Formularza Snu",
            icon: "Settings",
          },
          actions: {
            list: {
              showFilter: false,
            },
            new: {
              isAccessible: !isSingleton,
              isVisible: !isSingleton,
            },
            delete: {
              isAccessible: !isSingleton,
              isVisible: !isSingleton,
            },
            bulkDelete: {
              isAccessible: !isSingleton,
              isVisible: !isSingleton,
            },
          },
        } as ResourceOptions,
      };
    }),
    ...(baseConfig.show_log_tables
      ? logTables.map((table) => ({
          resource: db.table(table),
          features: [importExportFeature({ componentLoader })],
          options: {
            navigation: {
              name: "Logi",
              icon: "List",
            },
            actions: {
              list: {
                showFilter: true,
              },
              new: {
                isAccessible: false,
                isVisible: false,
              },
              delete: {
                isAccessible: false,
                isVisible: false,
              },
              bulkDelete: {
                isAccessible: false,
                isVisible: false,
              },
            },
          },
        }))
      : []),
  ];

  return tables;
}
