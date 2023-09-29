/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS (
   ID INT PRIMARY KEY NOT NULL,
   NAME VARCHAR(100) NOT NULL,
   DATE_OF_BIRTH DATE NOT NULL,
   ESCAPE_ATTEMPTS INT,
   NEUTERED BOOLEAN,
   WEIGHT_KG NUMERIC
);
ALTER TABLE animals ADD COLUMN species VARCHAR(255);
