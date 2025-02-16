import { ComponentLoader } from "adminjs";
import config from "config";

export const logTables = config.get("log_tables") as string[];

interface BaseConfig {
  show_all_tables: boolean;
  show_log_tables: boolean;
  table_title: string;
}

export const baseConfig = config.get("base_config") as BaseConfig;
export const dbConfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_DATABASE,
};
export const adminLoginConfig = {
  email: process.env.ADMIN_EMAIL,
  password: process.env.ADMIN_PASSWORD,
};
export const postgresUrl = `postgresql://${dbConfig.user}:${dbConfig.password}@${dbConfig.host}:${dbConfig.port}/${dbConfig.database}`;
export const componentLoader = new ComponentLoader();
