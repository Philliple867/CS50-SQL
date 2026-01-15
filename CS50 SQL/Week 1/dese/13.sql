SELECT "name", "unsatisfactory" FROM "staff_evaluations" JOIN "districts" ON "districts"."id" = "staff_evaluations"."district_id" WHERE "unsatisfactory" > 10 ORDER BY "unsatisfactory" DESC;
