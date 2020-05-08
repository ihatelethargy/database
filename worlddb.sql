USE world;
-- (1) 중국 도시
SELECT ci.ID, ci.Name 
FROM city ci 
JOIN country co 
ON ci.CountryCode = co.Code
WHERE co.Name = 'China'; 

-- 중국 도시 숫자
SELECT COUNT(*) AS NumberOfCityInChina 
FROM city ci
JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Name = 'China';

 -- (2) 가장 적은 인구를 가지고 있는 국가의 이름, 인구 수
 -- 2(pop) 기준 / 7번째까지
 SELECT Name, Population
 FROM Country
 ORDER BY 2 ASC
 LIMIT 7;
 
 -- 가장 적은인구
 SELECT Name, Population
 FROM Country
 WHERE Population = (SELECT MIN(Population) FROM country);
 
 -- (3) Caribbean 지역의 모든 언어 
 -- Caribbean 지역의 국가 코드
 SELECT Code,Name 
 FROM country
 WHERE region = 'Caribbean';
 
 -- Caribbean 지역 언어
SELECT DISTINCT cl.Language
FROM countryLanguage cl
JOIN country co
ON co.code = cl.CountryCode
WHERE co.region = 'Caribbean';
 
 
 