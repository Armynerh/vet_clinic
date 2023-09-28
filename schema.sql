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
    ADD COLUMN species_id INTEGER REFERENCES species(id),
    ADD COLUMN owner_id INTEGER REFERENCES owners(id);
