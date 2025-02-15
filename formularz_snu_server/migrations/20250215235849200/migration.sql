BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "form_entries" DROP COLUMN "uuid";

--
-- MIGRATION VERSION FOR formularz_snu
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('formularz_snu', '20250215235849200', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250215235849200', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
