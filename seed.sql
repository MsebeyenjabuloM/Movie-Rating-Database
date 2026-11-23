
-- ============================================================
-- Movie Rating Database
-- File: seed.sql
-- Purpose: Insert sample data into the database.
-- Run this file after schema.sql.
-- ============================================================


-- ------------------------------------------------------------
-- Section 1: Insert Movies
-- Three movies with their release years.
-- ------------------------------------------------------------

INSERT INTO movies (title, release_year)
VALUES
    ('Inception', 2010),
    ('The Dark Knight', 2008),
    ('Interstellar', 2014);


-- ------------------------------------------------------------
-- Section 2: Insert Users
-- Four users who will rate the movies.
-- User IDs will be generated automatically.
-- ------------------------------------------------------------

INSERT INTO users (username, email)
VALUES
    ('Alex', 'alex@example.com'),
    ('Sam', 'sam@example.com'),
    ('Jordan', 'jordan@example.com'),
    ('Taylor', 'taylor@example.com');


-- ------------------------------------------------------------
-- Section 3: Insert Genres
-- Five genres used to classify the movies.
-- ------------------------------------------------------------

INSERT INTO genres (genre_name)
VALUES
    ('Science Fiction'),
    ('Action'),
    ('Drama'),
    ('Adventure'),
    ('Crime');


-- ------------------------------------------------------------
-- Section 4: Connect Movies to Genres
-- Uses movie_id and genre_id as foreign keys.
--
-- Movie IDs:
-- 1 = Inception
-- 2 = The Dark Knight
-- 3 = Interstellar
--
-- Genre IDs:
-- 1 = Science Fiction
-- 2 = Action
-- 3 = Drama
-- 4 = Adventure
-- 5 = Crime
-- ------------------------------------------------------------

INSERT INTO movie_genres (movie_id, genre_id)
VALUES
    (1, 1),  -- Inception: Science Fiction
    (1, 2),  -- Inception: Action
    (2, 2),  -- The Dark Knight: Action
    (2, 5),  -- The Dark Knight: Crime
    (2, 3),  -- The Dark Knight: Drama
    (3, 1),  -- Interstellar: Science Fiction
    (3, 4),  -- Interstellar: Adventure
    (3, 3),  -- Interstellar: Drama
    (3, 2);  -- Interstellar: Action


-- ------------------------------------------------------------
-- Section 5: Insert Movie Ratings
-- Each user rates selected movies from 1 to 5.
--
-- User IDs:
-- 1 = Alex
-- 2 = Sam
-- 3 = Jordan
-- 4 = Taylor
--
-- The UNIQUE constraint prevents duplicate ratings
-- from the same user for the same movie.
-- ------------------------------------------------------------

INSERT INTO ratings (user_id, movie_id, rating)
VALUES
    (1, 1, 5),  -- Alex rates Inception
    (2, 1, 4),  -- Sam rates Inception
    (3, 1, 5),  -- Jordan rates Inception
    (1, 2, 5),  -- Alex rates The Dark Knight
    (2, 2, 4),  -- Sam rates The Dark Knight
    (4, 2, 3),  -- Taylor rates The Dark Knight
    (1, 3, 4),  -- Alex rates Interstellar
    (3, 3, 5),  -- Jordan rates Interstellar
    (4, 3, 5);  -- Taylor rates Interstellar


-- ------------------------------------------------------------
-- Section 6: Verify Inserted Data
-- These queries confirm the sample data was added.
-- ------------------------------------------------------------

SELECT * FROM movies;
SELECT * FROM users;
SELECT * FROM genres;
SELECT * FROM movie_genres;
SELECT * FROM ratings;
