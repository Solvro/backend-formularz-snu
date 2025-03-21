// Setup AdminJS Tables

import importExportFeature from "@adminjs/import-export";
import { DatabaseMetadata } from "@adminjs/sql";
import { baseConfig, componentLoader, logTables } from "./config.js";
import { ResourceOptions, ResourceWithOptions, ViewHelpers } from "adminjs";

export function setupTables(db: DatabaseMetadata) {
  const navigation = {
    name: "Formularz Snu",
    icon: "Settings",
  };
  const tables: ResourceWithOptions[] = [
    {
      resource: db.table("global_config"),
      features: [],
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
      options: { navigation, filterProperties: ["email", "name"] },
    },
    {
      resource: db.table("form_entries"),
      features: [importExportFeature({ componentLoader })],
      options: {
        navigation,
        filterProperties: ["participantId", "timestamp"],
        properties: {
          sleepQuality: {
            availableValues: [
              { value: "one", label: "one" },
              { value: "two", label: "two" },
              { value: "three", label: "three" },
              { value: "four", label: "four" },
              { value: "five", label: "five" },
              { value: "six", label: "six" },
              { value: "seven", label: "seven" },
              { value: "eight", label: "eight" },
              { value: "nine", label: "nine" },
              { value: "ten", label: "ten" },
            ],
          },
        },
      },
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
