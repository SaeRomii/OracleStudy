SELECT USER
FROM DUAL;
--==>> HR

--�� EMPLOYEES ���̺��� ������ SALARY �� 10% �λ��Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.
--   (����� ����� Ȯ�� �� ROLLBACK)
SELECT *
FROM DEPARTMENTS;
--==>>
/*
10	Administration	200	1700
20	Marketing	201	1800
30	Purchasing	114	1700
40	Human Resources	203	2400
50	Shipping	121	1500
60	IT	103	1400
70	Public Relations	204	2700
80	Sales	145	2500
90	Executive	100	1700
100	Finance	108	1700
110	Accounting	205	1700
120	Treasury		1700
130	Corporate Tax		1700
140	Control And Credit		1700
150	Shareholder Services		1700
160	Benefits		1700
170	Manufacturing		1700
180	Construction		1700
190	Contracting		1700
200	Operations		1700
210	IT Support		1700
220	NOC		1700
230	IT Helpdesk		1700
240	Government Sales		1700
250	Retail Sales		1700
260	Recruiting		1700
270	Payroll		1700
*/

--EMPLOYEES ���̺��� ������ SALARY �� 10% �λ�
--�����ؼ� ������ ������.. DEPARTMENT_NAME IT�ΰ�..

--���� ���̺� ��ȸ
SELECT *
FROM EMPLOYEES;

--����
UPDATE TBL_SAWON
SET SANAME=( SELECT SANAME
             FROM TBL_SAWONBACKUP
             WHERE SANO = TBL_SAWON.SANO);
             

UPDATE EMPLOYYES
SET SALARY=SALARY*1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME='IT');
                       
                       
--�������� Ǯ���� ���
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(DEPARTMENTS ���̺��� IT �μ��� �μ�ID);


SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1
FROM EMPLOYEES
WHERE DEPARTMENT_ID=( SELECT DEPARTMENT_ID
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME='IT');
                      

-- UPDATE
UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE DEPARTMENT_ID=( SELECT DEPARTMENT_ID
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME='IT');

-- Ȯ��                      
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1
FROM EMPLOYEES
WHERE DEPARTMENT_ID=( SELECT DEPARTMENT_ID
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME='IT');
                      

ROLLBACK;
--==>> �ѹ� ��

--�� EMPLOYEES ���̺��� JOB_TITLE �� ��Sales Manager���� �������
--   SALARY �� �ش� ����(����)�� �ְ� �޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���Ͽ�
--   ������ �� �ֵ��� ó���Ѵ�.
--   (������ �ۼ��Ͽ� ��� Ȯ�� �� ROLLBACK)

--JOB_TITLE��.. JOBS�� �ְ���
--MAX_SALARY�� JOBS�� ����

SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

UPDATE EMPLOYEES
SET SALARY= ( SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID=( SELECT JOB_ID
               FROM JOBS
               WHERE JOB_TITLE='Sales Manager')
 AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
 

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE='Sales Manager')
 AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>>
/*
John    	20080
Karen	20080
Alberto	20080
*/

ROLLBACK;
--==>> �ѹ��

--�� EMPLOYEES ���̺��� SALARY ��
--   �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance �� 10%
--   Executive �� 15%
--   Accounting �� 20%
--   (������ �ۼ��Ͽ� ��� Ȯ�� �� ROLLBACK)
SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY*1.1
                               WHEN (SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY*1.15
                               WHEN (SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY*1.2
                               ELSE SALARY
             END;
--==>> 107�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


ROLLBACK;
--==>> �ѹ��
                                                
                     
--�������� Ǯ���� ���
-- WHERE ������ �Ἥ Ǯ��
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY*1.1
                               WHEN (SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY*1.15
                               WHEN (SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY*1.2
                               ELSE SALARY
             END
WHERE DEPARTMENT_ID IN (100, 90, 110);


UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY*1.1
                               WHEN (SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY*1.15
                               WHEN (SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY*1.2
                               ELSE SALARY
             END
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
--==>>  �ѹ��

-------------------------------------------------------------------------------------------

--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴ� �� ����ϴ� ����

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;


-- ����
DELETE
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ��


--�� EMPLOYEES ���̺��� �������� ������ �����Ѵ�.
--   ��, �μ����� 'IT'�� ��� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ���)
--   �ٸ� ���̺�(Ȥ�� �ڱ� �ڽ� ���̺�)�� ���� �������ϰ� �ִ� ���
--   �������� ���� �� �ִٴ� ����� �����ؾ� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
                        

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> ���� �߻�
/*
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/

--------------------------------------------------------------------------------

--���� ��(VIEW) ����--

-- 1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
--    �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͵鸸��
--    ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ���ϴ� �÷��鸸 ��Ƽ�
--    �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

--    ������ ���̺��̶� �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--    �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̸�
--    �� ������ �����س��� SQL �����̶�� �� �� �ִ�.


-- 2. ���� �� ����
-- CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- ��������(SUBQUERY)
-- [WITH CHECK OPRION]
-- [WITH READ ONLY];


--�� �� (VIEW) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME
     , D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.


--�� ��(VIEW) ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;


--�� ��(VIEW) ���� Ȯ��
DESC VIEW_EMPLOYEES;
--==>>
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/

--�� ��(VIEW) �ҽ� Ȯ��       -- CHECK
SELECT VIEW_NAME, TEXT        -- TEXT
FROM USER_VIEWS               -- USER_VIEWS
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';

/*
TEXT
"SELECT E.FIRST_NAME, E.LAST_NAME
     , D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+)"
  
�� ������ �� ��� ������ Ȯ�� ������~!
*/















