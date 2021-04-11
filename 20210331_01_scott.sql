SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO
            ELSE '���μ�'
            END "�μ���ȣ"
          , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> ���� �߻�
/*
ORA-00932: inconsistent datatypes: expected NUMBER got CHAR
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:
10��, 18������ ���� �߻�
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN TO_CHAR(DEPTNO)
            ELSE '���μ�'
            END "�μ���ȣ"
          , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
(null)      8000
���μ�	    37025
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '���μ�'
            END "�μ���ȣ"
          , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
����	    8000
���μ�	    37025
*/


--�� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
---------------------------
    ����        �޿���
---------------------------
     ��          XXXXX
     ��         XXXXXX
     �����   XXXXXX
*/

SELECT *
FROM TBL_SAWON;

--���� Ǯ���� ���
SELECT NVL(T.����, '�����') "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
                ELSE '����Ȯ�κҰ�'
            END "����"
          , SAL "�޿�"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
����	    12000
����	    24300
�����	    36300
*/

--�������� Ǯ���� ���
SELECT T.���� "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
                ELSE '����Ȯ�κҰ�'
           END "����"
         , SAL "�޿�"
FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	    12000
��	    24100
(null)	36100
*/

SELECT CASE GROUPING(T.����) WHEN 0 THEN T.����
            ELSE '�����'
       END "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
                ELSE '����Ȯ�κҰ�'
           END "����"
         , SAL "�޿�"
FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	        12000
��	        24100
�����	    36100
*/

SELECT *
FROM VIEW_SAWON;

--�� TBL_SAWON ���̺��� ������ ���� ���ɴ뺰 �ο��� ���·�
--   ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
------------------------
    ���ɴ�     �ο���
------------------------
      10         X
      20         X
      30         X
      40         X
      50         X
     ��ü       XX
------------------------
*/

SELECT *
FROM TBL_SAWON;

--���� Ǯ���� ��� 1
SELECT  NVL(TO_CHAR(T.���糪��), '��ü') "���ɴ�"
      , COUNT(*) "�ο���"

FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899), -1)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999), -1)
                ELSE 0
           END "���糪��"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.���糪��);
--==>>
/*
10	     2
20	    10
30	     1
40	     1
50	     2
��ü 	16
*/


--���� Ǯ���� ��� 2(��ø ������)
SELECT NVL(Q.���ɴ�, '��ü') "���ɴ�"
     , COUNT(*) "�ο���"
FROM
(
    SELECT CASE WHEN T.���糪�� >=10 AND T.���糪��<=19 THEN '10'
                WHEN T.���糪�� >=20 AND T.���糪��<=29 THEN '20'
                WHEN T.���糪�� >=30 AND T.���糪��<=39 THEN '30'
                WHEN T.���糪�� >=40 AND T.���糪��<=49 THEN '40'
                WHEN T.���糪�� >=50 AND T.���糪��<=59 THEN '50'
                ELSE '�˼�����'
            END "���ɴ�"            
    FROM
    (
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE 0
                END "���糪��"
        FROM TBL_SAWON
    )T
)Q
GROUP BY ROLLUP(Q.���ɴ�);
--==>>
/*
10	    2
20	    11
40	    1
50	    2
��ü	    16
*/


--�������� Ǫ�� ���
--���1
SELECT CASE GROUPING(Q.���ɴ�) WHEN 0 THEN TO_CHAR(Q.���ɴ�)
            ELSE '��ü'
        END "���ɴ�"
      , COUNT(Q.���ɴ�) "�ο���"
FROM
(
    SELECT CASE WHEN T.���糪�� >=10 AND T.���糪��<=19 THEN '10'
            WHEN T.���糪�� >=20 AND T.���糪��<=29 THEN '20'
            WHEN T.���糪�� >=30 AND T.���糪��<=39 THEN '30'
            WHEN T.���糪�� >=40 AND T.���糪��<=49 THEN '40'
            WHEN T.���糪�� >=50 AND T.���糪��<=59 THEN '50'
            ELSE '�˼�����'
        END "���ɴ�"
  FROM
  (
    --����
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE 0
            END "���糪��"
    FROM TBL_SAWON
  )T
)Q
GROUP BY ROLLUP(Q.���ɴ�);
--==>>
/*
10	    2
20	    11
40	    1
50	    2
��ü	    16
*/

