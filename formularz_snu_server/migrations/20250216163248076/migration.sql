BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "form_data" CASCADE;


--
-- MIGRATION VERSION FOR formularz_snu
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('formularz_snu', '20250216163248076', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250216163248076', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
