CREATE TABLE labels (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    color TEXT NOT NULL
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    publisher TEXT NOT NULL,
    cover_state TEXT NOT NULL,
    item_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE genres_items_books (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