--���2 (TRUNC ����)
SELECT NVL(TO_CHAR(T.���ɴ�), '��ü') "���ɴ�"
     , COUNT(*) "�ο���"
FROM
(
    SELECT TRUNC(CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                      WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                      ELSE 0
                 END, -1) "���ɴ�"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.���ɴ�);
--==>>
/*
10	    2
20	    11
40	    1
50	    2
��ü	    16
*/

SELECT TRUNC(28, -1) "Ȯ��"
FROM DUAL;


--�� ROLLUP Ȱ�� �� CUBE
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1, 2;
--==>>
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	    5600
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750    -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	    6000
20  	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875   -- 20�� �μ� ��� ������ �޿���
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	    5600
30	    (null)	    9400    -- 30�� �μ� ��� ������ �޿���
(null) 	(null)	    29025   -- ��� �μ� ��� ������ �޿���
*/

--�� CUBE() �� ROLLUP() ���� �� �ڼ��� ����� ��ȯ���� �� �ִ�.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750     -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875    -- 20�� �μ� ��� ������ �޿���
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN    	5600
30	    (null)	    9400     -- 30�� �μ� ��� ������ �޿���
(null)	ANALYST	    6000     -- ��� �μ� ANALYST ������ �޿���
(null)	CLERK	    4150     -- ��� �μ� CLERK ������ �޿���
(null)	MANAGER	    8275     -- ��� �μ� MANAGER ������ �޿���
(null)	PRESIDENT	5000     -- ��� �μ� PRESIDENT ������ �޿���
(null)	SALESMAN    	5600     -- ��� �μ� SALESMAN ������ �޿���
(null)	(null)      	29025    -- ��� �μ� ��� ������ �޿���
*/


--�� ROLLUP() �� CUBE() ��
--   �׷��� �����ִ� ����� �ٸ���. (����)

-- ROLLUP(A, B, C)
-- �� (A, B, C) / (A, B) / (A) / ()

-- CUBE(A, B, C)
-- �� (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()

--==>> ���� ó�� ������ ���ϴ� ����� ���� ���ϰų� �ʹ� ���� ������� ��µǱ� ������
--     ������ ���� ���¸� �� ���� ����Ѵ�.
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS����
--     �̿��Ͽ� �����ִ� ����̴�.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
       END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����    	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	    10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	    5600
30	        ��ü����	    9400
����	    CLERK	    2500
����	    SALESMAN	    5500
����	    ��ü����	    8000
��ü�μ�	    ��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
       END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	            CLERK	    1300
10	            MANAGER	    2450
10	            PRESIDENT	5000
10	            ��ü����	    8750
20	            ANALYST	    6000
20	            CLERK	    1900
20	            MANAGER	    2975
20	            ��ü����	    10875
30	            CLERK	    950
30	            MANAGER	    2850
30	            SALESMAN    	5600
30	            ��ü����	    9400
����	        CLERK	    2500
����	        SALESMAN	    5500
����	        ��ü����	    8000
��ü�μ�        	ANALYST	    6000
��ü�μ�        	CLERK	    6650
��ü�μ�	        MANAGER	    8275
��ü�μ�        	PRESIDENT	5000
��ü�μ�        	SALESMAN    	11100
��ü�μ�	        ��ü����    	37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
       END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())
ORDER BY 1,2;
--==>>
/* ROLLUP�� ����
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	    8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	    10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	    5600
30	        ��ü����	    9400
����	    CLERK	    2500
����  	    SALESMAN	    5500
����	    ��ü����	    8000
��ü�μ�    	��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
       END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())
ORDER BY 1,2;
--==>>
/*  CUBE�� ���� ��
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����    	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	    10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	    5600
30	        ��ü����	    9400
����	    CLERK	    2500
����	    SALESMAN	    5500
����	    ��ü����    	8000
��ü�μ�	    ANALYST	    6000
��ü�μ�    	CLERK	    6650
��ü�μ�    	MANAGER	    8275
��ü�μ�    	PRESIDENT	5000
��ü�μ�    	SALESMAN    	11100
��ü�μ�	    ��ü����	    37025
*/

