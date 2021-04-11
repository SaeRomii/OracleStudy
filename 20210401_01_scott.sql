SELECT USER
FROM DUAL;
--==>> SCOTT

--���� JOIN(����) ����--

-- 1. SQL 1992 CODE
SELECT *
FROM EMP, DEPT;
--> ���п��� ���ϴ� ��ī��Ʈ ��(Catersian Product)
--  �� ���̺��� ��ģ(������) ��� ����� ��

-- Equi Join : ���� ��Ȯ�� ��ġ�ϴ� �����͵鳢�� �����Ű�� ����
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


-- Non Equi Join : ���� �ȿ� ������ �����͵鳢�� �����Ű�� ����
SELECT *
FROM SALGRADE;

SELECT *
FROM EMP;

SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- Equi Join �� ��+���� Ȱ���� ���� ���
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� 14���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ���ȣ�� ���� ���� �����(5��)�� ��� ����

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> �� 19���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ���ȣ�� ���� ���� �����(5��)�� ��� ��ȸ�� ��Ȳ

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> �� 16���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ��� �Ҽӵ� ����� �ƹ��� ���� �μ��� ��� ��ȸ�� ��Ȳ
--> WHERE���� �ڿ� �ִ� D.DEPTNO �� ���ΰ��� �갡 ���� �ۿ÷���

--�� (+)�� ���� �� ���̺��� �����͸� ��� �޸𸮿� ������ ��
--   (+)�� �ִ� �� ���̺��� �����͸� �ϳ��ϳ� Ȯ���Ͽ� ���ս�Ű�� ���·�
--   JOIN�� �̷������.


SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
--> ���� ���� ������ �̷��� ������ JOIN ������ �������� �ʴ´�.
-- �Ѵ� ���� �ۿø��� ���߿� �����ϰų� �Ѵٴ°Ŷ� 


-- 1. SQL 1999 COD �� ��JOIN�� Ű���� ���� �� JOIN ���� ���
--                     ���� ������ ��WHERE�� ��� ��ON��


-- CROSS JOIN
SELECT *
FROM EMP CROSS JOIN DEPT;

-- INNER JOIN
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--�� INNER JOIN �� INNER �� ���� ����
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- OUTER JOIN
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
-- E�� ���� D�� �߰� (�÷��� ���°� ���� �÷����� �߰�)

SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- ������ �����̶� ��� ����� �� ����

--�� ������ ������ �� ���̺�(�� LEFT)�� �����͸� ��� �޸𸮿� ������ ��
--   ������ �������� ���� �� ���̺���� �����͸� ���� Ȯ���Ͽ� ���ս�Ű�� ���·�
--   JOIN�� �̷������.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- �������� �����̶� ��� �μ� �ٳ���


SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- ���� �� ����
-- �μ���ȣ ���� ����� ��ȸ , ����� �������� �μ��� ��ȸ��


--�� OUTER JOIN ���� OUTER�� ���� ����
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D     -- OUTER JOIN
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D    -- OUTER JOIN
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D     -- OUTER JOIN
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D          -- INNER JOIN
ON E.DEPTNO = D.DEPTNO;

-------------------------------------------------------------------------------

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-- �� ������� ������ CLERK �� ����鸸 ��ȸ


SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
-- �̷��� �������� �����ص� ��ȸ�ϴµ��� ������ ����.
-- ������ �ٶ������� ����
-- ON�� �������� �������� �򰥷��� ���°Ŷ�

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'CLERK';
-- ������, �̿� ���� �����Ͽ� ��ȸ�� �� �ֵ��� �����Ѵ�.

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND JOB = 'CLERK';
-- 92 �ڵ�
  
-----------------------------------------------------------------------------

--�� EMP ���̺�� DEPT ���̺��� �������
--   ������ MANAGER �� CLERK �� ����鸸
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
SELECT *
FROM EMP;

SELECT *
FROM DEPT;
--==>>
/*
DEPTNO	  DNAME	      LOC
10	    ACCOUNTING	NEW YORK
20	    RESEARCH	    DALLAS
30	    SALES	    CHICAGO
40	    OPERATIONS	BOSTON
*/

--���� Ǯ���� ���
-- 99�ڵ�
SELECT D.DEPTNO "�μ���ȣ", D.DNAME "�μ���", E.ENAME "�����", E.JOB "������", E.SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN ('MANAGER', 'CLERK');


