CREATE TABLE "temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "fall" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

.import 

UPDATE "temp" SET "mass" = NULL WHERE "mass" = '' OR "mass" = 0;
UPDATE "temp" SET "year" = NULL WHERE "year" = '' OR "year" = 0;
UPDATE "temp" SET "lat" = NULL WHERE "lat" = '' OR "lat" = 0;
UPDATE "temp" SET "long" = NULL WHERE "long" = '' OR "long" = 0;

UPDATE "temp" SET
    "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "fall", "year", "lat", "long"
FROM "temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" DESC, "name" ASC;

DROP TABLE "temp";
