-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

--Nivel 1 – Exploración básica (SELECT, LIMIT, DISTINCT, WHERE)
-- MISSION 1
SELECT *
FROM observations
LIMIT 10;

-- MISSION 2
SELECT DISTINCT region_id
FROM observations;


-- MISSION 3
SELECT COUNT(DISTINCT species_id) AS total_species 
FROM observations;


-- MISSION 4
SELECT *
FROM observations
WHERE region_id = 2;


-- MISSION 5
SELECT *
from observations
WHERE observation_date = '1998-08-08';


--Nivel 2 – Agregación y ordenamiento (GROUP BY, COUNT, ORDER BY, HAVING sin JOIN)
-- MISSION 1
SELECT region_id, COUNT(*) as total_ob
FROM observations
GROUP BY region_id
ORDER BY total_ob desc;


-- MISSION 2
SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
ORDER BY total DESC
LIMIT 5;


-- MISSION 3
SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
HAVING total < 5
ORDER BY total ASC;

-- MISSION 4
SELECT observer, COUNT(*) AS total
FROM observations
GROUP BY observer
ORDER BY total DESC;

--Nivel 3 – Relaciones entre tablas (JOIN)
-- MISSION 1
SELECT name, region_id
FROM observations
JOIN regions
    on observations.region_id = regions.id;

-- MISSION 2 
SELECT scientific_name, species_id
FROM observations
JOIN species
    on observations.species_id = species.id;

-- MISSION 3
SELECT name, scientific_name, COUNT(*) AS total
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY name, scientific_name
ORDER BY name, total DESC;  

--Nivel 4 (opcional) – Manipulación de datos
-- MISSION 1
INSERT INTO observations
(species_id, region_id, observer, observation_date, latitude, longitude, count)
VALUES (2, 2, 'obsr1375321', '2026-06-14', '-33.126945', '151.61362', 1);

--MISSION 2
UPDATE species
SET scientific_name = 'Larus hyperboreus'
WHERE id = 1263;
-- no encontré como desplegar la tabla completa

--MISSION 3
DELETE FROM observations
WHERE id = 125;