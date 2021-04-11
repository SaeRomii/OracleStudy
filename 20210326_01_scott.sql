SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ��¥�� �ð��� ���� ���� ȯ�� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--ȯ�� ���� ���� ��
--==>> 21/03/26	21/03/26	21/03/26 09:10:40.000000000
--ȯ�� ���� ���� ��
/*
2021-03-26 09:12:51             SYSDATE
2021-03-26 09:12:51             CURRENT_DATE
21/03/26 09:12:51.000000000     LOCALTIMESTAMP
*/

--�� ��¥�� �ð��� ���� ���� ȯ�� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ���� �ٽ� ��ȸ
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>>
/*
2021-03-26
2021-03-26
21/03/26 09:16:01.000000000
*/


--�� �÷��� �÷��� ����(����)
--   ���� Ÿ�԰� ���� Ÿ���� ����
--   ��+�������ڸ� ���� ���� ������ �Ұ��� �� ��||��

SELECT 1+1
FROM DUAL;
--==>> 2

SELECT '�谡��' + '������'
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '�谡��', '������'
FROM DUAL;
--==>> �谡��	������

SELECT '�谡��' || '������'
FROM DUAL;
--==>> �谡��������

DESC TBL_EMP;
--==>>
/*
EMPNO       NUMBER(4)    �� ���� Ÿ��
ENAME       VARCHAR2(10) �� ���� Ÿ��
        :
        :
*/


SELECT EMPNO, ENAME
FROM TBL_EMP;


--     _____    _____  EMPNO�� ����Ÿ�� ENAME�� ����Ÿ���ε� �ٸ� Ÿ�Ե� ���� ������
SELECT EMPNO || ENAME
FROM TBL_EMP;
--==>>
/*
7369SMITH
7499ALLEN
7521WARD
7566JONES
7654MARTIN
7698BLAKE
7782CLARK
7788SCOTT
7839KING
7844TURNER
7876ADAMS
7900JAMES
7902FORD
7934MILLER
8000���ִ�
8001������
*/


--      ����Ÿ��   ��¥Ÿ��  ����Ÿ�� ����Ÿ��  ����Ÿ��
--     ---------  --------  --------  ---- -------------
SELECT '�����̴�', SYSDATE, '�� ����', 500, '���� ���Ѵ�.'
FROM DUAL;
--==>> �����̴�	2021-03-26	�� ����	500	���� ���Ѵ�.


--      ����Ÿ��     ��¥Ÿ��    ����Ÿ��   ����Ÿ��   ����Ÿ��
--     ---------    --------   --------     ----   -------------
SELECT '�����̴�' || SYSDATE || '�� ����' || 500 || '���� ���Ѵ�.'
FROM DUAL;
--==>> �����̴�2021-03-26�� ����500���� ���Ѵ�.

--�� ����Ŭ������ ���� Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ������ ó���� ����ó�� ��||���� �������ָ� ������ �÷��� �÷���
--   (���� �ٸ� ������ ������) �����ϴ� ���� �����ϴ�.
--   MS-SQL ������ ��� �����͸� ���� Ÿ������ CONVERT �ؾ� �Ѵ�.


--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--   ��� �������� �����Ϳ� ���ؼ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.

--   SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
--   ALLEN�� ���� ������ 19500�ε� ��� ������ 39000�̴�.

--�� ������ �ذ��ϱ� ���� ���ִ� ����� ������ ��� ����
SELECT *
FROM TBL_EMP
WHERE EMPNO=8000 OR EMPNO=8001;

SELECT *
FROM TBL_EMP
WHERE EMPNO IN (8000, 8001);

DELETE
FROM TBL_EMP
WHERE EMPNO IN (8000, 8001);
--==>> 2�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>> ���� ��.

--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_EMP;

--   SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
--   ALLEN�� ���� ������ 19500�ε� ��� ������ 39000�̴�.
-- ������.. SAL*12 + COMM ��..

