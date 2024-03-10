BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "note" (
    "id" serial PRIMARY KEY,
    "text" text NOT NULL
);


--
-- MIGRATION VERSION FOR test_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('test_pod', '20240310123335933', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240310123335933', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
