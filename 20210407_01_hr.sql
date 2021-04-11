SELECT USER
FROM DUAL;
--==>> HR


--���� DEFAULT ǥ���� ����--

-- 1. INSERT �� UPDATE ������
--    ����ڰ� �����ϴ� Ư�� ���� �ƴ�
--    �⺻ ���� �Է��ϵ��� ó���� �� �ִ�.

-- 2. ���� �� ����
--    �÷��� ������Ÿ�� DEFAULT �⺻��

-- 3. INSERT ��� �� �ش� �÷��� �Էµ� ���� �Ҵ����� �ʰų�
--    DEFAULT Ű���带 Ȱ���Ͽ� �⺻ ���� �Է��ϵ��� �� �� �ִ�.

-- 4. DEFAULT Ű����� �ٸ� ����(NOT NULL ��) ǥ�Ⱑ ���� ���� ���
--    DEFAULT Ű���带 ���� ǥ��(�ۼ�)�� ���� �����Ѵ�.

--�� DEFAULT ǥ���� �ǽ�
-- ���̺� ����
CREATE TABLE TBL_BOARD                          -- �Խ��� ���̺� ����
( SID       NUMBER          PRIMARY KEY         -- �Խù� ��ȣ �� �ĺ���(�ڵ� ����)
, NAME      VARCHAR2(30)                        -- �Խù� �ۼ���
, CONTENTS  VARCHAR2(2000)                      -- �Խù� ����
, WRITEDAY  DATE            DEFAULT SYSDATE     -- �Խù� �ۼ���(���� ��¥ �ڵ� �Է�)
, COMMENTS  NUMBER          DEFAULT 0           -- �Խù��� ��� ����(�⺻�� 0)
, COUNTS    NUMBER          DEFAULT 0           -- �Խù� ��ȸ��(�⺻�� 0)
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� SID �� �ڵ� ���� ������ ��Ϸ��� ������ ��ü�� �ʿ��ϴ�.
--   �ڵ����� �ԷµǴ� �÷��� ����ڰ� �Է��ؾ� �ϴ� �׸񿡼�
--   ���ܽ�ų �� �ִ�.


-- ������ ����
CREATE SEQUENCE SEQ_BOARD
NOCACHE;
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.

-- ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- �Խù� �ۼ�
INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '�̻�ȭ', '����Ŭ���� DEFAULT ǥ������ �ǽ����Դϴ�.'
     , TO_DATE('2021-04-06 11:01:13', 'YYYY-MM-DD HH24:MI:SS'), 0, 0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '�Ҽ���', '��� �ǽ����Դϴ�.', SYSDATE, 0, 0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '���� �ǽ����Դϴ�.', DEFAULT, DEFAULT, DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_BOARD(SID, NAME, CONTENTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '�׽�Ʈ ���������Դϴ�.');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
-- WRITEDAY, COMMNETS, COUNTS ���� ������ NULL�� ���·� ��
-- ���̺� ���鶧 DEFAULT�� 0�� ������ ��� ������ ��ȸ�� �غ���~~

SELECT *
FROM TBL_BOARD;
--==> 
/*
1	�̻�ȭ	����Ŭ���� DEFAULT ǥ������ �ǽ����Դϴ�.	2021-04-06 11:01:13	0	0
2	�Ҽ���	��� �ǽ����Դϴ�.	                        2021-04-07 09:29:27	0	0
3	������	���� �ǽ����Դϴ�.	                        2021-04-07 09:30:39	0	0
4	������	�׽�Ʈ ���������Դϴ�.	                    2021-04-07 09:32:32	0	0

0���� ����!!
*/

COMMIT;
--==>> Ŀ�Կ�


--�� DEFAULT ǥ���� Ȯ��(��ȸ)
SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'TBL_BOARD';
--==>>
/*
TBL_BOARD	SID	NUMBER			22			N	1													NO	NO		0		NO	YES	NONE
TBL_BOARD	NAME	VARCHAR2			30			Y	2											CHAR_CS	30	NO	NO		30	B	NO	YES	NONE
TBL_BOARD	CONTENTS	VARCHAR2			2000			Y	3											CHAR_CS	2000	NO	NO		2000	B	NO	YES	NONE
TBL_BOARD	WRITEDAY	DATE			7			Y	4	8	"SYSDATE
"											NO	NO		0		NO	YES	NONE
TBL_BOARD	COMMENTS	NUMBER			22			Y	5	2	"0
"											NO	NO		0		NO	YES	NONE
TBL_BOARD	COUNTS	NUMBER			22			Y	6	2	"0
"											NO	NO		0		NO	YES	NONE
*/


SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_DEFAULT
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'TBL_BOARD';
--==>>
/*
TABLE_NAME	COLUMN_NAME	DATA_TYPE	DATA_DEFAULT
TBL_BOARD	SID	        NUMBER	    (null)
TBL_BOARD	NAME        	VARCHAR2	    (null)
TBL_BOARD	CONTENTS	    VARCHAR2	    (null)
TBL_BOARD	WRITEDAY    	DATE	    "SYSDATE"
TBL_BOARD	COMMENTS	    NUMBER	    "0"
TBL_BOARD	COUNTS	    NUMBER	    "0"
*/

--�� ���̺� ���� ���� DEFAULT ǥ���� �߰� / ����
ALTER TABLE ���̺��
MODIFY �÷��� [�ڷ���] DEFAULT �⺻��;


--�� ������ DEFAULT ǥ���� ����(����)
ALTER TABLE ���̺��
MODIFY �÷��� [�ڷ���] DEFAULT NULL;










