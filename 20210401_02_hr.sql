SELECT USER
FROM DUAL;
--==>> HR

--○ 세 개 이상의 테이블 조인(JOIN)

-- 형식1(SQL 1992 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;

-- 형식2(SQL 1999 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
        JOIN 테이블명3
        ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;

--○ HR 계정 소유의 테이블 또는 뷰 목록 조회 
SELECT *
FROM TAB;
--==>>
/*
COUNTRIES	        TABLE	
DEPARTMENTS	        TABLE	
EMPLOYEES	        TABLE	
EMP_DETAILS_VIEW	VIEW	
JOBS	            TABLE	
JOB_HISTORY	        TABLE	
LOCATIONS	        TABLE	
REGIONS         	TABLE	
*/

SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;

--○ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS 테이블을 대상으로
--   직원들의 FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME
--   항목을 조회한다.

/*
LAST_NAME   FIRST_NAME   JOB_TITLE      DEPARTMENT_NAME
Whalen       Jennifer   Administration Assistant   Administration
Fay          Pat        Marketing Representative   Marketing
Hartstein    Michael    Marketing Manager   Marketing
Raphaely     Den        Purchasing Manager   Purchasing
*/

SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;

SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

--내가 풀었던 방법 1
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM JOBS J RIGHT JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
    LEFT JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--내가 풀었던 방법 2
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM JOBS J, EMPLOYEES E, DEPARTMENTS D
WHERE J.JOB_ID = E.JOB_ID
 AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
 
 
--○ EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS 테이블을 대상으로
--   직원들의 데이터를 다음과 같이 조회한다.
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME
--   , CITY, COUNTRY_NAME, REGION_NAME
SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM LOCATIONS;

SELECT *
FROM COUNTRIES;

SELECT *
FROM REGIONS;

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM JOBS J RIGHT JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
  LEFT JOIN DEPARTMENTS D
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
  LEFT JOIN LOCATIONS L
  ON D.LOCATION_ID = L.LOCATION_ID
  LEFT JOIN COUNTRIES C
  ON L.COUNTRY_ID = C.COUNTRY_ID
  LEFT JOIN REGIONS R
  ON C.REGION_ID = R.REGION_ID;


SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM JOBS J, EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE J.JOB_ID(+) = E.JOB_ID AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) AND D.LOCATION_ID = L.LOCATION_ID(+) AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
  
 