--�� TBL_EMP ���̺��� �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

/*
--------------------------
    �Ի�⵵    �ο���
--------------------------
      1980        1
      1981       10
      1982        1
      1987        2
      2021        5
      ��ü       19
*/

--���� Ǯ���� ���
SELECT NVL(T.�Ի�⵵, '��ü') "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM
(
    SELECT TO_CHAR((HIREDATE), 'YYYY') "�Ի�⵵"
    FROM TBL_EMP
)T
GROUP BY ROLLUP(T.�Ի�⵵);
--==>>
/*
1980	1
1981	10
1982    	1
1987	2
2021    	5
��ü	19
*/


--�������� Ǯ���� ���
SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2021	5
	19
*/


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS(EXTRACT(YEAR FROM HIREDATE), ())
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2021	5
	19
*/


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> ���� �߻�
-- GROUP BY���� TO_CHAR�� �������� �������� ������� 
-- �׸��� SELECT���� EXTRACT ������ GROUP BY ������ EXTRACT ����� 
-- EXTACT�� �������̶�

SELECT TO_CHAR(HIREDATE, 'YYYY') "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2021	5
	19
*/


--------------------------------------------------------------------------------

--���� HAVING ����--

--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� �������
--   �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.
--���� Ǯ���� ���
SELECT DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30);

--�������� Ǫ�� ���
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
    AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> ���� �߻�
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
581��, 9������ ���� �߻�
*/


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400


SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO IN (20, 30)
    AND SUM(SAL) < 10000;
--==>> 30	9400
--�ٶ������� �ʴ�~!


-----------------------------------------------------------------------------

--���� ��ø �׷��Լ� / �м��Լ� ����--

-- �׷� �Լ� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- �̸����� MS-SQL �� �Ұ����ϴ�.
SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

-- RANK()
-- DENSE_RANK()
--> ORACLE 9i���� ���� MSSQL 2005���� ����

--�� ���� ���������� RANK()�� DENSE_RANK()�� ����� �� ���� ������
--   �̸� ��ü�Ͽ� ������ ������ �� �ִ� ����� �����ؾ� �Ѵ�.

-- ���� ���, �޿��� ������ ���ϰ��� �Ѵٸ�
-- �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
-- �� Ȯ���� ���ڿ� +1�� �߰� �������ָ� �װ��� �� ����� �ȴ�.

SELECT ENAME, SAL, 1
FROM EMP;

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;    -- SMITH�� �޿�
--==>> 14
--SMITH�� �޿� ���


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;   -- ALLEN�� �޿�
--==>> 7
--ALLEN�� �޿� ���

SELECT ENAME, SAL, 1
FROM EMP;

--�� ���� ��� ���� (��� ���� ����)
--   ���� ������ �ִ� ���̺��� �÷���
--   ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ���� ��� �θ���.

SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", (1) "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > 800) "�޿����"
FROM EMP;
--==>>
/*
SMITH	800	    14
ALLEN	1600	14
WARD    	1250	    14
JONES	2975    	14
MARTIN	1250	    14
BLAKE	2850	    14
CLARK	2450	    14
SCOTT	3000	14
KING    	5000    	14
TURNER	1500    	14
ADAMS	1100	14
JAMES	950	    14
FORD	    3000	14
MILLER	1300	14
*/

SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE SAL > 800) "�޿����"
FROM EMP E1;

SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "�޿����"
FROM EMP E1;
--==>>
/*
SMITH	800	    14
ALLEN	1600	7
WARD    	1250	    10
JONES	2975	    4
MARTIN	1250    	10
BLAKE	2850    	5
CLARK	2450    	6
SCOTT	3000	2
KING    	5000	    1
TURNER	1500    	8
ADAMS	1100	12
JAMES	950	    13
FORD    	3000	2
MILLER	1300	9
*/

SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "�޿����"
FROM EMP E1
ORDER BY 3;
--==>>
/*
KING    	5000    	1
FORD    	3000	2
SCOTT	3000	2
JONES	2975	    4
BLAKE	2850    	5
CLARK	2450	    6
ALLEN	1600	7
TURNER	1500    	8
MILLER	1300	9
WARD	    1250	    10
MARTIN	1250	    10
ADAMS	1100	12
JAMES	950	    13
SMITH	800	    14
*/


--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK() �Լ��� ������� �ʰ�, ���� ��� ������ Ȱ���� �� �ֵ��� �Ѵ�.
SELECT *
FROM EMP
ORDER BY DEPTNO;
        
SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.SAL > E1.SAL) "�μ����޿����"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "��ü�޿����"
FROM EMP E1
ORDER BY 3;
--==>>
/*
CLARK	2450	    10	2	6
KING	    5000	    10	1	1
MILLER	1300    	10	3	9
JONES	2975    	20	3	4
FORD    	3000    	20	1	2
ADAMS	1100	    20	4	12
SMITH	800	    20	5	14
SCOTT	3000    	20	1	2
WARD	    1250	    30	4	10
TURNER	1500	    30	3	8
ALLEN	1600    	30	2	7
JAMES	950	    30	6	13
BLAKE	2850	    30	1	5
MARTIN	1250	    30	4	10
*/


SELECT ENAME "�����"
     , SAL "�޿�"
     , DEPTNO "�μ���ȣ"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.SAL > E1.SAL) "�μ����޿����"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "��ü�޿����"
FROM EMP E1
ORDER BY 2 DESC;
--==>>
/*
KING	5000	10	1	1
FORD	3000	20	1	2
SCOTT	3000	20	1	2
JONES	2975	20	3	4
BLAKE	2850	30	1	5
CLARK	2450	10	2	6
ALLEN	1600	30	2	7
TURNER	1500	30	3	8
MILLER	1300	10	3	9
WARD	1250	30	4	10
MARTIN	1250	30	4	10
ADAMS	1100	20	4	12
JAMES	950	30	6	13
SMITH	800	20	5	14
*/

SELECT *
FROM EMP;

--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
------------------------------------------------------------------------
    �����     �μ���ȣ    �Ի���     �޿�     �μ����Ի纰�޿�����
------------------------------------------------------------------------
    CLERK         10    1981-06-09    2450            2450
    KING          10    1981-11-17    5000            7450
    MILLER        10    1982-01-23    1300            8750
    SMITH         20    1980-12-17     800             800
    JONES         20    1981-04-02    2975            3775
                            :
                            :
------------------------------------------------------------------------
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���"
     , SAL "�޿�"
     , (SELECT SUM(SAL)
        FROM EMP E2
        WHERE E2.DEPTNO=E1.DEPTNO AND E2.HIREDATE <= E1.HIREDATE) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2;
--==>>
/*
CLARK	10	81/06/09    	2450	    2450
KING    	10	81/11/17	5000	    7450
MILLER	10	82/01/23    	1300	    8750
JONES	20	81/04/02    	2975	    3775
FORD    	20	81/12/03	    3000	    6775
ADAMS	20	87/07/13	    1100	    10875
SMITH	20	80/12/17	    800	    800
SCOTT	20	87/07/13    	3000	    10875
WARD	    30	81/02/22    	1250	    2850
TURNER	30	81/09/08	    1500	    7200
ALLEN	30	81/02/20	    1600	    1600
JAMES	30	81/12/03    	950	    9400
BLAKE	30	81/05/01	    2850	    5700
MARTIN	30	81/09/28	    1250	    8450
*/

--�������� Ǯ���� ���
SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , 1 "�μ����Ի纰�޿�����"
FROM EMP
ORDER BY 2,3;


SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , (1) "�μ����Ի纰�޿�����"
FROM EMP
ORDER BY 2,3;


SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2,3;

SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.HIREDATE <= E1.HIREDATE) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2,3;
--==>>
/*
CLARK	10	1981-06-09	2450    	2450
KING    	10	1981-11-17	5000    	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800	     800
JONES	20	1981-04-02	2975	    3775
FORD    	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	    30	1981-02-22	1250	    2850
BLAKE	30	1981-05-01	2850	    5700
TURNER	30	1981-09-08	1500	    7200
MARTIN	30	1981-09-28	1250	    8450
JAMES	30	1981-12-03	950	    9400
*/


