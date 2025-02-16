BEGIN;

ALTER TABLE "global_config"
    ADD CONSTRAINT "global_config_id_check" CHECK ("id" = 1);

-- Insert default global_config if not exists
INSERT INTO "global_config" ("id", "researchStartDate", "researchEndDate")
    SELECT 1, '2025-01-01 00:00:00', '2025-12-31 23:59:59'
    WHERE NOT EXISTS (SELECT 1 FROM "global_config" WHERE "id" = 1);

--
-- MIGRATION VERSION FOR formularz_snu
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('formularz_snu', '20250216234014582', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250216234014582', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
