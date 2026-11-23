
-- ============================================================
-- Movie Rating Database
-- File: schema.sql
-- Purpose: Create the database tables and relationships.
-- ============================================================

-- ------------------------------------------------------------
-- Table 1: Movies
-- Stores movie titles and release years.
-- Each movie receives a unique, automatically generated ID.
-- ------------------------------------------------------------

CREATE TABLE movies (
    movie_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INTEGER
);

-- ------------------------------------------------------------
-- Table 2: Users
-- Stores information about users who can rate movies.
-- Usernames must be unique.
-- Email addresses must also be unique when provided.
-- ------------------------------------------------------------

CREATE TABLE users (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) UNIQUE
);

-- ------------------------------------------------------------
-- Table 3: Genres
-- Stores movie genres such as Action and Science Fiction.
-- Each genre name must be unique.
-- ------------------------------------------------------------

CREATE TABLE genres (
    genre_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

-- ------------------------------------------------------------
-- Table 4: Movie Genres
-- Connects movies to their genres.
-- A movie can have multiple genres.
-- A genre can belong to multiple movies.
-- The composite primary key prevents duplicate relationships.
-- ------------------------------------------------------------

CREATE TABLE movie_genres (
    movie_id INTEGER REFERENCES movies(movie_id),
    genre_id INTEGER REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);

-- ------------------------------------------------------------
-- Table 5: Ratings
-- Stores the ratings users give to movies.
-- Ratings must be between 1 and 5.
-- A user can only rate the same movie once.
-- Foreign keys ensure users and movies already exist.
-- ------------------------------------------------------------

CREATE TABLE ratings (
    rating_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    movie_id INTEGER NOT NULL REFERENCES movies(movie_id),
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    UNIQUE (user_id, movie_id)
);