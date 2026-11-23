
-- ============================================================
-- Movie Rating Database
-- File: queries.sql
-- Purpose: Retrieve and analyse movie rating information.
-- Run after schema.sql and seed.sql.
-- ============================================================


-- ------------------------------------------------------------
-- Section 1: Basic Data Retrieval
-- Display all records from the main database tables.
-- ------------------------------------------------------------

-- View all movies.
SELECT *
FROM movies;

-- View all users.
SELECT *
FROM users;

-- View all available genres.
SELECT *
FROM genres;

-- View all movie ratings.
SELECT *
FROM ratings;


-- ------------------------------------------------------------
-- Section 2: Filtering and Sorting Movies
-- Demonstrates WHERE, ORDER BY, and LIMIT.
-- ------------------------------------------------------------

-- Find movies released in 2010 or later.
SELECT *
FROM movies
WHERE release_year >= 2010;

-- Sort movies from oldest to newest.
SELECT *
FROM movies
ORDER BY release_year ASC;

-- Sort movies from newest to oldest.
SELECT *
FROM movies
ORDER BY release_year DESC;

-- Find movies released before 2014, newest first.
SELECT *
FROM movies
WHERE release_year < 2014
ORDER BY release_year DESC;

-- Find the newest movie released in or before 2010.
SELECT *
FROM movies
WHERE release_year <= 2010
ORDER BY release_year DESC
LIMIT 1;

-- Find the oldest movie released in or after 2010.
SELECT *
FROM movies
WHERE release_year >= 2010
ORDER BY release_year ASC
LIMIT 1;


-- ------------------------------------------------------------
-- Section 3: Joining Tables
-- Demonstrates retrieving related data from multiple tables.
-- ------------------------------------------------------------

-- Show each rating alongside the username.
SELECT
    users.username,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id;

-- Show each rating alongside the movie title.
SELECT
    movies.title,
    ratings.rating
FROM ratings
JOIN movies
ON ratings.movie_id = movies.movie_id;

-- Show who rated each movie and the rating they gave.
SELECT
    users.username,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id
JOIN movies
ON ratings.movie_id = movies.movie_id;

-- Show ratings of 4 or higher, sorted by rating and username.
SELECT
    users.username,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id
JOIN movies
ON ratings.movie_id = movies.movie_id
WHERE ratings.rating >= 4
ORDER BY ratings.rating DESC, users.username ASC;


-- ------------------------------------------------------------
-- Section 4: Database Statistics
-- Demonstrates aggregate functions.
-- ------------------------------------------------------------

-- Count the total number of ratings.
SELECT
    COUNT(*) AS total_ratings
FROM ratings;

-- Calculate the overall average rating.
SELECT
    ROUND(AVG(rating), 2) AS overall_average_rating
FROM ratings;

-- Find the highest rating.
SELECT
    MAX(rating) AS highest_rating
FROM ratings;

-- Find the lowest rating.
SELECT
    MIN(rating) AS lowest_rating
FROM ratings;

-- Count movies and identify the earliest and latest years.
SELECT
    COUNT(*) AS total_movies,
    MIN(release_year) AS earliest_year,
    MAX(release_year) AS latest_year
FROM movies;


-- ------------------------------------------------------------
-- Section 5: Movie Rating Analysis
-- Demonstrates GROUP BY, COUNT, AVG, and ROUND.
-- ------------------------------------------------------------

-- Calculate average ratings grouped by movie ID.
SELECT
    movie_id,
    ROUND(AVG(rating), 2) AS average_rating
FROM ratings
GROUP BY movie_id;

-- Show movie titles alongside their average ratings.
SELECT
    movies.title,
    ROUND(AVG(ratings.rating), 2) AS average_rating
FROM ratings
JOIN movies
ON ratings.movie_id = movies.movie_id
GROUP BY movies.movie_id, movies.title;

-- Count how many ratings each movie has received.
SELECT
    movies.title,
    COUNT(ratings.rating) AS total_ratings
FROM ratings
JOIN movies
ON ratings.movie_id = movies.movie_id
GROUP BY movies.movie_id, movies.title
ORDER BY total_ratings DESC;

-- Movie leaderboard:
-- Show rating counts and average ratings for each movie.
-- Sort the movies from highest to lowest average rating.
SELECT
    movies.title,
    COUNT(ratings.rating) AS total_ratings,
    ROUND(AVG(ratings.rating), 2) AS average_rating
FROM ratings
JOIN movies
ON ratings.movie_id = movies.movie_id
GROUP BY movies.movie_id, movies.title
ORDER BY average_rating DESC;


-- ------------------------------------------------------------
-- Section 6: Genre Analysis
-- Demonstrates joining multiple related tables.
-- ------------------------------------------------------------

-- Show which genre IDs are linked to each movie.
SELECT
    genres.genre_name,
    movie_genres.movie_id
FROM movie_genres
JOIN genres
ON movie_genres.genre_id = genres.genre_id;

-- Show all ratings associated with each genre.
-- Movies with multiple genres contribute to each genre.
SELECT
    genres.genre_name,
    movie_genres.movie_id,
    ratings.rating
FROM movie_genres
JOIN genres
ON movie_genres.genre_id = genres.genre_id
JOIN ratings
ON movie_genres.movie_id = ratings.movie_id;

-- Genre leaderboard:
-- Count ratings and calculate average ratings per genre.
-- Each movie rating contributes to all its assigned genres.
SELECT
    genres.genre_name,
    COUNT(ratings.rating) AS total_ratings,
    ROUND(AVG(ratings.rating), 2) AS average_rating
FROM movie_genres
JOIN genres
ON movie_genres.genre_id = genres.genre_id
JOIN ratings
ON movie_genres.movie_id = ratings.movie_id
GROUP BY genres.genre_name
ORDER BY average_rating DESC;
