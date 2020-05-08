USE world;
-- (1) 중국 도시수 계산
SELECT ci.ID, ci.Name 
FROM city ci JOIN country co 
ON ci.CountryCode = co.Code
WHERE co.Name = 'China'; 
 