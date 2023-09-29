/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS (
   ID INT PRIMARY KEY NOT NULL,
   NAME VARCHAR(100) NOT NULL,
   DATE_OF_BIRTH DATE NOT NULL,
   ESCAPE_ATTEMPTS INT,
   NEUTERED BOOLEAN,
   WEIGHT_KG NUMERIC
);
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
ALTER TABLE animals
DROP COLUMN IF EXISTS species;
ALTER TABLE animals DROP CONSTRAINT IF EXISTS animals_pkey;
ALTER TABLE animals
ALTER COLUMN id SET DATA TYPE SERIAL,
ADD PRIMARY KEY (id);
ALTER TABLE animals
    ADD COLUMN species_id INTEGER REFERENCES species(id),
    ADD COLUMN owner_id INTEGER REFERENCES owners(id);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INTEGER,
    species VARCHAR(255),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_name VARCHAR(255),
    vet_id INTEGER,
    visit_date DATE,
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