-- 92�ڵ�
SELECT D.DEPTNO "�μ���ȣ", D.DNAME "�μ���", E.ENAME "�����", E.JOB "������", E.SAL "�޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND JOB IN ('MANAGER', 'CLERK');
  
  
  
--�������� Ǯ���� ���
SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> ���� �߻�
/*
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
*Cause:    
*Action:
200��, 8������ ���� �߻�
*/
--> �� ���̺� �� �ߵ��Ǵ� �÷��� ���� �Ҽ� ���̺���
--  �������(����� ���) �Ѵ�.


SELECT DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߵ��Ǵ� �÷��� �������� �ʴ� ��ȸ ������
--  ���� �߻����� �ʴ´�.
--==>
/*
ACCOUNTING	CLARK	MANAGER	    2450
ACCOUNTING	KING	    PRESIDENT	5000
ACCOUNTING	MILLER	CLERK	    1300
RESEARCH	    JONES	MANAGER	    2975
RESEARCH	    FORD    	ANALYST	    3000
RESEARCH	    ADAMS	CLERK	    1100
RESEARCH	    SMITH	CLERK	    800
RESEARCH    	SCOTT	ANALYST	    3000
SALES	    WARD    	SALESMAN	    1250
SALES	    TURNER	SALESMAN	    1500
SALES	    ALLEN	SALESMAN	    1600
SALES	    JAMES	CLERK	    950
SALES	    BLAKE	MANAGER	    2850
SALES	    MARTIN	SALESMAN	    1250
*/

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--  �μ�(DEPT), ���(EMP) �� � ���̺��� �����ص�
--  ������ ���࿡ ���� ��� ��ȯ�� ������ ����.

-- �� ������ 
--    �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--    �θ� ���̺��� �÷��� ������ �� �ֵ��� �ؾ� �Ѵ�.

SELECT *
FROM DEPT;      -- �θ� ���̺�

SELECT *
FROM EMP;       -- �ڽ� ���̺�

-- �� �θ� �ڽ� ���̺� ���踦 ��Ȯ�� ������ �� �ֵ��� �Ѵ�.
-- �����Ǿ� �ִ� ������ �̾Ƽ� ���ļ� ���ٴ� ����?
-- �����Ǿ� �ִ� ������ �θ�
-- �̾Ƽ� ���ļ� ��� ���� ������ �ڽ�


SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


--���� ����
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߺ��� �÷��� �ƴϴ���
--  �Ҽ� ���̺��� ����� �� �ֵ��� �����Ѵ�.


--�� SELF JOIN (�ڱ� ����)
--   EMP ���̺��� ������ ������ ���� ��ȸ �� �� �ֵ��� �Ѵ�.
-----------------------------------------------------------------
-- �����ȣ  �����  ������  �����ڹ�ȣ  �����ڸ�  ������������
-----------------------------------------------------------------

SELECT *
FROM EMP;

SELECT EMPNO, ENAME, JOB, MGR, "�����ڸ�", "������������"
FROM EMP;

--���� Ǯ���� ���
SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������", E1.MGR "�����ڹ�ȣ"
     , E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM  EMP E1 LEFT JOIN EMP E2 
ON E1.MGR = E2.EMPNO
ORDER BY 1;
-- ������ ������� null�� ����!!!
--==>>
/*
7369	SMITH	CLERK	    7902	    FORD	ANALYST
7499	ALLEN	SALESMAN	7698	BLAKE	MANAGER
7521	WARD	SALESMAN	7698	BLAKE	MANAGER
7566	JONES	MANAGER	    7839	KING	PRESIDENT
7654	MARTIN	SALESMAN	7698	BLAKE	MANAGER
7698	BLAKE	MANAGER	    7839	KING	PRESIDENT
7782	CLARK	MANAGER	    7839	KING	PRESIDENT
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7839	KING	PRESIDENT			
7844	TURNER	SALESMAN	7698	BLAKE	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7900    	JAMES	CLERK	    7698	BLAKE	MANAGER
7902    	FORD	ANALYST	    7566	JONES	MANAGER
7934	MILLER	CLERK	    7782	CLARK	MANAGER
*/


--�������� Ǯ���� ���
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������" --, E1.MGR "�����ڹ�ȣ"
     , E2.EMPNO "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;


































