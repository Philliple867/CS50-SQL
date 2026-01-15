# Design Document

Video URL: https://youtu.be/OwbugZau46c

## Scope
The "Personal Library Manager" database is a specialized system designed for bibliophiles and book collectors to systematically organize their expanding literature collections. The primary objective of this database is to solve the problem of fragmented information regarding book ownership, author biographies, and personal reading progress. By centralizing all metadata—including publication years, genres, and author nationalities—the system provides a cohesive environment for data retrieval and library maintenance.

## Functional Requirements
The system is built to satisfy several core requirements for an efficient personal library:
* **Data Persistence**: Ensuring all records of authors and books are stored permanently within an SQLite database.
* **Relational Mapping**: Establishing a strict relationship between authors and their respective works to maintain data integrity.
* **Reading Progress Management**: Enabling users to categorize books into 'Read' or 'Unread' states and assign qualitative star ratings.
* **Search Optimization**: Providing quick access to records using indexing on frequently queried fields like book titles and author names.

## Representation

### Entities
The schema is normalized into three distinct entities to avoid data duplication:
1. **Authors**: Stores the name and nationality of the writers. Using a separate table allows an author's metadata to remain consistent even if multiple books are added for them.
2. **Books**: Contains titles, genres, and publication years. Each book is linked to an author via an `author_id`.
3. **Status**: A specialized table to track user interaction, including binary completion status and a numerical rating from 1 to 5.

### Relationships
* **Author to Books (One-to-Many)**: A single author can be credited for numerous books within the library, but each book entry in this version is mapped to one primary author.
* **Book to Status (One-to-One)**: Every book record is complemented by a single status entry, ensuring that user-specific ratings and reading states do not interfere with the core metadata of the book itself.

## Optimizations
Performance is prioritized through the use of database indexes. Specifically, `CREATE INDEX` statements were used on `books.title` and `authors.name`. This ensures that as the database grows from dozens to thousands of entries, searching for a specific book title or filtering by a favorite author remains an instantaneous operation. Additionally, `FOREIGN KEY` constraints are enforced to prevent "orphan" records, such as a book pointing to an author who does not exist in the database.

## Limitations
The current design assumes a one-to-one mapping between a book and its status, which may not account for users who own multiple editions of the same book. Furthermore, collaborative writing—where multiple authors write a single book—would require a many-to-many join table, which is a potential area for future expansion of this schema.
