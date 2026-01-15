DROP TABLE IF EXISTS "user_logs";
DROP TABLE IF EXISTS "users";

CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TABLE "user_logs" (
    "id" INTEGER PRIMARY KEY,
    "type" TEXT NOT NULL,
    "old_username" TEXT,
    "new_username" TEXT,
    "old_password" TEXT,
    "new_password" TEXT
);

INSERT INTO "users" ("username", "password")
VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e');
