SELECT USER
FROM DUAL;
--==>> HR


--���� ���� �ǽ� ���� ����--

-- HR ���� ��Ű�� ERD �� �̿��� ���̺� �籸��

-- ������ HR ��Ű���� �ִ� �⺻ ���̺�(7��)
-- COUNTRIES / DEPARTMENTS / EMPLOYEES / JOBS / JOB_HISTORY 
-- / LOCATIONS / REGIONS
-- �� �Ȱ��� ���� �����Ѵ�.

-- ��, �����ϴ� ���̺� �̸��� �����̺��+����ȣ��
-- COUNTRIES04 / DEPARTMENTS04 / EMPLOYEES04 / JOBS04 / JOB_HISTORY04 
-- / LOCATIONS04 / REGIONS04
-- �� �Ȱ��� ���� �����Ѵ�.


-- 1. �⺻ ���̺��� ���� ����
-- 2. ���̺� ����(�÷� �̸�, �ڷ���, DEFAULT ǥ����, NOT NULL ��...)
--    �������� ����(PK, UK, FK, CK, ... , NN)
-- 3. �ۼ� �� ������ �Է�
-- 4. ���� �׸�
--    - 20210406_03_HR_�����ǽ�����_4��.sql
--    - �ı�_4��.txt
-- 5. ���� ����
--    ���� ���� 17:40 ����

-- �θ����̺� �������� ������ �ڽ����̺� �Էµ��� ����

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