BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "form_entries" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "form_entries" (
    "id" bigserial PRIMARY KEY,
    "participantId" bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "inBedStartTime" timestamp without time zone NOT NULL,
    "fallingAsleepTime" timestamp without time zone NOT NULL,
    "midNightAwaikingsCount" bigint NOT NULL,
    "totalMidNightAwaikingsTime" bigint NOT NULL,
    "wakeUpTime" timestamp without time zone NOT NULL,
    "outBedTime" timestamp without time zone NOT NULL,
    "sleepQuality" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "unique_participant_timestamp_indx" ON "form_entries" USING btree ("participantId", "timestamp");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "form_entries"
    ADD CONSTRAINT "form_entries_fk_0"
    FOREIGN KEY("participantId")
    REFERENCES "participants"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR formularz_snu
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('formularz_snu', '20250226223521019', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250226223521019', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