--���� Ǭ ��
SELECT ENAME || '�� ���� ������' || (SAL*12+NVL(COMM, 0)) || '�ε� ��� ������' || (SAL*12+NVL(COMM, 0)*2) || '�̴�.'
FROM TBL_EMP;
-- ��ȣ �� ���� ^^
/*
SMITH�� ���� ������9600�ε� ��� ������9600�̴�.
ALLEN�� ���� ������19500�ε� ��� ������19800�̴�.
WARD�� ���� ������15500�ε� ��� ������16000�̴�.
JONES�� ���� ������35700�ε� ��� ������35700�̴�.
MARTIN�� ���� ������16400�ε� ��� ������17800�̴�.
BLAKE�� ���� ������34200�ε� ��� ������34200�̴�.
CLARK�� ���� ������29400�ε� ��� ������29400�̴�.
SCOTT�� ���� ������36000�ε� ��� ������36000�̴�.
KING�� ���� ������60000�ε� ��� ������60000�̴�.
TURNER�� ���� ������18000�ε� ��� ������18000�̴�.
ADAMS�� ���� ������13200�ε� ��� ������13200�̴�.
JAMES�� ���� ������11400�ε� ��� ������11400�̴�.
FORD�� ���� ������36000�ε� ��� ������36000�̴�.
MILLER�� ���� ������15600�ε� ��� ������15600�̴�.
*/

--��� 1
SELECT ENAME || '�� ���� ������' || NVL(SAL*12+COMM, SAL*12)
    || '�ε� ��� ������' || NVL(SAL*12+COMM, SAL*12)*2 || '�̴�.'
FROM TBL_EMP;


--��� 2
SELECT ENAME || '�� ���� ������' || NVL2(COMM, SAL*12+COMM, SAL*12)
    || '�ε� ��� ������' || NVL2(COMM, SAL*12+COMM, SAL*12)*2 || '�̴�.'
FROM TBL_EMP;


--��� 3
SELECT ENAME || '�� ���� ������' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)
    || '�ε� ��� ������' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)*2 || '�̴�.'
FROM TBL_EMP;



SELECT *
FROM TBL_EMP;

-- SMITH's �Ի����� 1980-12-17 �̴�. �׸��� �޿��� 800 �̴�.
-- ALLEN's �Ի����� 1981-02-20 �̴�. �׸��� �޿��� 1600 �̴�.

