# Overview

The Movie Rating Database is a SQL-based project that I developed to practise working with relational databases. It allows users to store information about movies, genres, and users, as well as the ratings that users give to different movies.

The project uses PostgreSQL to store and manage the data. I wrote SQL scripts to create the database tables, insert sample data, update and delete records, and retrieve information using different queries. The database also uses primary keys, foreign keys, and constraints to keep the data organized and prevent invalid entries.

To use the project, you need PostgreSQL and a tool such as pgAdmin 4. After creating an empty database, you can run `schema.sql` to create the tables and `seed.sql` to insert the sample data. You can then run `queries.sql` to view and analyse the movie ratings. I also included `practice.sql`, which contains additional SQL exercises and examples of how I tested the database.

My main purpose for developing this project was to strengthen my understanding of SQL and relational databases. I wanted to learn how different tables connect, how to retrieve information from multiple tables using JOINs, and how to use aggregate functions to answer questions about the data. I also wanted to become more comfortable writing SQL queries independently and understanding the errors I encountered.

[Demo Video](http://youtube)

# Relational Database

I used PostgreSQL, an open-source relational database management system, to build the Movie Rating Database. PostgreSQL stores information in tables and allows those tables to be connected through relationships.

The database contains five tables:

1. movies: Stores movie information, including a unique movie ID, title, and release year.
2. users: Stores the usernames and email addresses of people who can rate movies. Each user has a unique ID.
3. genres: Stores different movie genres, such as Action, Drama, and Science Fiction.
4. movie_genres: Connects movies to their genres. This table creates a many-to-many relationship because one movie can belong to multiple genres, and one genre can be associated with multiple movies.
5. ratings: Stores the ratings users give to movies. Each rating connects a user to a movie and must have a value between 1 and 5.

The database uses primary keys to uniquely identify records and foreign keys to connect related tables. I also added constraints to prevent duplicate usernames, duplicate movie ratings from the same user, and ratings outside the allowed range.

I wrote queries to calculate average movie ratings, count how many ratings each movie received, find the highest and lowest ratings, and compare average ratings across different genres.

# Development Environment

I used the following tools to develop this project:

- PostgreSQL 18: Used to create and manage the relational database.
- pgAdmin 4: Used to connect to PostgreSQL, create tables, execute SQL queries, and inspect the results.
- Visual Studio Code: Used to organize and document the SQL scripts and project files.
- Git and GitHub: Used for version control and sharing the completed project.

The project was written using SQL (Structured Query Language) with PostgreSQL-specific features, including automatically generated identity columns and the `RETURNING` clause.

I used SQL commands such as `CREATE TABLE`, `INSERT`, `SELECT`, `UPDATE`, and `DELETE` to manage the database. I also used `JOIN`, `WHERE`, `GROUP BY`, `ORDER BY`, `COUNT`, `AVG`, `MIN`, and `MAX` to retrieve and analyse information.

No external programming libraries were required because the project runs directly in PostgreSQL.

# Useful Websites

- [PostgreSQL Documentation](https://www.postgresql.org/docs/current/) — Helped me understand SQL commands, database constraints, and relationships.
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/) — Reference for SQL syntax, JOINs, and aggregate functions.
- [pgAdmin Documentation](https://www.pgadmin.org/docs/) — Provided guidance on using pgAdmin to manage PostgreSQL databases.
- [Learn Basic SQL in 15 Minutes  | SQL Tutorial For Beginners 1/3](https://youtu.be/kbKty5ZVKMY?si=cCeRjn2oA8JpVHfh)
- [SQL Explained in 100 Seconds](https://youtu.be/zsjvFFKOm3c?si=ETIIqWvGzGWT7Aj2)
- [SQL Tutorial - Full Database Course for Beginners](https://youtu.be/HXV3zeQKqGY?si=Lss_HBI0JzovXs3a)
- [PostgreSQL Crash Course - Beginner Tutorial](https://youtu.be/gySEbKmkvEU?si=jEwdWnjTtMT-qX3z)
- [Installing and Creating Database in PostgreSQL](https://youtu.be/USOqNVz3gXQ?si=SlXIthV55X7asOMl)

# Future Work

- Add more movies and users: Expand the sample data to make the database more interesting and produce more meaningful results.
- Create a user interface: Build a simple web application that allows users to browse movies and submit ratings without writing SQL queries manually.
- Improve the reporting features: Add more advanced queries to identify popular genres, highly rated movies, and users who submit the most ratings.
- Add more movie information: Include details such as directors, descriptions, and movie durations to make the database more useful.