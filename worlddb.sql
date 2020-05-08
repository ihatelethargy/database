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

-- left join 이용
SELECT DISTINCT cl.Language
FROM country co 
LEFT JOIN countryLanguage cl
ON co.Code = cl.countryCode
WHERE co.region = 'Caribbean';

-- (4) 소통되는 언어가 명시되어 있지 않은 국가의 코드, 이름
SELECT code, name 
FROM country
WHERE code NOT IN (SELECT distinct countryCode FROM countrylanguage);

-- (5) 다른도시지만 동일 명칭의 도시들의 쌍에 대해 각각 ID와 이름 구하기
SELECT c1.Name, c1.ID, c2.ID
FROM city c1, city c2
WHERE c1.ID <> c2.ID and c1.Name = c2.Name
ORDER BY 1, 2, 3 DESC;
 
 
 