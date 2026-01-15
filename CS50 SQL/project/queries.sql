-- In queries.sql

-- Add a new author
INSERT INTO "authors" ("name", "nationality") VALUES ('J.K. Rowling', 'British');

-- Add a new book
INSERT INTO "books" ("title", "author_id", "genre", "published_year")
VALUES ('Harry Potter', 1, 'Fantasy', 1997);

-- Find all books by a specific author
SELECT "title" FROM "books"
WHERE "author_id" = (SELECT "id" FROM "authors" WHERE "name" = 'J.K. Rowling');

-- Update reading status
INSERT INTO "status" ("book_id", "is_read", "rating") VALUES (1, 1, 5);
