SELECT USER
FROM DUAL;
--==>> SCOTT


��
UPDATE ���̺��
SET �������=��������
WHERE ����;

SELECT I.ID, I.PW, S.TEL, S.ADDR
FROM TBL_IDPW I JOIN TBL_STUDENTS S
ON I.ID = S.ID;


UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
         FROM TBL_IDPW I JOIN TBL_STUDENTS S
         ON I.ID = S.ID;) T
SET T.TEL = �Է¹��� ��ȭ��ȣ, T.ADDR=�Է¹����ּ�
WHERE T.ID = �Է¹������̵� AND T.PW = �Է¹����н�����;


--��
--�� ������ ���ν���(PRC_STUDENTS_UPDATE)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��

--�н����� Ʋ����
EXEC PRC_STUDENTS_UPDATE('superman', 'net007$', '010-9999-9999', '��� �ϻ�');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
--> ID�� PW�� ��ȿ���� ���� �����ͷ� �׽�Ʈ �� ��� ~ ������ ���� ����

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-1111-1111	���ֵ� ��������
happyday	�輭��	010-2222-2222	���� ������
*/

SELECT *
FROM TBL_IDPW;
--==>> 
/*
superman	java006$
happyday	java006$
*/

--�н����� �°�
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '��� �ϻ�');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
--> ID�� PW�� ��ȿ�� �����ͷ� �׽�Ʈ �� ��� ������ ���� ����


SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-9999-9999	��� �ϻ�
happyday	�輭��	010-2222-2222	���� ������

����Ȱ� Ȯ���� �� ����
*/

SELECT *
FROM TBL_INSA;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

DESC TBL_INSA;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)   
*/

--�� ������ ���ν���(PRC_INSA_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
EXEC PRC_INSA_INSERT('������', '971006-2234567', SYSDATE, '����', '010-5555-5555', '������', '�븮', 5000000, 500000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--Ȯ��
SELECT *
FROM TBL_INSA;
--==>>
/*
1061	������	971006-2234567	2021-04-09	����	010-5555-5555	������	�븮	5000000	500000
*/

--�� ������ ���ν���(PRC_INSA_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
EXEC PRC_INSA_INSERT('�ڹ���', '960907-2234567', SYSDATE, '����', '010-6666-6666', '��ȹ��', '�븮', 5000000, 500000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--Ȯ��
SELECT *
FROM TBL_INSA;
--==>>
/*
1062	�ڹ���	960907-2234567	2021-04-09	����	010-6666-6666	��ȹ��	�븮	5000000	500000
*/


-----------------------------------------------------------------------------------------------------------------------

--���̺� �̸��̳� �÷� �̸� �ѱ۷� ����� �ȵ����� ���� ���� �Ϸ��� ����� ���ڽ�~

--�� �ǽ� ���̺� ����(TBL_��ǰ)
CREATE TABLE TBL_��ǰ
( ��ǰ�ڵ�      VARCHAR2(20)
, ��ǰ��        VARCHAR2(100)
, �Һ��ڰ���    NUMBER
, ������      NUMBER  DEFAULT 0
, CONSTRAINT ��ǰ_��ǰ�ڵ�_PK PRIMARY KEY(��ǰ�ڵ�)
);
--==>> Table TBL_��ǰ��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(TBL_�԰�)
CREATE TABLE TBL_�԰�
( �԰��ȣ  NUMBER
, ��ǰ�ڵ�  VARCHAR2(20)
, �԰�����  DATE    DEFAULT SYSDATE
, �԰����  NUMBER
, �԰�ܰ�  NUMBER
, CONSTRAINT �԰�_�԰��ȣ_PK PRIMARY KEY(�԰��ȣ)
, CONSTRAINT �԰�_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�) REFERENCES TBL_��ǰ(��ǰ�ڵ�)
);
--==>> Table TBL_�԰���(��) �����Ǿ����ϴ�.
-- TBL_�԰� ���̺��� �԰��ȣ�� �⺻Ű(PK) �������� ����
-- TBL_�԰� ���̺��� ��ǰ�ڵ�� TBL_��ǰ ���̺��� ��ǰ�ڵ带
-- ������ �� �ֵ��� �ܷ�Ű(FK) �������� ����


--�� TBL_��ǰ ���̺� ��ǰ ������ �Է�
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H001', 'Ȩ����', 1500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H002', '�����', 1200);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H003', '�ڰ�ġ', 1000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H004', '���ڱ�', 900);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H005', '������', 1100);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H006', '����Ĩ', 2000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H007', '������', 1700);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7


INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C001', '������', 2000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C002', '��극', 1800);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C003', '���̽�', 1700);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C004', '���͸�', 1900);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C005', '���̺�', 1700);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C006', '���Ͻ�', 1200);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C007', '������', 1900);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7


INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E001', '������', 600);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E002', '������', 500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E003', '�˵��', 300);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E004', '��Ʋ��', 600);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E005', '������', 800);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E006', '���׸�', 900);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E007', '��ī��', 900);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

--�� Ȯ��
SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001    	Ȩ����	1500	    0
H002	    �����	1200	    0
H003	    �ڰ�ġ	1000    	0
H004	    ���ڱ�	900	    0
H005	    ������	1100    	0
H006	    ����Ĩ	2000	    0
H007	    ������	1700    	0
C001	    ������	2000    	0
C002	    ��극	1800    	0
C003	    ���̽�	1700    	0
C004    	���͸�	1900	    0
C005    	���̺�	1700	    0
C006	    ���Ͻ�	1200	    0
C007	    ������	1900    	0
E001    	������	600	    0
E002    	������	500	    0
E003    	�˵��	300	    0
E004    	��Ʋ��	600	    0
E005    	������	800	    0
E006    	���׸�	900	    0
E007    	��ī��	900	    0
*/


SELECT COUNT(*)
FROM TBL_��ǰ;
--==>> 21


--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�


--�� ������ ���ν���(PRC_�԰�_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_�԰�_INSERT('H001', 20, 900);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_�԰�;
--==>> 1	H001	2021-04-09	20	900

SELECT *
FROM TBL_��ǰ;
--==>> H001	Ȩ����	1500	    20


--�� ������ ���ν���(PRC_�԰�_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_�԰�_INSERT('H001', 40, 1000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.



SELECT *
FROM TBL_�԰�;
--==>>
/*
1	H001	    2021-04-09	20	900
2	H001	    2021-04-09	40	1000
*/


SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	    Ȩ����	1500    	60
*/


--���� ���ν��� �������� ���� ó�� ����--

--�� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
, CONSTRAINT MEMBER_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ���ν���(PRC_MEMBER_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('������', '010-1111-1111', '����');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_MEMBER;
--==>> 1	������	010-1111-1111	����


--�� ������ ���ν���(PRC_MEMBER_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('�Ҽ���', '010-2222-2222', '���');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	������	010-1111-1111	����
2	�Ҽ���	010-2222-2222	���
*/

--�� ������ ���ν���(PRC_MEMBER_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('��ƺ�', '010-3333-3333', '��õ');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


--�� ������ ���ν���(PRC_MEMBER_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('���ϸ�', '010-4444-4444', '�λ�');
--==>> ���� �߻�
/*
ORA-20001: ����,��õ,��⸸ �Է� �����մϴ�.
*/


--�� ������ ���ν���(PRC_MEMBER_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('�ڹ���', '010-5555-5555', '����');
--==>> ���� �߻�
/*
ORA-20001: ����,��õ,��⸸ �Է� �����մϴ�.
*/


--�� �ǽ� ���̺� ����(TBL_���)
CREATE TABLE TBL_���
( ����ȣ  NUMBER
, ��ǰ�ڵ�  VARCHAR2(20)
, �������  DATE    DEFAULT SYSDATE
, ������  NUMBER
, ���ܰ�  NUMBER
);
--==>> Table TBL_�����(��) �����Ǿ����ϴ�.


--�� TBL_��� ���̺��� ����ȣ�� PK �������� ����
ALTER TABLE TBL_��� ADD CONSTRAINT ���_����ȣ_PK PRIMARY KEY(����ȣ);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.


--�� TBL_��� ���̺��� ��ǰ�ڵ�� TBL_��ǰ ���̺��� ��ǰ�ڵ带
--   ������ �� �ֵ��� �ܷ�Ű(FK) �������� ����
ALTER TABLE TBL_��� ADD CONSTRAINT ���_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�) REFERENCES TBL_��ǰ(��ǰ�ڵ�);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.


--�� ������ ���ν���(PRC_���_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_���_INSERT('H001', 10, 1000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_���;
--==>> 1	H001	    2021-04-09	10	1000

SELECT *
FROM TBL_��ǰ;
--==>> H001	Ȩ����	1500    	50
--60������ 10�� ����ؼ� 50�� ����

--�� ������ ���ν���(PRC_���_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_���_INSERT('H002', 10, 1000);
--==>> ���� �߻�
/*
ORA-20002: ��� �����Դϴ�.
*/

--�� ������ ���ν���(PRC_���_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_���_INSERT('H001', 60, 1000);
--==>> ���� �߻�
/*
ORA-20002: ��� �����Դϴ�.
*/


--�� ������ ���ν���(PRC_���_INSERT)�� ����� �۵��ϴ����� ���� Ȯ��
--   �� ���ν��� ȣ��
EXEC PRC_���_INSERT('H001', 50, 1000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_���;
--==>>
/*
1	H001	2021-04-09	10	1000
2	H001	2021-04-09	50	1000
*/

SELECT *
FROM TBL_��ǰ;
--==>> H001	Ȩ����	1500	    0


SELECT *
FROM TBL_��ǰ;

TRUNCATE TABLE TBL_�԰�;
TRUNCATE TABLE TBL_���;
UPDATE TBL_��ǰ
SET ������ = 0;
--==>>
/*
Table TBL_�԰���(��) �߷Ƚ��ϴ�.
Table TBL_�����(��) �߷Ƚ��ϴ�.
21�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
*/

SELECT *
FROM TBL_�԰�;
SELECT *
FROM TBL_���;
SELECT *
FROM TBL_��ǰ;


--�� �԰� �̺�Ʈ �߻�
EXEC PRC_�԰�_INSERT('H001', 20, 400);
EXEC PRC_�԰�_INSERT('H002', 30, 500);
EXEC PRC_�԰�_INSERT('H003', 40, 600);
EXEC PRC_�԰�_INSERT('H004', 50, 700);
EXEC PRC_�԰�_INSERT('H005', 60, 800);
EXEC PRC_�԰�_INSERT('H006', 70, 900);
EXEC PRC_�԰�_INSERT('H007', 80, 1000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 7

EXEC PRC_�԰�_INSERT('C001', 30, 800);
EXEC PRC_�԰�_INSERT('C002', 40, 900);
EXEC PRC_�԰�_INSERT('C003', 50, 1000);
EXEC PRC_�԰�_INSERT('C004', 60, 1100);
EXEC PRC_�԰�_INSERT('C005', 70, 1200);
EXEC PRC_�԰�_INSERT('C006', 80, 1300);
EXEC PRC_�԰�_INSERT('C007', 90, 1400);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 7

EXEC PRC_�԰�_INSERT('E001', 80, 990);
EXEC PRC_�԰�_INSERT('E002', 70, 880);
EXEC PRC_�԰�_INSERT('E003', 60, 770);
EXEC PRC_�԰�_INSERT('E004', 50, 660);
EXEC PRC_�԰�_INSERT('E005', 40, 550);
EXEC PRC_�԰�_INSERT('E006', 30, 440);
EXEC PRC_�԰�_INSERT('E007', 20, 330);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 7


--��� �̺�Ʈ �߻�
EXEC PRC_���_INSERT('H001', 1, 1100);
EXEC PRC_���_INSERT('H002', 2, 1200);
EXEC PRC_���_INSERT('H003', 3, 1300);
EXEC PRC_���_INSERT('H004', 4, 1400);
EXEC PRC_���_INSERT('H005', 5, 1500);
EXEC PRC_���_INSERT('H006', 6, 1600);
EXEC PRC_���_INSERT('H007', 7, 1700);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 7

EXEC PRC_���_INSERT('C001', 2, 1900);
EXEC PRC_���_INSERT('C002', 3, 1910);
EXEC PRC_���_INSERT('C003', 4, 1920);
EXEC PRC_���_INSERT('C004', 5, 1930);
EXEC PRC_���_INSERT('C005', 6, 1940);
EXEC PRC_���_INSERT('C006', 7, 1950);
EXEC PRC_���_INSERT('C007', 8, 1960);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 7




--------------------------------------------------------------





EXEC PRC_���_INSERT('C001', 2, 1900);
EXEC PRC_���_INSERT('C002', 3, 1910);
EXEC PRC_���_INSERT('C003', 4, 1920);
EXEC PRC_���_INSERT('C004', 5, 1930);
EXEC PRC_���_INSERT('C005', 6, 1940);
EXEC PRC_���_INSERT('C006', 7, 1950);
EXEC PRC_���_INSERT('C007', 8, 1960);




EXEC PRC_�԰�_INSERT('H007', 10, 1000);
EXEC PRC_�԰�_INSERT('H007', 20, 1000);

EXEC PRC_�԰�_INSERT('C001', 200, 1200);

EXEC PRC_�԰�_INSERT('C006', 300, 1000);
EXEC PRC_�԰�_INSERT('C006', 200, 1000);
EXEC PRC_�԰�_INSERT('C006', 100, 1000);

EXEC PRC_�԰�_INSERT('E007', 90, 500);



















