-- verification queries 

-- ============================================================
-- File: schema.sql
-- Purpose: TEST VERIFICATION
-- ============================================================
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
--- ====================
SELECT COUNT(*) AS total_movies FROM movies;
SELECT COUNT(*) AS total_users FROM users;
SELECT COUNT(*) AS total_genres FROM genres;
SELECT COUNT(*) AS total_movie_genres FROM movie_genres;
SELECT COUNT(*) AS total_ratings FROM ratings;
-- ============================================================
-- File: seed.sql
-- Purpose: TEST VERIFICATION
-- ============================================================
SELECT 'Movies' AS table_name, COUNT(*) AS total_records
FROM movies
UNION ALL
SELECT 'Users', COUNT(*)
FROM users
UNION ALL
SELECT 'Genres', COUNT(*)
FROM genres
UNION ALL
SELECT 'Movie Genres', COUNT(*)
FROM movie_genres
UNION ALL
SELECT 'Ratings', COUNT(*)
FROM ratings;
--- ====================
SELECT user_id, username
FROM users
ORDER BY user_id;
--- ====================
SELECT
    users.username,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id
JOIN movies
ON ratings.movie_id = movies.movie_id
ORDER BY movies.title, users.username;
-- ============================================================
-- File: queries.sql
-- Purpose: TEST VERIFICATION
-- ============================================================
SELECT
    movies.title,
    COUNT(ratings.rating) AS total_ratings,
    ROUND(AVG(ratings.rating), 2) AS average_rating
FROM ratings
JOIN movies
ON ratings.movie_id = movies.movie_id
GROUP BY movies.movie_id, movies.title
ORDER BY average_rating DESC;
--- ====================
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
--- ====================
SELECT
    COUNT(*) AS total_movies,
    MIN(release_year) AS earliest_year,
    MAX(release_year) AS latest_year
FROM movies;
-- ============================================================
-- File: practice.sql
-- Purpose: TEST VERIFICATION
-- ============================================================
SELECT
    users.username,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
ON ratings.user_id = users.user_id
JOIN movies
ON ratings.movie_id = movies.movie_id
ORDER BY movies.title, users.username;
--- ====================
SELECT COUNT(*) AS total_ratings
FROM ratings;
--- ====================
SELECT
    ratings.rating_id,
    ratings.user_id,
    ratings.movie_id
FROM ratings
LEFT JOIN users
ON ratings.user_id = users.user_id
LEFT JOIN movies
ON ratings.movie_id = movies.movie_id
WHERE users.user_id IS NULL
   OR movies.movie_id IS NULL;
   