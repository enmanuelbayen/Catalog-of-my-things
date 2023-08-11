CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

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

CREATE TABLE games (
    id INTEGER PRIMARY KEY,
    multiplayer BOOLEAN NOT NULL,
    last_played_at DATE NOT NULL,
    item_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Adding indexes for foreign keys
CREATE INDEX idx_books_item_id ON books(item_id);
CREATE INDEX idx_books_author_id ON books(author_id);
CREATE INDEX idx_genres_items_books_book_id ON genres_items_books(book_id);
CREATE INDEX idx_genres_items_books_genre_id ON genres_items_books(genre_id);
CREATE INDEX idx_music_albums_item_id ON music_albums(item_id);
CREATE INDEX idx_genres_items_music_albums_music_album_id ON genres_items_music_albums(music_album_id);
CREATE INDEX idx_genres_items_music_albums_genre_id ON genres_items_music_albums(genre_id);
CREATE INDEX idx_games_item_id ON games(item_id);
CREATE INDEX idx_games_author_id ON games(author_id);