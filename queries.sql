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

SELECT name
FROM animals
WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond');

SELECT name
FROM animals
WHERE species_id = (SELECT id FROM species WHERE name = 'Pokemon');

SELECT o.full_name, COALESCE(array_agg(a.name), '{}'::VARCHAR[]) AS owned_animals
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name;

SELECT s.name AS species, COUNT(*) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = (SELECT id FROM species WHERE name = 'Digimon');


SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;


SELECT o.full_name, COUNT(*) AS animal_count
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

SELECT v.name AS vet_name, vi.animal_name AS last_animal_seen
FROM vets v
JOIN visits vi ON v.id = vi.vet_id
WHERE v.name = 'William Tatcher'
ORDER BY vi.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.animal_name) AS num_animals_seen
FROM visits v
JOIN vets vet ON v.vet_id = vet.id
WHERE vet.name = 'Stephanie Mendez';

SELECT v.name AS vet_name, s.species AS specialty
FROM vets v
LEFT JOIN specializations s ON v.id = s.vet_id;

SELECT DISTINCT animal_name
FROM visits
WHERE vet_id IN (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
  AND visit_date BETWEEN '04-01-2020' AND '08-30-2020';

SELECT animal_name, COUNT(*) AS num_visits
FROM visits
GROUP BY animal_name
ORDER BY num_visits DESC
LIMIT 1;

SELECT v.name AS vet_name, vi.animal_name AS first_visit_animal
FROM vets v
JOIN visits vi ON v.id = vi.vet_id
WHERE v.name = 'Maisy Smith'
ORDER BY vi.visit_date ASC
LIMIT 1;

SELECT v.name AS vet_name, vi.animal_name, vi.visit_date
FROM visits vi
JOIN vets v ON vi.vet_id = v.id
ORDER BY vi.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS num_visits_without_specialty
FROM visits v
LEFT JOIN specializations s ON v.vet_id = s.vet_id AND v.animal_name = s.species
WHERE s.species IS NULL;

SELECT s.species AS recommended_specialty, COUNT(*) AS num_visits
FROM visits v
JOIN specializations s ON v.vet_id = s.vet_id
JOIN vets vet ON v.vet_id = vet.id
WHERE vet.name = 'Maisy Smith'
GROUP BY s.species
ORDER BY num_visits DESC
LIMIT 1;
