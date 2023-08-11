CREATE TABLE labels (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    color TEXT NOT NULL
);

CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE items (
    id INTEGER PRIMARY KEY,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL
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

CREATE TABLE music_albums (
    id INTEGER PRIMARY KEY,
    on_spotify BOOLEAN NOT NULL,
    item_id INTEGER NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres_items_music_albums (
    id INTEGER PRIMARY KEY,
    music_album_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    FOREIGN KEY (music_album_id) REFERENCES music_albums(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
