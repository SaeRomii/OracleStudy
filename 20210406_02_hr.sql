SELECT USER
FROM DUAL;
--==>> HR


--■■■ 팀별 실습 과제 ■■■--

-- HR 샘플 스키마 ERD 를 이용한 테이블 재구성

-- 팀별로 HR 스키마에 있는 기본 테이블(7개)
-- COUNTRIES / DEPARTMENTS / EMPLOYEES / JOBS / JOB_HISTORY 
-- / LOCATIONS / REGIONS
-- 을 똑같이 새로 구성한다.

-- 단, 생성하는 테이블 이름은 『테이블명+팀번호』
-- COUNTRIES04 / DEPARTMENTS04 / EMPLOYEES04 / JOBS04 / JOB_HISTORY04 
-- / LOCATIONS04 / REGIONS04
-- 을 똑같이 새로 구성한다.


-- 1. 기본 테이블의 정보 수집
-- 2. 테이블 생성(컬럼 이름, 자료형, DEFAULT 표현식, NOT NULL 등...)
--    제약조건 설정(PK, UK, FK, CK, ... , NN)
-- 3. 작성 후 데이터 입력
-- 4. 제출 항목
--    - 20210406_03_HR_팀별실습과제_4조.sql
--    - 후기_4조.txt
-- 5. 제출 기한
--    금일 오후 17:40 까지

-- 부모테이블에 참조하지 않으면 자식테이블에 입력되지 않음

SELECT *
FROM COUNTRIES;
--REGION_ID, COUNTRY_ID

SELECT *
FROM DEPARTMENTS;
--DEPARTMENT_ID, MANAGER_ID, LOCATION_ID

SELECT *
FROM EMPLOYEES;
--DEPARTMENT_ID, EMPLOYEE_ID, JOB_ID, COMMISSION_PCT, MANAGER_ID,

SELECT *
FROM JOBS;
--JOB_ID