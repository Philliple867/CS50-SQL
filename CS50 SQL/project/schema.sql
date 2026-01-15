-- In schema.sql

CREATE TABLE "authors" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "nationality" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "books" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "author_id" INTEGER,
    "genre" TEXT,
    "published_year" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("author_id") REFERENCES "authors"("id")
);

CREATE TABLE "status" (
    "book_id" INTEGER,
    "is_read" INTEGER DEFAULT 0,
    "rating" INTEGER CHECK("rating" BETWEEN 1 AND 5),
    "notes" TEXT,
    FOREIGN KEY("book_id") REFERENCES "books"("id")
);

-- Thêm index để tối ưu tìm kiếm (Harvard rất thích điểm này)
CREATE INDEX "book_title_search" ON "books" ("title");
