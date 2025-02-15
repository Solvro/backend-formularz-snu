BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "form_data" (
    "id" bigserial PRIMARY KEY,
    "inBedStartTime" timestamp without time zone NOT NULL,
    "fallingAsleepTime" timestamp without time zone NOT NULL,
    "midNightAwaikingsCount" bigint NOT NULL,
    "totalMidNightAwaikingsTime" bigint NOT NULL,
    "wakeUpTime" timestamp without time zone NOT NULL,
    "outBedTime" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "form_entries" (
    "id" bigserial PRIMARY KEY,
    "participantId" bigint NOT NULL,
    "uuid" uuid NOT NULL DEFAULT gen_random_uuid(),
    "timestamp" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "data" json NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "unique_participant_timestamp_indx" ON "form_entries" USING btree ("participantId", "timestamp");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "global_config" (
    "id" bigserial PRIMARY KEY,
    "researchStartDate" timestamp without time zone NOT NULL,
    "researchEndDate" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "participants" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL
);

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
    VALUES ('formularz_snu', '20250215002639144', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250215002639144', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
