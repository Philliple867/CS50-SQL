SELECT "first_name", "last_name" FROM "players" JOIN "salaries" ON "players"."id" = "salaries"."player_id" WHERE "salaries"."salary" = (SELECT MAX("salary") FROM "salaries");
