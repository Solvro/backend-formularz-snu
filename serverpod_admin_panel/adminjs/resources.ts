// Setup AdminJS Tables

import importExportFeature from "@adminjs/import-export";
import { DatabaseMetadata } from "@adminjs/sql";
import { baseConfig, componentLoader, logTables } from "./config.js";
import { ResourceOptions, ResourceWithOptions, ViewHelpers } from "adminjs";

export function setupTables(db: DatabaseMetadata) {
  const navigation = {
    name: "Ustawienia Formularza Snu",
    icon: "Settings",
  };
  const tables: ResourceWithOptions[] = [
    {
      resource: db.table("global_config"),
      features: [importExportFeature({ componentLoader })],
      options: {
        href: ({ h, resource }) => {
          return h.showUrl(resource.decorate().id(), "1", undefined);
        },
        navigation,
        properties: {
          id: {
            isVisible: false,
          },
        },
        actions: {
          list: {
            showFilter: false,
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
      } as ResourceOptions,
    },
    {
      resource: db.table("participants"),
      features: [importExportFeature({ componentLoader })],
      options: { navigation },
    },
    {
      resource: db.table("form_entries"),
      features: [importExportFeature({ componentLoader })],
      options: { navigation },
    },
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
