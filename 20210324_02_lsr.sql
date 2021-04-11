--�� ���ӵ� ����� Ȯ��
SELECT USER
FROM DUAL;
--==>> LSR

--����Ŭ������ �÷�(�׸�)�� ������Ÿ��;

--�� ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO    NUMBER(10)    
, NAME  VARCHAR2(30)  
);

--NUMBER(10)�� ���� ���� ���� 10�ڸ�
--VARCHAR2(30)�� ���� ���� ����
--==>> ���� �߻�
/*
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/

--> ���� lsr ������ CREATE SESSION ���Ѹ� ���� ������
--  ���̺��� ������ �� �ִ� ������ ���� ���� ���� �����̴�.
--  �׷��Ƿ� �����ڷκ��� ���̺� ���� ������ �ο��޾ƾ� �Ѵ�.

--�� SYS�κ��� CREAT TABLE ���� ���� ��
--   �ٽ� ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO    NUMBER(10)    
, NAME  VARCHAR2(30)  
);
--==>> ���� �߻�
/*
ORA-01950: no privileges on tablespace 'TBS_EDUA'
01950. 00000 -  "no privileges on tablespace '%s'"
*Cause:    User does not have privileges to allocate an extent in the
           specified tablespace.
*Action:   Grant the user the appropriate system privileges or grant the user
           space resource on the tablespace.
*/
--> ���̺� ���� ����(CREATE TABLE)���� �ο����� ��Ȳ������
--  lsr ����� ������ �⺻ ���̺� �����̽�(DEFAULT TABLESPACE �� TBS_EDUA)�� ����
--  �Ҵ緮�� �ο����� ���� ����.
--  �׷��Ƿ� �� ���̺����̽��� ����� ������ ���ٴ� �����޼�����
--  ����Ŭ�� ����� �ְ� �ִ� ��Ȳ


--�� SYS�κ��� ���̺����̽�(TBS_EDUA)�� ���� �Ҵ緮�� �ο����� ����
--   �ٽ� ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO    NUMBER(10)    
, NAME  VARCHAR2(30)  
);
--==>> Table TBL_ORAUSERTEST��(��) �����Ǿ����ϴ�.

--�� �ڽſ��� �ο��� �Ҵ緮 ��ȸ
SELECT *
FROM USER_TS_QUOTAS;
--==>> TBS_EDUA	65536	-1	8	-1	NO


--�� ������ ���̺�(TBL_ORAUSERTEST)��
--   � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>> TBL_ORAUSERTEST	TBS_EDUA




























