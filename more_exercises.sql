
# What languages are spoken in Santa Monica?

SELECT language, percentage
FROM countrylanguage
WHERE countrycode = 'USA'
ORDER BY percentage;

# How many different countries are in each region?

SELECT region, COUNT(name) as num_countries
FROM country
GROUP BY region
ORDER BY num_countries ASC;

# What is the population for each region?

SELECT region, population
FROM country
#ORDER BY region
ORDER BY population DESC;

# What is the population for each continent?


