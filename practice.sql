
-- ============================================================
-- Movie Rating Database
-- File: practice.sql
-- Purpose: Demonstrate SQL practice exercises and testing.
-- Run after schema.sql and seed.sql.
--
-- IMPORTANT:
-- The UPDATE and DELETE examples use a transaction.
-- ROLLBACK restores the original data after testing.
-- Invalid INSERT examples are commented out intentionally.
-- ============================================================


-- ------------------------------------------------------------
-- Section 1: Basic SELECT Practice
-- Demonstrates filtering records using WHERE.
-- ------------------------------------------------------------

-- Find all users.
SELECT *
FROM users;

-- Find Taylor by username.
SELECT *
FROM users
WHERE username = 'Taylor';

-- Find the Drama genre.
SELECT *
FROM genres
WHERE genre_name = 'Drama';

-- Find movies released in 2010 or later.
SELECT *
FROM movies
WHERE release_year >= 2010;

-- Find movies released before 2014.
SELECT *
FROM movies
WHERE release_year < 2014
ORDER BY release_year DESC;


-- ------------------------------------------------------------
-- Section 2: Aggregate Function Practice
-- Demonstrates COUNT, AVG, MIN, and MAX.
-- ------------------------------------------------------------

-- Count the number of movie ratings.
SELECT COUNT(*) AS total_ratings
FROM ratings;

-- Calculate the average rating.
SELECT ROUND(AVG(rating), 2) AS average_rating
FROM ratings;

-- Find the lowest rating.
SELECT MIN(rating) AS lowest_rating
FROM ratings;

-- Find the highest rating.
SELECT MAX(rating) AS highest_rating
FROM ratings;

-- Group average ratings by movie ID.
SELECT
    movie_id,
    ROUND(AVG(rating), 2) AS average_rating
FROM ratings
GROUP BY movie_id;


-- ------------------------------------------------------------
-- Section 3: JOIN Practice
-- Demonstrates relationships between database tables.
-- ------------------------------------------------------------

-- Join ratings with users to identify who gave each rating.
SELECT
    users.username,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id;

-- Join ratings with movies to identify rated movies.
SELECT
    movies.title,
    ratings.rating
FROM ratings
JOIN movies
ON ratings.movie_id = movies.movie_id;

-- Join three tables to show users, movies, and ratings.
SELECT
    users.username,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id
JOIN movies
ON ratings.movie_id = movies.movie_id;


-- ------------------------------------------------------------
-- Section 4: Constraint Testing
-- These statements intentionally violate database rules.
--
-- They are commented out so the script runs without errors.
-- Uncomment and execute ONE statement at a time to test.
-- ------------------------------------------------------------

-- Test 1: Foreign Key Constraint
-- Movie 9999 does not exist in the movies table.
-- Expected result: Foreign key violation.
--
-- INSERT INTO movie_genres (movie_id, genre_id)
-- VALUES (9999, 1);


-- Test 2: CHECK Constraint
-- Ratings must be between 1 and 5.
-- Expected result: CHECK constraint violation.
--
-- INSERT INTO ratings (user_id, movie_id, rating)
-- VALUES (2, 3, 8);


-- Test 3: UNIQUE Constraint
-- Alex has already rated Inception.
-- Expected result: Duplicate user/movie rating violation.
--
-- INSERT INTO ratings (user_id, movie_id, rating)
-- VALUES (1, 1, 3);


-- Test 4: Unique Username Constraint
-- The username Alex already exists.
-- Expected result: Duplicate username violation.
--
-- INSERT INTO users (username, email)
-- VALUES ('Alex', 'anotheralex@example.com');


-- ------------------------------------------------------------
-- Section 5: UPDATE Practice
-- Demonstrates changing existing ratings.
--
-- All changes below will be undone by ROLLBACK.
-- ------------------------------------------------------------

BEGIN;

-- View Alex's original rating for Interstellar.
SELECT *
FROM ratings
WHERE user_id = 1 AND movie_id = 3;

-- Change Alex's Interstellar rating to 5.
UPDATE ratings
SET rating = 5
WHERE user_id = 1 AND movie_id = 3;

-- Verify Alex's updated rating.
SELECT *
FROM ratings
WHERE user_id = 1 AND movie_id = 3;


-- View Sam's original rating for The Dark Knight.
SELECT *
FROM ratings
WHERE user_id = 2 AND movie_id = 2;

-- Change Sam's rating to 5.
UPDATE ratings
SET rating = 5
WHERE user_id = 2 AND movie_id = 2;

-- Verify Sam's updated rating.
SELECT *
FROM ratings
WHERE user_id = 2 AND movie_id = 2;


-- ------------------------------------------------------------
-- Section 6: DELETE Practice
-- Demonstrates safely deleting specific ratings.
--
-- These deletions are inside the same transaction.
-- ROLLBACK will restore the deleted records.
-- ------------------------------------------------------------

-- View Taylor's rating for The Dark Knight.
-- Taylor has user_id = 4 in the clean seed data.
SELECT *
FROM ratings
WHERE user_id = 4 AND movie_id = 2;

-- Delete Taylor's rating for The Dark Knight.
DELETE FROM ratings
WHERE user_id = 4 AND movie_id = 2
RETURNING *;

-- Verify that Taylor's rating was deleted.
SELECT *
FROM ratings
WHERE user_id = 4 AND movie_id = 2;


-- View Jordan's rating for Inception.
SELECT *
FROM ratings
WHERE user_id = 3 AND movie_id = 1;

-- Delete Jordan's rating for Inception.
DELETE FROM ratings
WHERE user_id = 3 AND movie_id = 1
RETURNING *;

-- Verify that Jordan's rating was deleted.
SELECT *
FROM ratings
WHERE user_id = 3 AND movie_id = 1;


-- ------------------------------------------------------------
-- Section 7: Restore Original Data
-- ROLLBACK cancels all changes made since BEGIN.
-- ------------------------------------------------------------

ROLLBACK;


-- ------------------------------------------------------------
-- Section 8: Verify Original Data Was Restored
-- These queries should show the original seed ratings.
-- ------------------------------------------------------------

-- Alex's Interstellar rating should be 4.
SELECT *
FROM ratings
WHERE user_id = 1 AND movie_id = 3;

-- Sam's The Dark Knight rating should be 4.
SELECT *
FROM ratings
WHERE user_id = 2 AND movie_id = 2;

-- Taylor's The Dark Knight rating should exist again.
SELECT *
FROM ratings
WHERE user_id = 4 AND movie_id = 2;

-- Jordan's Inception rating should exist again.
SELECT *
FROM ratings
WHERE user_id = 3 AND movie_id = 1;
