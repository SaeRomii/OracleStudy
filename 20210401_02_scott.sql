SELECT USER
FROM DUAL;
--==>> SCOTT


--���� UNION / UNION ALL ����--

--�� �ǽ� ���̺� ����(TBL_JUMUN)
CREATE TABLE TBL_JUMUN              --�ֹ� ���̺� ����
( JUNO      NUMBER                  --�ֹ� ��ȣ
, JECODE    VARCHAR2(30)            --�ֹ��� ��ǰ �ڵ�
, JUSU      NUMBER                  --�ֹ� ����
, JUDAY     DATE DEFAULT SYSDATE    --�ֹ� ����
);
--==>> Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
--> ���� �ֹ��� �߻����� ��� �ֹ� ���뿡 ���� �����Ͱ� �Էµ� �� �ִ� ���̺�


--�� ������ �Է� �� ���� �ֹ� �߻� / ����
INSERT INTO TBL_JUMUN VALUES
(1, '�˵�����Ĩ', 20, TO_DATE('2001-11-01 09:05:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '��Ŭ', 10, TO_DATE('2001-11-01 09:23:37', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '����Ĩ', 30, TO_DATE('2001-11-01 11:41:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, 'Ģ��', 12, TO_DATE('2001-11-02 10:22:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, 'Ȩ����', 50, TO_DATE('2001-11-03 15:50:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, '�ٳ���ű', 40, TO_DATE('2001-11-04 11:10:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, '��������', 10, TO_DATE('2001-11-10 10:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '��īĨ', 40, TO_DATE('2001-11-13 09:41:14', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, '����Ĩ', 20, TO_DATE('2001-11-14 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, 'ĭ��', 20, TO_DATE('2001-11-20 14:17:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 10


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	�˵�����Ĩ	20	2001-11-01 09:05:12
2	��Ŭ	    10	2001-11-01 09:23:37
3	����Ĩ	    30	2001-11-01 11:41:00
4	Ģ��	    12	2001-11-02 10:22:00
5	Ȩ����	    50	2001-11-03 15:50:00
6	�ٳ���ű	40	2001-11-04 11:10:00
7	��������	10	2001-11-10 10:10:10
8	��īĨ	    40	2001-11-13 09:41:14
9	����Ĩ	    20	2001-11-14 14:20:00
10	ĭ��	    20	2001-11-20 14:17:00
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�.

--�� ������ �߰� �Է� �� 2001�� ���� ���۵� �ֹ��� ����(2021��)���� ��� �߻�
INSERT INTO TBL_JUMUN VALUES(938765, 'Ȩ����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938766, '����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938767, '��Ŭ', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938768, 'Ȩ����', 50, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938769, '����Ĩ', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938770, '����Ĩ', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938771, '����Ĩ', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938772, '��īĨ', 40, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938773, '��īĨ', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938774, 'ĭ��', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938775, 'ĭ��', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(938776, '�ٳ���ű', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	    �˵�����Ĩ	20	2001-11-01 09:05:12
2	    ��Ŭ	    10	2001-11-01 09:23:37
3	    ����Ĩ	    30	2001-11-01 11:41:00
4	    Ģ��	    12	2001-11-02 10:22:00
5	    Ȩ����	    50	2001-11-03 15:50:00
6	    �ٳ���ű	40	2001-11-04 11:10:00
7	    ��������	10	2001-11-10 10:10:10
8	    ��īĨ	    40	2001-11-13 09:41:14
9	    ����Ĩ	    20	2001-11-14 14:20:00
10	    ĭ��	    20	2001-11-20 14:17:00
938765	Ȩ����	    10	2021-04-01 14:23:28
938766	����	    10	2021-04-01 14:24:21
938767	��Ŭ	    10	2021-04-01 14:25:05
938768	Ȩ����	    50	2021-04-01 14:25:34
938769	����Ĩ	    30	2021-04-01 14:26:38
938770	����Ĩ	    20	2021-04-01 14:27:01
938771	����Ĩ	    10	2021-04-01 14:27:21
938772	��īĨ	    40	2021-04-01 14:27:43
938773	��īĨ	    20	2021-04-01 14:28:07
938774	ĭ��	    20	2021-04-01 14:28:33
938775	ĭ��	    10	2021-04-01 14:28:55
938776	�ٳ���ű	10	2021-04-01 14:29:21
*/


--�� �����̰� 2001�⵵���� ���� ���θ� ���
--   TBL_JUMUN ���̺��� �ʹ� ���ſ��� ��Ȳ
--   ���ø����̼ǰ��� �������� ���� �ֹ� ������ �ٸ� ���̺� ������ �� �ֵ���
--   ����� ���� ���� ��Ȳ
--   ������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ
--   �� ��������� ������� ������ �ֹ� ������ ��
--      ���� �߻��� �ֹ� ������ �����ϰ�
--      �������� �ٸ� ���̺�(TBL_JUMUNBACKUP)��
--      ������ �̰��� ������ ��ȹ

CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	�˵�����Ĩ	20	2001-11-01 09:05:12
2	��Ŭ	    10	2001-11-01 09:23:37
3	����Ĩ	    30	2001-11-01 11:41:00
4	Ģ��	    12	2001-11-02 10:22:00
5	Ȩ����	    50	2001-11-03 15:50:00
6	�ٳ���ű	40	2001-11-04 11:10:00
7	��������	10	2001-11-10 10:10:10
8	��īĨ	    40	2001-11-13 09:41:14
9	����Ĩ	    20	2001-11-14 14:20:00
10	ĭ��	    20	2001-11-20 14:17:00
*/
--> TBL_JUMUN ���̺��� �����͵� ��
--  ���� �ֹ����� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP ���̺� ����� ��ģ ����

--�� TBL_JUMUN ���̺��� �����͵� ��
-- ���� �ֹ����� �̿��� �����ʹ� ��� ����
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> 10�� �� ��(��) �����Ǿ����ϴ�.


-- ���� ��ǰ �߼��� �Ϸ���� ���� ���� �ֹ� �����͸� �����ϰ�
-- ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
-- ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ


--��Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
938765	Ȩ����	    10	2021-04-01 14:23:28
938766	����	    10	2021-04-01 14:24:21
938767	��Ŭ	    10	2021-04-01 14:25:05
938768	Ȩ����	    50	2021-04-01 14:25:34
938769	����Ĩ	    30	2021-04-01 14:26:38
938770	����Ĩ	    20	2021-04-01 14:27:01
938771	����Ĩ	    10	2021-04-01 14:27:21
938772	��īĨ	    40	2021-04-01 14:27:43
938773	��īĨ	    20	2021-04-01 14:28:07
938774	ĭ��	    20	2021-04-01 14:28:33
938775	ĭ��	    10	2021-04-01 14:28:55
938776	�ٳ���ű    10	2021-04-01 14:29:21
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�.

-- �׷���, ���ݱ��� �ֹ����� ������ ���� ������
-- ��ǰ�� �� �ֹ������� ��Ÿ���� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
-- �׷��ٸ� TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)�� 
-- TBL_JUMUN ���̺��� ���ڵ�(��)�� ���ļ�
-- �ϳ��� ���̺��� ��ȸ�ϴ� �Ͱ� ����
-- ����� Ȯ���� �� �ֵ��� ��ȸ�ؾ� �Ѵ�.

-- �÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ��� JOIN�� ���������
-- ���ڵ�(��)�� ���ڵ�(��)�� �����ϰ��� �ϴ� ��� UNION / UNION ALL �� ����� �� �ִ�.
SELECT *
FROM TBL_JUMUNBACKUP;
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;
-- �ֹ���ȣ ���� ����
-- ���ڵ��� �ߺ��� �� ������ �ϳ��� ����
-- ����� UNION�� �� �پ

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;
--������ UNION ALL�� �� ����(����� UNION���� ����)

--�� UNION�� �׻� ������� ù ��° �÷��� ��������
--   �������� ������ �����Ѵ�.
--   UNION ALL�� ���յ� ������� ��ȸ�� ����� ��ȯ�Ѵ�. (���� ����)
--   �̷� ���� UNION�� ���ϰ� �� ũ��.
--   ����, UNION �� ��������� �ߺ��� ���� ������ ���
--   �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�ϰ� �ȴ�.

--�� ���ݱ��� �ֹ����� ��� �����͸� ����
--   ��ǰ�� �� �ֹ����� ��ȸ�ϴ� �������� �����Ѵ�.
/*
-----------------------------------
    ��ǰ�ڵ�        �� �ֹ���
-----------------------------------
      ..                XX
    ....               XXX
*/

--���� Ǯ���� ���
SELECT T.JECODE "��ǰ�ڵ�"
    , SUM(T.JUSU) "�� �ֹ���"
FROM
(
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
)T
GROUP BY (T.JECODE);


--�������� Ǯ���� ���
SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T
GROUP BY T.JECODE;
--==>>
/*
�˵�����Ĩ	20
����Ĩ	    90
��Ŭ	    20
Ģ��	    12
��īĨ	    100
�ٳ���ű	50
��������	10
Ȩ����	    110
����Ĩ	    20
����	    10
ĭ��	    50
*/


SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T
GROUP BY T.JECODE;
--==>>
/*
����Ĩ	    60
�˵�����Ĩ	20
��Ŭ	    10
Ģ��	    12
��īĨ	    60
��������	10
�ٳ���ű	50
����Ĩ	    20
����	    10
Ȩ����	    60
ĭ��	    30
*/
-- UNION ���� �ߺ� ���ŵ�
--> �� ������ �ذ��ϴ� ���������� UNION�� ����ؼ��� �ȵȴ�.
--  �� JECODE �� JUSU �� ��ȸ�ϴ� �������� �ߺ��� ���� �����ϴ� ��Ȳ�� �߻�


--�� INTERSECT / MINUS (�� ������ / ������)

-- TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
-- ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
����Ĩ	30
��Ŭ	10
ĭ��	20
��īĨ	40
Ȩ����	50
*/
-- ������ ã����~! ���� ���̺� �� �ִ� ��

--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP;

SELECT ��ǰ�ڵ尡 ����Ĩ�̰� �ֹ������� 30�̸� �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       ��ǰ�ڵ尡 ��Ŭ�̰� �ֹ������� 10�̸� �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       ��ǰ�ڵ尡 ĭ���̰� �ֹ������� 20�̸� �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       ��ǰ�ڵ尡 ��īĨ�̰� �ֹ������� 40�̸� �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       ��ǰ�ڵ尡 Ȩ�����̰� �ֹ������� 50�̸� �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T;


SELECT T.JECODE = '����Ĩ' AND T.JUSU = 30 �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       T.JECODE = '��Ŭ' AND T.JUSU = 10 �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       T.JECODE = 'ĭ��' AND T.JUSU = 20 �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       T.JECODE = '��īĨ' AND T.JUSU = 40 �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
       T.JECODE = 'Ȩ����' AND T.JUSU = 50 �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T;

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


�ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ

SELECT T1.JUNO, T1.JECODE, T1.JUSU, T1.JUDAY
FROM
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
)T1,
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T2
WHERE T1.JECODE = T2.JECODE
  AND T1.JUSU = T2.JUSU;
  
--�������� �ϴ°͵� �غ���~!


JOIN
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
ON 

























