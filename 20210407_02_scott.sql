SELECT USER
FROM DUAL;
--==>> SCOTT


--���� UPDATE ����--

-- 1. ���̺��� ���� �����͸� �����ϴ� ����

-- 2. ���� �� ����
-- UPDATE ���̺��
-- SET �÷���=������ ��[, �÷���=������ ��, ...]
-- [WHERE ������] �������� ��� UPDATE�� �����ϴµ� �̻� X

SELECT *
FROM TBL_SAWON;

-- ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� TBL_SAWON ���̺��� �����ȣ 1003�� ����� �ֹι�ȣ�� 
--   ��8303082234567���� �����Ѵ�.
UPDATE TBL_SAWON
SET JUBUN = '8303082234567'
WHERE SANO = 1003;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;
--==>> 1003	��ƺ�	8303082234567	1999-08-16	5000

-- ���� �� COMMIT �Ǵ� ROLLBACK �� �ݵ�� ���������� ����
COMMIT;
--==>> Ŀ�Կ�

--�� TBL_SAWON ���̺��� 1005�� ����� �Ի��ϰ� �޿���
--   ���� 2018-02-22, 2200 ���� �����Ѵ�.
UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2018-02-22', 'YYYY-MM-DD'), SAL = 2200
WHERE SANO = 1005;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;


-- ���� �� COMMIT �Ǵ� ROLLBACK �� �ݵ�� ���������� ����
COMMIT;
--==>> Ŀ�Կ�

--�� TBL_INSA ���̺� ����(�����͸�)
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP��(��) �����Ǿ����ϴ�.

--�� TBL_INSABACKUP ���̺���
--   ������ ����� ���常 ���� 10% �λ�

-- ���� Ǯ���� ���
SELECT *
FROM TBL_INSABACKUP;

UPDATE TBL_INSABACKUP
SET SUDANG=SUDANG*1.1
WHERE JIKWI IN ('����', '����');

DROP TABLE TBL_INSABACKUP;

SELECT *
FROM TBL_INSABACKUP;


--�������� Ǯ���� ���
SELECT NAME "�����", JIKWI "����", SUDANG "����", SUDANG*1.1 "10%�λ�ȼ���"
FROM TBL_INSABACKUP
WHERE JIKWI IN ('����', '����');


UPDATE TBL_INSABACKUP
SET SUDANG=SUDANG*1.1
WHERE JIKWI IN ('����', '����');


--�� TBL_INSABACKUP ���̺��� ��ȭ��ȣ�� 016, 017, 018, 019�� �����ϴ�
--   ��ȭ��ȣ�� ��� �̸� ��� 010���� �����Ѵ�.

UPDATE TBL_INSABACKUP
SET SUBSTR(TEL, 1, 3) = '010'
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');

SELECT *
FROM TBL_INSABACKUP;

UPDATE TBL_INSABACKUP
SET TEL = 010
WHERE TEL='016' OR TEL='017' OR TEL='018' OR TEL='019';

--�������� Ǫ�� ���
SELECT TEL "������ȭ��ȣ", '010' || SUBSTR(TEL, 4) "�������ȭ��ȣ"
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');
--==>>
/*
019-5236-4221	010-5236-4221
018-5211-3542	010-5211-3542
016-2222-4444	010-2222-4444
019-1111-2222	010-1111-2222
018-2222-4242	010-2222-4242
019-6666-4444	010-6666-4444
016-2548-3365	010-2548-3365
018-1333-3333	010-1333-3333
017-4747-4848	010-4747-4848
017-5214-5282	010-5214-5282
019-8523-1478	010-8523-1478
016-1818-4848	010-1818-4848
016-3535-3636	010-3535-3636
019-6564-6752	010-6564-6752
019-5552-7511	010-5552-7511
016-8888-7474	010-8888-7474
016-4444-7777	010-4444-7777
016-4444-5555	010-4444-5555
016-8548-6547	010-8548-6547
017-3333-3333	010-3333-3333
018-0505-0505	010-0505-0505
016-1919-4242	010-1919-4242
016-2424-4242	010-2424-4242
016-6542-7546	010-6542-7546
*/


UPDATE TBL_INSABACKUP
SET TEL = '010' || SUBSTR(TEL, 4)
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');
--==>> 24�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_INSABACKUP;

--�� TBL_SAWON ���̺� ���
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.
--> TBL_SAWON ���̺��� �����͵鸸 ����� ����
--  ��, �ٸ� �̸��� ���̺� ���·� ������ �� ��Ȳ

-- �� Ȯ��
SELECT *
FROM TBL_SAWONBACKUP;
SELECT *
FROM TBL_SAWON;



-- �������� TBL_SAWON ���̺� �ִ� SANAME ��� �̸� '�̹���'���� �����ϴ�
-- ���� ������
UPDATE TBL_SAWON
SET SANAME = '�̹���';  

-- UPDATE ó�� ���Ŀ� COMMIT �� �����Ͽ��� ������
-- ROLLBACK �� �Ұ����� ��Ȳ�̴�.
-- ������, TBL_SAWONBACKUP ���̺� �����͸� ����� �ξ���.
-- SANAME �÷��� ���븸 �����Ͽ� '�̹���'��� �־��� �� �ִٴ� ���̴�.

--�̷��� �����������
UPDATE TBL_SAWON
SET SANAME='�輭��'
WHERE SANO=1002;


UPDATE TBL_SAWON
SET SANAME=TBL_SAWONBACKUP ���̺��� 1004�� ����� �����;

UPDATE TBL_SAWON
SET SANAME=( SELECT SANAME
             FROM TBL_SAWONBACKUP
             WHERE SANO = TBL_SAWON.SANO);

SELECT SANAME
FROM TBL_SAWONBACKUP
WHERE SANO=1002;
-- SAWON�� �ִ� �� �����ͼ� SAWONBACKUP ���̺� �ִ� ����� ������Ʈ

SELECT *
FROM TBL_SAWON;
--==>> ������.