--�� TBL_EMP ���̺��� �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ִ� �������� �����Ѵ�.
/*
----------------------
  �Ի���   �ο���
----------------------
   XXXX-XX    XX
----------------------
*/

SELECT *
FROM TBL_EMP;

SELECT ENAME, HIREDATE
FROM TBL_EMP
ORDER BY 2;

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');



SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 5;
--==>> 2021-03	5

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM TBL_EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>>
/*
2021-03	5
*/

SELECT COUNT(*)
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');

SELECT MAX(COUNT(*))
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 5


-------------------------------------------------------------------------------

--���� ROW_NUMBER() ����--

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "����"
      , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
FROM EMP;
--==>>
/*
1	KING	    5000	    81/11/17
2	FORD    	3000	    81/12/03
3	SCOTT	3000	    87/07/13
4	JONES	2975	    81/04/02
5	BLAKE	2850	    81/05/01
6	CLARK	2450	    81/06/09
7	ALLEN	1600	    81/02/20
8	TURNER	1500	    81/09/08
9	MILLER	1300	    82/01/23
10	WARD	    1250	    81/02/22
11	MARTIN	1250	    81/09/28
12	ADAMS	1100	    87/07/13
13	JAMES	950	    81/12/03
14	SMITH	800	    80/12/17
*/

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "����"
      , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
FROM EMP
ORDER BY ENAME;
--==>>
/*
12	ADAMS	1100    	87/07/13
7	ALLEN	1600	    81/02/20
5	BLAKE	2850	    81/05/01
6	CLARK	2450	    81/06/09
2	FORD	    3000	    81/12/03
13	JAMES	950	    81/12/03
4	JONES	2975	    81/04/02
1	KING	    5000	    81/11/17
11	MARTIN	1250	    81/09/28
9	MILLER	1300	    82/01/23
3	SCOTT	3000	    87/07/13
14	SMITH	800	    80/12/17
8	TURNER	1500	    81/09/08
10	WARD	    1250	    81/02/22
*/

--�� �Խ����� �Խù� ��ȣ��
--   SQUENCE �� IDENTITY �� ����ϰ� �Ǹ�
--   �Խù��� �������� ���, ������ �Խù��� �ڸ���
--   ���� ��ȣ�� ���� �Խù��� ��ϵǴ� ��Ȳ�� �߻��ϰ� �ȴ�.
--   �̴�, ���� ���鿡���� �̰��� �ٶ������� ���� ��Ȳ�� �� �ֱ� ������
--   ROW_NUMBER() �� ����� ����� �� �� �ִ�.
--   ������ �������� ����� ������ SEQUENCE �� IDENTITY �� ���������
--   �ܼ��� �Խù��� ���ȭ�Ͽ� ����ڿ��� ����Ʈ �������� ������ ������
--   ������� �ʴ� ���� ����.

CREATE TABLE TBL_AAA
( NO    NUMBER
, NAME  VARCHAR2(40)
, GRADE CHAR
);
--==>> Table TBL_AAA��(��) �����Ǿ����ϴ�.

INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(1, '������', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(2, '�̻�ȭ', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(3, '������', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(4, '�ڹ���', 'C');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(5, '�̻�ȭ', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(6, '������', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(7, '������', 'B');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

COMMIT;
--==>> Ŀ�Կ�.

SELECT *
FROM TBL_AAA;
--==>> 
/*
1	������	A
2	�̻�ȭ	B
3	������	A
4	�ڹ���	C
5	�̻�ȭ	A
6	������	B
7	������	B
*/

--�� SEQUENCE ���� (������, �ֹ���ȣ)
--   �� �������� �ǹ� : 1.(�Ϸ���) �������� ��ǵ� 2.(���, �ൿ ����) ����

CREATE SEQUENCE SEQ_BOARD   --������ �⺻ ���� ����(MSSQL �� IDENTITY�� ������ ����)
START WITH 1                --���۰� 1�� ����
INCREMENT BY 1              --������ 1�� ����
NOMAXVALUE                  --�ִ밪 ���� ���� �ʰڴ�.
NOCACHE;                    --ĳ�� ��� ����(����)
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.
-- ������ ù��° ������ �ᵵ ������
-- �ι�°�� ���ʹ� �ɼ���

--�� ���̺� ����(TBL_BOARD)
CREATE TABLE TBL_BOARD              -- TBL_BOARD �̸��� ���̺� ���� �� �Խ���
( NO        NUMBER                  -- �Խù� ��ȣ       X
, TITLE     VARCHAR2(50)            -- �Խù� ����       ��
, CONTENTS  VARCHAR2(2000)          -- �Խù� ����       ��
, NAME      VARCHAR2(20)            -- �Խù� �ۼ���     ��
, PW        VARCHAR2(20)            -- �Խù� �н�����   �� 
, CREATED   DATE DEFAULT SYSDATE    -- �Խù� �ۼ���      X
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� ������ �Է� �� �Խ��ǿ� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ƽ�~1��', '���� 1��������~', '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ǰ�����', '�ٵ� �ǰ� ì��ô�', '�̻�ȭ', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���� �� ����...', '�ڹ���', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�̼����� ����?', '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ϰ������', '���̳ʹ��־��', '��ƺ�', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ֽ��ϴ�', '������ �ϸ� �ȵǳ���', '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ֽ��ϴ�', '�������� �ٽ� �����ҰԿ�', '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ƽ�~1��	        ���� 1��������~	            ������	JAVA006$	2021-03-31
2	�ǰ�����	        �ٵ� �ǰ� ì��ô�	        �̻�ȭ	JAVA006$	2021-03-31
3	������	        ���� �� ����...	            �ڹ���	JAVA006$	2021-03-31
4	������	        �̼����� ����?	            ������	JAVA006$	2021-03-31
5	�����ϰ������	���̳ʹ��־��	            ��ƺ�	JAVA006$	2021-03-31
6	�����ֽ��ϴ�	    ������ �ϸ� �ȵǳ���	        ������	JAVA006$	2021-03-31
7	�����ֽ��ϴ�  	�������� �ٽ� �����ҰԿ�	    ������	JAVA006$	2021-03-31
*/


--Ŀ��
COMMIT;
--==>> Ŀ�Կ�.

DELETE
FROM TBL_BOARD
WHERE NO=4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�� �׳� �߷���', '�̻���', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���¿�', '�������� �ֽ��ϴ�.', '�弭��', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ƽ�~1��       	���� 1��������~	            ������	JAVA006$	2021-03-31
3	������	        ���� �� ����...	            �ڹ���	JAVA006$	2021-03-31
5	�����ϰ������	���̳ʹ��־��	            ��ƺ�	JAVA006$	2021-03-31
6	�����ֽ��ϴ�	    ������ �ϸ� �ȵǳ��� 	    ������	JAVA006$	2021-03-31
7	�����ֽ��ϴ�	    �������� �ٽ� �����ҰԿ�	    ������	JAVA006$	2021-03-31
9	���¿�	        �������� �ֽ��ϴ�.	        �弭��	JAVA006$	2021-03-31
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
6	���¿�	        �弭��	2021-03-31
5	�����ֽ��ϴ�	    ������	2021-03-31
4	�����ֽ��ϴ�	    ������	2021-03-31
3	�����ϰ������	��ƺ�	2021-03-31
2	������	        �ڹ���	2021-03-31
1	�ƽ�~1��	    ������	2021-03-31
*/


--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ܷο���', '���۵� ���� �ȿ��', '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=7;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--��Ŀ��
COMMIT;
--==>> Ŀ�Կ�

?�� Ȯ��
SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
6	�ܷο���	        ������	2021-03-31
5	���¿�	        �弭��	2021-03-31
4	�����ֽ��ϴ�	    ������	2021-03-31
3	�����ϰ������	��ƺ�	2021-03-31
2	������	        �ڹ���	2021-03-31
1	�ƽ�~1��	    ������	2021-03-31
*/

------------------------------------------------------------------------------

--���� JOIN(����) ����--














