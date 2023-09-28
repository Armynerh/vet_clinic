/*Queries that provide answers to the questions from all projects.*/

 SELECT *  FROM animals  WHERE name LIKE '%mon';
 SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
 SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts<3;
 SELECT date_of_birth FROM animals WHERE name= 'Agumon' OR name = 'Pikachu';
 SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
 SELECT *  FROM animals  WHERE neutered = true;
 SELECT *  FROM animals  WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;
BEGIN TRANSACTION;
TRUNCATE animals;
ROLLBACK;
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT delete_date;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_date;
UPDATE animals SET weight_kg =weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
