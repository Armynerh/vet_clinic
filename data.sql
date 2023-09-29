/* Populate database with sample data. */

INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (1, 'Agumon', '02-03-2020', 0, TRUE, 10.23), (2, 'Gabumon', '11-15-2018', 2, TRUE, 8), (3, 'Pikachu', '01-07-2021', 1, FALSE, 15.04), (4, 'Devimon', '05-12-2017', 5, TRUE, 11);
INSERT INTO ANIMALS (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES (5, 'Charmander', '02-08-2020', 0, FALSE, -11), (6, 'Plantmon', '11-15-2021', 2, TRUE, -5.7), (7, 'Squirtle', '04-02-1993', 3, FALSE, -12.13), (8, 'Angemon', '06-12-2005', 1, TRUE, -45), (9, 'Boarmon', '06-07-2005', 7, TRUE, 20.4), (10, 'Blossom', '10-13-1998', 3, TRUE, 17), (11, 'Ditto', '05-14-2022', 4, TRUE, 22);
INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34), ('Jennifer Orwell',19), ('Bob',45), ('Melody Pond',77), ('Dean Winchester',14), ('Jodie Whittaker',38);
INSERT INTO species (species_name)  VALUES ('Pokemon'), ('Digimon');
UPDATE animals SET species_id = CASE WHEN animal_name LIKE '%mon' THEN (SELECT species_id FROM species WHERE species_name = 'Digimon')
ELSE (SELECT species_id FROM species WHERE species_name = 'Pokemon')
END;

UPDATE animals SET owner_id = CASE 
  WHEN animal_name = 'Agumon' THEN (SELECT owner_id FROM owners WHERE full_name = 'Sam Smith') 
  WHEN animal_name IN ('Gabumon','Pikachu') THEN (SELECT owner_id FROM owners WHERE full_name = 'Jennifer Orwell' ) 
  WHEN animal_name IN ('Devimon','Plantmon') THEN (SELECT owner_id FROM owners WHERE full_name = 'Bob' )
  WHEN animal_name IN ('Charmander','Squirtle','Blossom') THEN (SELECT owner_id FROM owners WHERE full_name = 'Melody Pond' ) 
  WHEN animal_name IN ('Angemon','Boarmon') THEN (select owner_id FROM owners WHERE full_name = 'Dean Winchester' )
END;
