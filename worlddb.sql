USE world;
-- (1) 중국 도시
SELECT ci.ID, ci.Name 
FROM city ci JOIN country co 
ON ci.CountryCode = co.Code
WHERE co.Name = 'China'; 

-- 중국 도시 숫자
SELECT COUNT(*) AS NumberOfCityInChina 
FROM city ci
JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Name = 'China';

 