/* Populate database with sample data. */

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (1, 'Agumon', '02-03-2020', 0, TRUE, 10.23), (2, 'Gabumon', '11-15-2018', 2, TRUE, 8), (3, 'Pikachu', '01-07-2021', 1, FALSE, 15.04), (4, 'Devimon', '05-12-2017', 5, TRUE, 11);
INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (5, 'Charmander', '02-08-2020', 0, FALSE, -11), (6, 'Plantmon', '11-15-2021', 2, TRUE, -5.7), (7, 'Squirtle', '04-02-1993', 3, FALSE, -12.13), (8, 'Angemon', '06-12-2005', 1, TRUE, -45), (9, 'Boarmon', '06-07-2005', 7, TRUE, 20.4), (10, 'Blossom', '10-13-1998', 3, TRUE, 17), (11, 'Ditto', '05-14-2022', 4, TRUE, 22);
UPDATE animals SET species_id = CASE WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon') ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animalsSET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
INSERT INTO visits (animal_name, vet_id, visit_date) VALUES('Agumon', 1, '2020-05-24'), ('Agumon', 3, '2020-07-22'), ('Gabumon', 4, '2021-02-02'), ('Pikachu', 2, '2020-01-05'), ('Pikachu', 2, '2020-03-08'), ('Pikachu', 2, '2020-05-14'), ('Devimon', 3, '2021-05-04'), ('Charmander', 4, '2021-02-24'), ('Plantmon', 2, '2019-12-21'), ('Plantmon', 1, '2020-08-10'), ('Plantmon', 2, '2021-04-07'), ('Squirtle', 3, '2019-09-29'),
('Angemon', 4, '2020-10-03'), ('Angemon', 4, '2020-11-04'), ('Boarmon', 2, '2019-01-24'), ('Boarmon', 2, '2019-05-15'), ('Boarmon', 2, '2020-02-27'), ('Boarmon', 2, '2020-08-03'), ('Blossom', 3, '2020-05-24'), ('Blossom', 1, '2021-01-11');
INSERT INTO specializations (vet_id, species) VALUES (1, 'Pokemon'), (3, 'Digimon'), (3, 'Pokemon'), (4, 'Digimon');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