SELECT ENAME || '''s' ||' �Ի�����' || HIREDATE || '�̴�. �׸��� �޿���' || SAL || '�̴�.'
FROM TBL_EMP;

--�� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--   Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�.
--   Ȭ����ǥ ��'���ϳ��� ���ڿ��� ������ ��Ÿ����
--   Ȭ����ǥ ��''���� ���� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--   �ٽ� �����ϴ� Ȭ����ǥ ��'���ϳ��� ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.


--------------------------------------------------------------------------------------------------

SELECT *
FROM EMP
WHERE JOB = 'salesman';
--==>> ��ȸ ��� ����

--�� UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "1", UPPER('oRaCLe') "2", LOWER('oRaCLe') "3", INITCAP('oRaCLe') "4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
-- UPPER()�� ��� �빮�ڷ� ��ȯ�Ͽ� ��ȯ
-- LOWER()�� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
-- INITCAP()�� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ

-- TBL_EMP ���� 'SalEsmAn' ��ȸ ������ �ۼ�
SELECT *
FROM TBL_EMP
WHERE JOB = UPPER('SalEsmAn');
--==>>
/*
7499	ALLEN	SALESMAN	    7698	1981-02-20	1600	300	    30
7521	    WARD    	SALESMAN	    7698	1981-02-22	1250    	500 	30
7654	MARTIN	SALESMAN    	7698	1981-09-28	1250    	1400	30
7844	TURNER	SALESMAN	    7698	1981-09-08	1500	0	    30
*/

INSERT INTO TBL_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8000, '������', 'salesMAN', 7698, SYSDATE, 2000, 200, 30);
INSERT INTO TBL_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8001, '������', 'SalesMAN', 7698, SYSDATE, 2000, 200, 30);
INSERT INTO TBL_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8002, '������', 'salesman', 7698, SYSDATE, 2000, 200, 30);
INSERT INTO TBL_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8003, '������', 'SALESman', 7698, SYSDATE, 2000, 200, 30);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *4


--�� Ȯ��
SELECT *
FROM TBL_EMP;

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� TBL_EMP ���̺��� ��ҹ��� ���о��� ������� ������ �����
--   �����ȣ, �����, ����, �Ի���, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "����", HIREDATE"�Ի���", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE UPPER(JOB) = 'SALESMAN';
--==>>
/*
7499	ALLEN	SALESMAN    	1981-02-20	30
7521	    WARD    	SALESMAN    	1981-02-22	30
7654	MARTIN	SALESMAN	    1981-09-28	30
7844	TURNER	SALESMAN	    1981-09-08	30
8000	������	salesMAN    	2021-03-26	30
8001	������	SalesMAN    	2021-03-26	30
8002    	������	salesman	    2021-03-26	30
8003	������	SALESman	    2021-03-26	30
*/

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "����", HIREDATE"�Ի���", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE JOB='SALESMAN' OR JOB='salesMAN' OR JOB='SalesMAN' OR JOB='salesman' OR JOB='SALESman';

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "����", HIREDATE"�Ի���", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'salesMAN', 'SalesMAN', 'salesman', 'SALESman');

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "����", HIREDATE"�Ի���", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('SALESMAN');
-- ������� �Է°��� �빮�ڷ�, ���̺� �ȿ� �ִ� ���� �빮�ڷ� �ٲ���

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "����", HIREDATE"�Ի���", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('SALESMAN');
-- ��� �� ����


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� �Ի��� ������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';
--==>> MARTIN	SALESMAN	    1981-09-28
--�̷��� ���� �ȵȴ�.. 313�࿡ �ٽ� ����


DESC TBL_EMP;
--HIREDATE�� DATE�� �Ǿ����� �ٵ� ���� �������� ��¥�� ���ڶ� ���ѰŶ� ���� ���� 
--����Ŭ�� �ڵ� �� ��ȯ���ذ���.. �ٵ� ����Ŭ �ڵ� �� ��ȯ�� ���� ����..

--�� TO_DATE()
SELECT '2021-03-26' "1", TO_DATE('2021-03-26', 'YYYY-MM-DD') "2"
FROM DUAL;
--==>> 2021-03-26	2021-03-26
-- ù��°�� ����, �ι�°�� ��¥


SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>> MARTIN	SALESMAN    	1981-09-28

SELECT TO_DATE('2021-02-30', 'YYYY-MM-DD') "���Ȯ��"
FROM DUAL;
--==>> 2�� 28�ϱ��� �ۿ� ��� ������


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� ����(�ش��� ����)��
--   �Ի��� ������ �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	    1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	    PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD    	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
������	salesMAN	    2021-03-26
������	SalesMAN	    2021-03-26
������	salesman	    2021-03-26
������	SALESman	    2021-03-26
*/

--�� ����Ŭ������ ��¥ �������� ũ�� �񱳰� �����ϴ�.
--   ����Ŭ���� ��¥ �����Ϳ� ���� ũ�� �� ��
--   ���ź��� �̷��� �� ū ������ �����Ͽ� ó���ȴ�.


--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�� ����
--   1981�� 9�� 28�� ���̿� �Ի��� ��������
--   �����ȣ, �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') 
  AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
7566	JONES	MANAGER	    1981-04-02
7654	MARTIN	SALESMAN    	1981-09-28
7698	BLAKE	MANAGER	    1981-05-01
7782	    CLARK	MANAGER	    1981-06-09
7844	TURNER	SALESMAN	    1981-09-08
*/


--�� BETWEEN �� AND �� �� ��¥�� ������� ����
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') 
                   AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
7566	JONES	MANAGER	    1981-04-02
7654	MARTIN	SALESMAN	    1981-09-28
7698	BLAKE	MANAGER	    1981-05-01
7782    	CLARK	MANAGER	    1981-06-09
7844	TURNER	SALESMAN	    1981-09-08
*/

--�� BETWEEN �� AND �� �� ���ڸ� ������� ����
SELECT EMPNO, ENAME, SAL
FROM TBL_EMP
WHERE SAL BETWEEN 1600 AND 3000;
--==>>
/*
7499	ALLEN	1600
7566	JONES	2975
7698	BLAKE	2850
7782	    CLARK	2450
7788	SCOTT	3000
7902    	FORD    	3000
8000	������	2000
8001	������	2000
8002    	������	2000
8003	������	2000
*/


--�� BETWEEN �� AND �� �� ���ڸ� ������� ����
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
--==>>
/*
7566	JONES	MANAGER	    2975
7654	MARTIN	SALESMAN	    1250
7782	    CLARK	MANAGER	    2450
7839	KING    	PRESIDENT	5000
7900	JAMES	CLERK	    950
7902	    FORD	    ANALYST	    3000
7934	MILLER	CLERK	    1300
*/
--���� ���¿��� C���� S������� �ϸ� S~~�� �ܾ��̸� S�� �ѱ� ������ �ȳ�������, �׳� S�ϳ���� ����

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
--�ҹ��� s������ �س����� W�� ������ Z�� ����..


--�� BETWEEN �� AND �� �� ��¥��, ������, ������ ������ ��ο� ����ȴ�.
--   ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������
--   �빮�ڰ� ���ʿ� ��ġ�ϰ�, �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����, BETWEEN �� AND �� �� �������� ����Ǵ� ��������
--   ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ������ ó���ȴ�.

--�� ASCII()
SELECT ASCII('A') "1", ASCII('B') "2", ASCII('a') "3", ASCII('b') "4" 
FROM DUAL;
--==>> 65	66	97	98


--������ �Է��صξ��� �׸� ����
DELETE
FROM TBL_EMP
WHERE EMPNO BETWEEN 8000 AND 8003;
--==>> 4�� �� ��(��) �����Ǿ����ϴ�.


COMMIT;
--==>> Ŀ�� ��.


--�� TBL_EMP ���̺��� ������ SALESMAN �� CLERK �� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
--���� Ǭ ��
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB = 'SALESMAN' OR JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	    800
7499	ALLEN	SALESMAN	    1600
7521    	WARD	    SALESMAN	    1250
7654	MARTIN	SALESMAN	    1250
7844	TURNER	SALESMAN    	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	    950
7934	MILLER	CLERK	    1300
*/

SELECT *
FROM TBL_EMP;


SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLERK');
--==>>
/*
7369	SMITH	CLERK	    800
7499	ALLEN	SALESMAN	    1600
7521	    WARD	    SALESMAN    	1250
7654	MARTIN	SALESMAN    	1250
7844	TURNER	SALESMAN    	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	    950
7934	MILLER	CLERK	    1300
*/


SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN', 'CLERK');
--ANY ����̶�
--��=ALL���� ����
--==>>
/*
7369	SMITH	CLERK	    800
7499	ALLEN	SALESMAN	    1600
7521	    WARD	    SALESMAN    	1250
7654	MARTIN	SALESMAN    	1250
7844	TURNER	SALESMAN    	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	    950
7934	MILLER	CLERK	    1300
*/


--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--   ������, �� ���� �������� ���� ������ ó���ȴ�.
--   ����, �޸𸮿� ���� ������ �ƴ϶� CPU�� ���� �����̹Ƿ�
--   �� �κб��� �����Ͽ� �������� ������ �����Ͽ� �����ϴ� ���� ���� �ʴ�.
--   �� ��IN���� ��=ANY���� ���� ������ ȿ���� ������.
--   ��� ���������δ� ��OR�������� ����Ǿ� ���� ó���ȴ�.


--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE            DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>> Table TBL_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)
*/

--�� ������ �Է�
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '�谡��', '9402252234567', TO_DATE('2001-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '�輭��', '9412272234567', TO_DATE('2010-11-05', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '��ƺ�', '9303082234567', TO_DATE('1999-08-16', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '������', '9609142234567', TO_DATE('2008-02-02', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '������', '9712242234567', TO_DATE('2009-07-15', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '9710062234567', TO_DATE('2009-07-15', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0405064234567', TO_DATE('2010-06-05', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '0103254234567', TO_DATE('2012-07-13', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '9804251234567', TO_DATE('2007-07-08', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '������', '0204254234567', TO_DATE('2008-12-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '7505071234567', TO_DATE('1990-10-10', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '���켱', '9912122234567', TO_DATE('2002-10-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '������', '7101092234567', TO_DATE('1991-11-11', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '������', '0203043234567', TO_DATE('2010-05-05', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '���ü�', '0512123234567', TO_DATE('2012-08-14', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1016, '����', '7012121234567', TO_DATE('1990-08-14', 'YYYY-MM-DD'), 2000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 16

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	�谡��	    9402252234567	2001-01-03	3000
1002    	�輭��	    9412272234567	2010-11-05	2000
1003	��ƺ�	    9303082234567	1999-08-16	5000
1004	������	    9609142234567	2008-02-02	4000
1005	������	    9712242234567	2009-07-15	2000
1006	������	    9710062234567	2009-07-15	2000
1007	������	    0405064234567	2010-06-05	1000
1008	������	    0103254234567	2012-07-13	3000
1009	������	    9804251234567	2007-07-08	4000
1010	������	    0204254234567	2008-12-10	2000
1011	������	    7505071234567	1990-10-10	3000
1012    	���켱	    9912122234567	2002-10-10	2000
1013	������	    7101092234567	1991-11-11	1000
1014	������	    0203043234567	2010-05-05	2000
1015	���ü�	    0512123234567	2012-08-14	1000
1016	����	        7012121234567	1990-08-14	2000
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� ��.

--�� TBL_SAWON ���̺��� �谡�� ����� ������ ��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '�谡��';
--==>> 1001	�谡��	9402252234567	2001-01-03	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '�谡��';
--==>> 1001	�谡��	9402252234567	2001-01-03	3000

--�� LIKE : ���� �� �����ϴ�
--          �λ� �� ~�� ����, ~ó��

--�� WILD CARD(CHARACTER) �� ��%��
--   ��LIKE���� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��Ѵ�.
--   ��LIKE���� �Բ� ���Ǵ� ��_���� �ƹ� ���� 1���� �ǹ��Ѵ�.


--�� TBL_SAWON ���̺��� ������ ���̡����� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '��';
--==>> ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '��__';
--==>> ��ȸ ��� ����


SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>
/*
������	9609142234567	4000
������	0405064234567	1000
������	0204254234567	2000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>> ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
������	9609142234567	4000
������	0405064234567	1000
������	0204254234567	2000
*/

--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ����������
--   ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>>
/*
������	9609142234567	2008-02-02	4000
������	9710062234567	2009-07-15	2000
*/

--�� TBL_SAWON ���̺��� �̸��� �� ��° ���ڰ� ���̡��� �����
--   �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '_��%';
--==>>
/*
������	0103254234567	2012-07-13	3000
������	0204254234567	2008-12-10	2000
����  	7012121234567	1990-08-14	2000
*/


--�� TBL_SAWON ���̺��� �̸��� ���̡���� ���ڰ�
--   �ϳ��� ���ԵǾ� ������ �� �����
--   �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
������	9609142234567	2008-02-02	4000
������	0405064234567	2010-06-05	1000
������	0103254234567	2012-07-13	3000
������	9804251234567	2007-07-08	4000
������	0204254234567	2008-12-10	2000
����	    7012121234567	1990-08-14	2000
*/

--�� TBL_SAWON ���̺��� �̸��� ���̡���� ���ڰ�
--   �������� �� �� ���ԵǾ� ������ �� �����
--   �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';
--==>> ������	0204254234567	2008-12-10	2000

--�� TBL_SAWON ���̺��� �̸��� ���̡���� ���ڰ�
--   �� �� ���ԵǾ� ������ �� �����
--   �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
--==>> 
/*
������	0405064234567	2010-06-05	1000
������	0204254234567	2008-12-10	2000
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--�̰žȵ�.. �ֳĸ�.. ���ü� ���� ������ ���ϱ� ���� ���ϱ� ���ڳ�


--�� �����ͺ��̽� ���� �� ���� �̸��� �и��ؼ� ó���ؾ� ��
--   ���� ��ȹ�� �ִٸ�(���� ������ �ƴϴ���)
--   ���̺��� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.


--�� TBL_SAWON ���̺��� ���������� �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%';
--JUBUN�� 7��°�ڸ� 2,4 �϶�..
--==>>
/*
�谡��	    9402252234567	3000
�輭��	    9412272234567	2000
��ƺ�	    9303082234567	5000
������	    9609142234567	4000
������	    9712242234567	2000
������	    9710062234567	2000
������	    0405064234567	1000
������	    0103254234567	3000
������	    0204254234567	2000
���켱	    9912122234567	2000
������    	7101092234567	1000
*/

--�� �ǽ� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR2(20)
, BIGO          VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է�
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('���ð�', '�� ������ 99.99���� ȹ���� �ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

--�� Ȯ��
SELECT *
FROM TBL_WATCH;
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�.

--�� TBL_WATCH ���̺��� BIGO �÷���
--   ��99.99%����� ���ڰ� ����ִ� ��(���ڵ�)�� ������ ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%';
--==>> 
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';

--ESCAPE����.. %��.. _ �̷��� �� �� ���

--�� ESCAPE �� ���� ������ ���� �� ���ڴ� ���ϵ�ī��(ĳ����)���� Ż����Ѷ�
--  ��ESCAPE '\'��
--  �Ϲ������� Ű���尡 �ƴ�, �����ڵ� �ƴ�, ���󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.

--���� COMMIT / ROLLBACK ����--
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/


--�� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
-- 50��... ���ߺ�... ����...
-- �� �����ʹ� TBL_EDPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴ϶�
-- �޸�(RAM) �� �Էµ� ���̴�.


--�� Ȯ��
SELECT *
FROM TBL_DEPT;

--�� �ѹ�
ROLLBACK;
--==>> �ѹ��.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50��... ���ߺ�... ����...
--  �� ���� �����Ͱ� �ҽǵǾ����� Ȯ��(�������� ����)

--�� �ٽ� �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--> �޸𸮻� �Էµ� �� �����͸� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
--  COMMIT �� �����ؾ� �Ѵ�.


--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH    	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�.

--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� ��.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
--  50��...���ߺ�...����...�� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��


--�� COMMIT �� ������ ���ķ� DML ����(INSERT, UPDATE, DELETE ��)�� ����
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ����� ����� �� COMMIT �ϰ��� ROLLBACK �� �����غ���
--   ���� ���·� �ǵ��� �� ����. (�ƹ��� �ҿ��� ����.)

--�� ������ ����(TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME='������', LOC='���'
WHERE DEPTNO=50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	������	    ���
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� ��.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> ����(UPDATE)�� �����ϱ� ���� ���·� �����Ǿ����� Ȯ��

--�� ������ ����(TBL_DEPT)
SELECT *
FROM TBL_DEPT
WHERE DEPTNO = 50;
--==>> 50	���ߺ�	����

DELETE
FROM TBL_DEPT
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/


--�� �ѹ�(ROLLBACK)
ROLLBACK;
--==>> �ѹ��.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> ����(DELETE) ������ �����ϱ� ���� ���·� �����Ǿ����� Ȯ��.


-------------------------------------------------------------------------


--���� ����(ORDER BY) �� ����--
-- ���ҽ� �Ҹ� ���ϴ�

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
SMITH	20	CLERK	    800	    9600
ALLEN	30	SALESMAN    	1600	19500
WARD    	30	SALESMAN    	1250	    15500
JONES	20	MANAGER	    2975    	35700
MARTIN	30	SALESMAN    	1250    	16400
BLAKE	30	MANAGER	    2850    	34200
CLARK	10	MANAGER	    2450    	29400
SCOTT	20	ANALYST	    3000	36000
KING    	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	    1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
FORD    	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY DEPTNO ASC;    --�����ϰڴ� �μ���ȣ�� �������� ������������(ASC)
--==>>
/*
CLARK	10	MANAGER	    2450	    29400
KING	    10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	    35700
FORD    	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	    30	SALESMAN	    1250	    15500
TURNER	30	SALESMAN	    1500	18000
ALLEN	30	SALESMAN	    1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	    34200
MARTIN	30	SALESMAN	    1250	    16400
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY DEPTNO;    -- ASC(��������) ���� ���� �� �Ⱦ��� �⺻���� ������������ �ν�


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY DEPTNO DESC;   -- �����ϰڴ� �μ���ȣ�� �������� ������������(DESC)
                        -- DESC �������� ������ ���� �Ұ���
--==>>
/*
BLAKE	30	MANAGER	    2850	    34200
TURNER	30	SALESMAN    	1500	18000
ALLEN	30	SALESMAN	    1600	19500
MARTIN	30	SALESMAN	    1250    	16400
WARD	    30	SALESMAN	    1250	    15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	    35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD    	20	ANALYST	    3000	36000
KING	    10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450    	29400
*/

-- ����Ŭ������ DESC�� �������� �ȴ�. �������� DESC, ��ũ���̺� �Ӵ��� ��ư �̰Ŷ� �������� �˱� ������
-- �� �����ؼ� �����~!

-- �޿� ���� ��������
SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY SAL DESC;
--==>>
/*

*/

-- ���� ���� ��������
SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY ���� DESC;
--==>>
/*
KING    	10	PRESIDENT	5000	60000
FORD    	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	    35700
BLAKE	30	MANAGER	    2850	    34200
CLARK	10	MANAGER	    2450	    29400
ALLEN	30	SALESMAN	    1600	19500
TURNER	30	SALESMAN	    1500	18000
MARTIN	30	SALESMAN    	1250	    16400
MILLER	10	CLERK	    1300	15600
WARD	    30	SALESMAN	    1250	    15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
SMITH	20	CLERK	    800 	9600
*/
--> ORDER BY ������ SELECT ���� ���� ó���Ǳ� ������
--  �÷��� ��� SELECT ������ ����� ALIAS(��Ī)��
--  ORDER BY ������ ����ص� ������ �߻����� �ʴ´�. (�����ϴ�.)


SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY �μ� ��ȣ DESC;
--==>> �����߻�

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY "�μ� ��ȣ" DESC;
--==>>
/*
BLAKE	30	MANAGER	    2850	    34200
TURNER	30	SALESMAN    	1500	18000
ALLEN	30	SALESMAN    	1600	19500
MARTIN	30	SALESMAN    	1250	    16400
WARD    	30	SALESMAN    	1250    	15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975    	35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD    	20	ANALYST	    3000	36000
KING	    10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	    29400
*/

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB "����", SAL "�޿�"
    , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY 2;
-- �� ��° �÷� ��������
--==>>
/*
CLARK	10	MANAGER	    2450	    29400
KING    	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	    35700
FORD	    20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	    30	SALESMAN	    1250	    15500
TURNER	30	SALESMAN	    1500	18000
ALLEN	30	SALESMAN	    1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	    34200
MARTIN	30	SALESMAN	    1250	    16400
*/
--> TBL_EMP ���̺��� ���� �ִ� ���̺��� ������ Į�� ������ �ƴ϶�
--  SELECT ó�� �Ǵ� �� ��° �÷�(��, DEPTNO)�� �������� ���ĵǴ� ���� Ȯ��
--  ASC ������ ���� �� �������� ���ĵǴ� ���� Ȯ��

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 4;  -- DEPTNO ���� 1�� ����, SAL ���� 2�� ���� ASC
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING    	10	PRESIDENT	5000
SMITH	20	CLERK	    800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER	    2975
SCOTT	20	ANALYST	    3000
FORD    	20	ANALYST	    3000
JAMES	30	CLERK	    950
MARTIN	30	SALESMAN    	1250
WARD	    30	SALESMAN	    1250
TURNER	30	SALESMAN	    1500
ALLEN	30	SALESMAN	    1600
BLAKE	30	MANAGER	    2850
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2,3,4 DESC;
--> �� DEPTNO(�μ���ȣ) ���� �������� ����
--  �� JOB(������) ���� �������� ����
--  �� SAL(�޿�) ���� �������� ����
--  (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING    	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD    	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	    800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	    950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN    	1600
TURNER	30	SALESMAN    	1500
MARTIN	30	SALESMAN    	1250
WARD    	30	SALESMAN    	1250
*/

-----------------------------------------------------------------------------

--�� CONCAT() �� ���ڿ� ���� �Լ�
SELECT '�Ҽ���' || '������' "1"
    , CONCAT('�Ҽ���', '������') "2"
FROM DUAL;
--==>> �Ҽ���������	�Ҽ���������


SELECT ENAME || JOB "1"
    , CONCAT(ENAME, JOB) "2"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	    WARDSALESMAN
JONESMANAGER	    JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	    BLAKEMANAGER
CLARKMANAGER	    CLARKMANAGER
SCOTTANALYST	    SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST	    FORDANALYST
MILLERCLERK	    MILLERCLERK
*/

SELECT ENAME || JOB || DEPTNO "1"
    , CONCAT(ENAME, JOB, DEPTNO) "2"
FROM TBL_EMP;
--==>> ���� �߻�
--> 2���� ���ڿ��� ���ս����ִ� ����� ���� �Լ�.
--  ������ 2���� ���ս�ų �� �ִ�.


SELECT ENAME || JOB || DEPTNO "1"
    , CONCAT(CONCAT(ENAME, JOB), DEPTNO) "2"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30	ALLENSALESMAN30
WARDSALESMAN30	WARDSALESMAN30
JONESMANAGER20	JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	BLAKEMANAGER30
CLARKMANAGER10	CLARKMANAGER10
SCOTTANALYST20	SCOTTANALYST20
KINGPRESIDENT10	KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	FORDANALYST20
MILLERCLERK10	MILLERCLERK10
*/

--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--  CONCAT() �� ���ڿ��� ���ڿ��� ������� ������ �����ϴ� �Լ�������
--  ���������δ� ���ڳ� ��¥�� ���� Ÿ������ �ٲپ��ִ� ������ ���ԵǾ� �ִ�.

--�� JAVA �� String.subString()
/*
obj.subString()
---
 ��
 ���ڿ�.subString(n, m); �� ���ڿ� ����
                ------
                n ���� m-1���� (0���� �����ϴ� �ε��� ����)
*/

--�� SUBSTR() ���� ��� / SUBSTRB() ����Ʈ ��� �� ���ڿ� ���� �Լ�
SELECT ENAME "1"
    , SUBSTR(ENAME, 1, 2) "2"
FROM TBL_EMP;
-- ����Ŭ�� 1���� ����... ENAME, 1, 2 �̸� 1��°���� 2��


--�� SUBSTR() ���� ��� / SUBSTRB() ����Ʈ ��� �� ���ڿ� ���� �Լ�
SELECT ENAME "1"
    , SUBSTR(ENAME, 1, 2) "2"
    , SUBSTR(ENAME, 2, 2) "3"
    , SUBSTR(ENAME, 3, 2) "4"
    , SUBSTR(ENAME, 2) "5"
FROM TBL_EMP;
--> ���ڿ��� �����ϴ� ����� ���� �Լ�
--  ù ��° �Ķ���� ���� ��� ���ڿ�(������ ���)
--  �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(��, �ε����� 1���� ����)
--  �� ��° �Ķ���� ���� ������ ���ڿ��� ����(���� ��... ������ġ ���� ������)
--==>>
/*
SMITH	SM	MI	IT	MITH
ALLEN	AL	LL	LE	LLEN
WARD	WA	AR	RD	ARD
JONES	JO	ON	NE	ONES
MARTIN	MA	AR	RT	ARTIN
BLAKE	BL	LA	AK	LAKE
CLARK	CL	LA	AR	LARK
SCOTT	SC	CO	OT	COTT
KING	KI	IN	NG	ING
TURNER	TU	UR	RN	URNER
ADAMS	AD	DA	AM	DAMS
JAMES	JA	AM	ME	AMES
FORD	FO	OR	RD	ORD
MILLER	MI	IL	LL	ILLER
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�,
--   �޿� �������� �������� ������ ������ �� �ֵ��� �Ѵ�.
SELECT SANAME "�����ȣ", SANO "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1)=1 OR SUBSTR(JUBUN, 7, 1)=3
ORDER BY �޿� DESC;
--�ٽ� �ϱ�....


























































































