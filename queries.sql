/*Queries that provide answers to the questions from all projects.*/

 SELECT *  FROM animals  WHERE name LIKE '%mon';
 SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
 SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts<3;
 SELECT date_of_birth FROM animals WHERE name= 'Agumon' OR name = 'Pikachu';
 SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
 SELECT *  FROM animals  WHERE neutered = true;
 SELECT *  FROM animals  WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;
