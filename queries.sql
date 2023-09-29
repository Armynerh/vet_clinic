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
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;
BEGIN TRANSACTION;
DELETE FROM animals;
SELECT COUNT(*) FROM ANIMALS;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT delete_date;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_date;
UPDATE animals SET weight_kg =weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT name, MIN(weight_kg) min_weight, MAX(weight_kg) max_weight FROM animals GROUP BY species;
SELECT name, AVG(escape_attempts) avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000' GROUP BY species;
SELECT COUNT(*) non_escape_animals FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) average_weight FROM animals;
SELECT neutered, COUNT(*) escape_count FROM animals WHERE escape_attempts > 0 GROUP BY neutered ORDER BY escape_count DESC LIMIT 1;
SELECT COUNT(*) AS total_animals FROM animals;

SELECT animal.animal_name FROM animals animal INNER JOIN owners owner ON animal.owner_id = owner.owner_id WHERE owner.full_name = 'Melody Pond';
SELECT animal.animal_name FROM  animals animal INNER JOIN species specie ON animal.species_id = specie.species_id WHERE specie.species_name = 'Pokemon';

SELECT owner.full_name, coalesce(array_agg(animal.animal_name ORDER BY animal.animal_name), '{}'::text[]) AS owned_animals FROM owners owner
LEFT JOIN animals animal ON owner.owner_id = animal.owner_id GROUP BY owner.full_name;

SELECT specie.species_name AS species_name, COUNT(*) AS animal_total FROM animals animal INNER JOIN species specie ON animal.species_id = specie.species_id
GROUP BY specie.species_name;
SELECT animal.animal_name FROM animals animal INNER JOIN species specie ON animal.species_id = specie.species_id INNER JOIN owners owner ON animal.owner_id = owner.owner_id WHERE specie.species_name = 'Digimon' AND owner.full_name = 'Jennifer Orwell';

SELECT animal.animal_name FROM animals animal INNER JOIN owners owner ON animal.owner_id = owner.owner_id WHERE owner.full_name = 'Dean Winchester' AND animal.escape_attempts = 0;

SELECT owner.full_name FROM owners owner LEFT JOIN animals animals ON owner.owner_id = animal.owner_id GROUP BY owner.full_name
ORDER BY COUNT(animal.owner_id) DESC
LIMIT 1;
