CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded_year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER,
    "company_id" INTEGER,
    "title" TEXT,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
