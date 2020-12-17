select_exercises.sql

# Use the albums_db database
USE albums_db;


# The name of all albums by Pink Floyd
SELECT name
FROM `albums`
WHERE artist = 'Pink Floyd';


# The year Sgt. Pepper's Lonely Hearts Club Band was released'
SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';


# The genre for the album Nevermind
SELECT genre
FROM `albums`
WHERE name = 'Nevermind';


# Which albums were released in the 1990s
SELECT name
FROM `albums`
WHERE release_date BETWEEN '1990-01-01' and '1999-12-31';


# Which albums had less than 20 million certified sales
SELECT name
FROM `albums`
WHERE sales < 20;

# All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name
FROM albums
WHERE genre = 'Rock';
# These query results not include albums with a genre of "Hard rock" or "Progressive rock" because SQL is specific