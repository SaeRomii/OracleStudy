SELECT USER
FROM DUAL;
--==>> SCOTT

--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�,
--   �޿� �������� �������� ������ ������ �� �ֵ��� �Ѵ�.
SELECT SANAME "�����ȣ", SANO "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1)='1' OR SUBSTR(JUBUN, 7, 1)='3'
ORDER BY �޿� DESC;
--==>>
/*
������	1009	9804251234567	4000
������	1011	7505071234567	3000
����	    1016	7012121234567	2000
������	1014	0203043234567	2000
���ü�	1015    	0512123234567	1000
*/

--�� LENGTH() / LENGTHB()
SELECT ENAME "1"
     , LENGTH(ENAME) "2"
     , LENGTHB(ENAME) "3"
FROM TBL_EMP;
-->> LENGTH() �� ���� ���� ��ȯ, LENGTHB()�� ����Ʈ ���� ��ȯ
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD    	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING    	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD    	4	4
MILLER	6	6
*/

--�� Ȯ��
SELECT *
FROM NLS_DATABASE_PARAMETERS;
--==>>
/*
NLS_LANGUAGE	            AMERICAN
NLS_TERRITORY	        AMERICA
NLS_CURRENCY	            $
NLS_ISO_CURRENCY	        AMERICA
NLS_NUMERIC_CHARACTERS	.,
NLS_CHARACTERSET	        AL32UTF8
NLS_CALENDAR	            GREGORIAN
NLS_DATE_FORMAT	        DD-MON-RR
NLS_DATE_LANGUAGE	    AMERICAN
NLS_SORT	                BINARY  
NLS_TIME_FORMAT	        HH.MI.SSXFF AM
NLS_TIMESTAMP_FORMAT	    DD-MON-RR HH.MI.SSXFF AM
NLS_TIME_TZ_FORMAT	    HH.MI.SSXFF AM TZR
NLS_TIMESTAMP_TZ_FORMAT	DD-MON-RR HH.MI.SSXFF AM TZR
NLS_DUAL_CURRENCY	    $
NLS_COMP	                BINARY
NLS_LENGTH_SEMANTICS	    BYTE
NLS_NCHAR_CONV_EXCP	    FALSE
NLS_NCHAR_CHARACTERSET	AL16UTF16
NLS_RDBMS_VERSION	    11.2.0.2.0
*/

--�� �ѱ� �����͸� ó���� ���
--   ����Ʈ ������� ó���ؾ߸� �ϴ� ��Ȳ�̶��
--   �׻� ���ڵ� ����� �� üũ�ϰ� ����ؾ� �Ѵ�.

--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "1"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "2"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "3"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "4"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "5"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 2) "6"
FROM DUAL;

--INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) �� 
--ORACLE ORAHOME BIORA ���� ORA�� ������ ù��° �ε��� ���(�� �� O�������� �ȱ�)

--==>> ORACLE ORAHOME BIORA	1	8	8	8	18
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ����� (��� ���ڿ�)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�
--  �� ��° �Ķ���� ���� ã�� �����ϴ� (��, ��ĵ�� �����ϴ�) ��ġ
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(1�� ���� ����)

SELECT '���ǿ���Ŭ �����ο��� �մϴ�' "1"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 1) "2"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 2) "3"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 10) "4"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 11) "5"
FROM DUAL;
--> ������ �Ķ����(�� ��° �Ķ����) ���� ������ ���·� ��� �� 1
--==>> ���ǿ���Ŭ �����ο��� �մϴ� 3 3 10 0

--�� REVERSE()
SELECT 'ORACLE' "1"
     , REVERSE('ORACLE') "2"
     , REVERSE('����Ŭ') "3"
FROM DUAL;
--> ��� ���ڿ�(�Ű�����)�� �Ųٷ� ��ȯ�Ѵ�. (��, �ѱ��� ����)
--==>> ORACLE	ELCARO	???

--�� �ǽ� ��� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� �ǽ� ������ �Է�
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20210329_01_SCOTT.SQL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8

SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20210329_01_SCOTT.SQL
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� ��.

SELECT FILENO "���Ϲ�ȣ", FILENAME "���ϸ�"
FROM TBL_FILES;
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210329_01_SCOTT.SQL
*/


--�� TBL_FILES ���̺��� ������� ���� ���� ��ȸ�� �� �ֵ���(���ϸ�,Ȯ����)
--   �������� �����Ѵ�.
--���� Ǯ���� ���
SELECT SUBSTR(FILENAME, INSTR(FILENAME, '\', -1)+1)
FROM TBL_FILES;

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�" 
    , SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES
WHERE FILENO = 1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , REVERSE(FILENAME) "�ŲٷεȰ����������"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC    	                COD.SELAS\CCC\BBB\AAA\:C
2	C:\AAA\PANMAE.XXLS	                        SLXX.EAMNAP\AAA\:C
3	D:\RESEARCH.PPT	                            TPP.HCRAESER\:D
4	C:\DOCUMENTS\STUDY.HWP	                    PWH.YDUTS\STNEMUCOD\:C
5	C:\DOCUMENTS\TEMP\SQL.TXT	                TXT.LQS\PMET\STNEMUCOD\:C
6	D:\SHARE\F\TEST.PNG	                        GNP.TSET\F\ERAHS\:D
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	    GPJ.GNIRPS\OTOHP\ERUTCIP\GNODLIUG\RESU\:C
8	C:\ORACLESTUDY\20210329_01_SCOTT.SQL	        LQS.TTOCS_10_92301202\YDUTSELCARO\:C
*/

/*
COD.SELAS                   \CCC\BBB\AAA\:C
SLXX.EAMNA P                \AAA\:C
TPP.HCRAESER                \:D
PWH.YDUTS                   \STNEMUCOD\:C
TXT.LQS                     \PMET\STNEMUCOD\:C
GNP.TSET                    \F\ERAHS\:D
GPJ.GNIRPS                  \OTOHP\ERUTCIP\GNODLIUG\RESU\:C
LQS.TTOCS_10_92301202       \YDUTSELCARO\:C
*/
--> ���� '\'�� �����ϴ� ��ġ
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, ���� '\'�� �����ϴ� ��ġ -1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

--���� '\'�� �����ϴ� ��ġ
SELECT INSTR(REVERSE(FILENAME), '\', 1) --������ �Ű����� 1 ����
FROM TBL_FILES;

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
     ,  SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

SELECT FILENO "���Ϲ�ȣ"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1)) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210329_01_SCOTT.SQL
*/

--�� LPAD()
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
-- �ι�° �Ű��������� ����
SELECT 'ORACLE' "1"
    , LPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	****ORACLE
--> �� 10Byte ������ Ȯ���Ѵ�.                  �� �� ��° �Ķ���� ���� ����
--  �� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.  �� ù ��° �Ķ���� ���� ����
--  �� �����ִ� Byte ����(4Byte)�� ���ʺ��� �� ��° �Ķ���� ������ ä���.
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� RPAD()
--> Byte ������ Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
    , RPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	ORACLE****
--> �� 10Byte ������ Ȯ���Ѵ�.                  �� �� ��° �Ķ���� ���� ����
--  �� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.  �� ù ��° �Ķ���� ���� ����
--  �� �����ִ� Byte ����(4Byte)�� �����ʺ��� �� ��° �Ķ���� ������ ä���.
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� LTRIM()
SELECT 'ORAORAORACLEORACLE' "1" --���� ���� ����Ŭ ����Ŭ
     , LTRIM('ORAORAORACLEORACLE', 'ORA') "2"
     , LTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"    --ORA �߶󳻴°����� �� �ܾ �ƴ϶� O,R,A�� �տ� A �� �߸��°�
     , LTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
     , LTRIM('ORA ORAORACLEORACLE', 'ORA') "5"
     , LTRIM(' ORAORACLEORACLE', ' ') "6"
     , LTRIM('              ORACLE') "7" --���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;
--==>>
/*
ORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRAORACLEORACLE	
 ORAORACLEORACLE	
ORAORACLEORACLE	
ORACLE
*/

--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.


--�� RTRIM()
SELECT 'ORAORAORACLEORACLE' "1" --���� ���� ����Ŭ ����Ŭ
     , RTRIM('ORAORAORACLEORACLE', 'ORA') "2"
     , RTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"    --ORA �߶󳻴°����� �� �ܾ �ƴ϶� O,R,A�� �տ� A �� �߸��°�
     , RTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
     , RTRIM('ORA ORAORACLEORACLE', 'ORA') "5"
     , RTRIM(' ORAORACLEORACLE', ' ') "6"
     , RTRIM('              ORACLE') "7" --���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
     , RTRIM('ORACLE              ') "8"
FROM DUAL;
--==>>
/*
ORAORAORACLEORACLE	
ORAORAORACLEORACLE	
AAAORAORAORACLEORACLE	
ORAoRAORACLEORACLE	
ORA ORAORACLEORACLE	 
 ORAORACLEORACLE	
              ORACLE
ORACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  �����ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.

SELECT LTRIM('�̱���̱�����̽Žű��̽����̱��̱���̽Ź��̱��', '�̱��') "�׽�Ʈ"
FROM DUAL;
--==>> ���̱��

SELECT RTRIM('�̱���̱�����̽Žű��̽����̱��̱���̽Ź��̱��', '�̱��') "�׽�Ʈ"
FROM DUAL;
--==>> �̱���̱�����̽Žű��̽����̱��̱���̽Ź�


--�� TRANSLATE()
--> 1:1�� �ٲپ��ش�.
SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                , 'abcdefghijklmnopqrstuvwxyz') "�׽�Ʈ"
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-8833-0594'
                , '0123456789'
                , '�����̻�����ĥ�ȱ�') "�׽�Ʈ"
FROM DUAL;
--==>> ���Ͽ�-���Ȼ��-��������


--�� REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����') "�׽�Ʈ"
FROM DUAL;
--==>> MY ����CLE ����HOME
-- REPLACE������ ORA�� '����'�� �ϼ��� �ܾ���


------------------------------------------------------------------------------

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "1"
     , ROUND(48.678, 2) "2"     --�Ҽ��� ���� �� ��° �ڸ����� ǥ��(�� ��° �ڸ����� �ݿø�)
     , ROUND(48.674, 2) "3"
     , ROUND(48.674, 1) "4"
     , ROUND(48.674, 0) "5"
     , ROUND(48.674) "6"        --�� ��° �Ķ���� ���� 0�� ��� ���� ����
     , ROUND(48.674, -1) "7"    --10�� �ڸ����� ��ȿ�� ǥ��
     , ROUND(48.674, -2) "8"
     , ROUND(48.674, -3) "9"
FROM DUAL;
--==>> 48.678	48.68	48.67	48.7	49	49	50	0	0

--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678 "1"
     , TRUNC(48.678, 2) "2"     -- �Ҽ��� ���� �� ��° �ڸ����� ǥ��(�� ��° �ڸ����� ����)
     , TRUNC(48.674, 2) "3"
     , TRUNC(48.674, 1) "4"
     , TRUNC(48.674, 0) "5"
     , TRUNC(48.674) "6"        --�� ��° �Ķ���� ���� 0�� ��� ���� ����
     , TRUNC(48.674, -1) "7"    --10�� �ڸ����� ��ȿ�� ǥ��
     , TRUNC(48.674, -2) "8"
     , TRUNC(48.674, -3) "9"    
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5, 2) "Ȯ��"
FROM DUAL;
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ

--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5, 3) "Ȯ��"
FROM DUAL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ


--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2) "Ȯ��"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2�� ���� ����� ��ȯ

--�� LOG() �α� �Լ�
--   (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α� �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10, 100) "Ȯ��1", LOG(10, 20) "Ȯ��2"
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677

--�� �ﰢ �Լ�
--   ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>> 
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/

--�� �ﰢ�Լ��� ���Լ� (���� : -1 ~ 1)
--   �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/


--�� SIGN()   ����, ��ȣ, Ư¡
--> ���� ������� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2) "1", SIGN(5-5) "2", SIGN(5-7) "3"
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�.


--�� ASCII(), CHR() �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A'), CHR(65)
FROM DUAL;
--==>> 65	A
--> ASCII : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--  CHR   : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ ������ �⺻ ������ DAY(�ϼ�)�̴�~!!! CHECK~!!!
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE+3
FROM DUAL;
--==>>
/*
2021-03-29 12:04:12	    -- ����
2021-03-30 12:04:12	    -- 1�� ��
2021-03-27 12:04:12	    -- 2�� ��
2021-04-01 12:04:12     -- 3�� ��
*/

--�� �ð� ���� ����
SELECT SYSDATE, SYSDATE +1/24, SYSDATE - 2/24
FROM DUAL;
--==>>
/*
2021-03-29 12:05:53	    -- ����
2021-03-29 13:05:53	    -- 1�ð� ��
2021-03-29 10:05:53     -- 2�ð� ��
*/

--�� ���� �ð��� ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
/*
-------------------------------------------------------
        ����ð�                    ���� �� �ð�
-------------------------------------------------------
  2021-03-29 12:05:52           2021-03-30 14:08:56
*/
SELECT SYSDATE, SYSDATE+1 +2/24 +3/1440 +4/86400
FROM DUAL;

-- ���1.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;
--==>> 
/*
2021-03-29 12:21:00	
2021-03-30 14:24:04
*/

--���2.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "���� �� �ð�"
FROM DUAL;
--==>> 
/*
2021-03-29 12:20:51	
2021-03-30 14:23:55
*/

--�� ��¥ - ��¥ = �ϼ�
--   ex) (2021-07-09) - (2021-03-29)
--          ������         ������

SELECT TO_DATE('2021-07-09', 'YYYY-MM-DD') - TO_DATE('2021-03-29', 'YYYY-MM-DD') "Ȯ��"
FROM DUAL;
--==>> 102

--�� ������ Ÿ���� ��ȯ
TO_DATE('2021-07-09', 'YYYY-MM-DD') -- ��¥ �������� ��ȯ
FROM DUAL;

TO_DATE('2021-07-59', 'YYYY-MM-DD')
FROM DUAL;
--==>> ���� �߻�

SELECT TO_DATE('2021-13-09', 'YYYY-MM-DD')
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month"
*Cause:    
*Action:
*/

--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������


--�� ADD_MONTHS()
SELECT SYSDATE "1"
     , ADD_MONTHS(SYSDATE, 2) "2"
     , ADD_MONTHS(SYSDATE, 3) "3"
     , ADD_MONTHS(SYSDATE, -2) "4"
     , ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
--==>>
/*
2021-03-29 12:30:00     -- ����
2021-05-29 12:30:00	    -- 2���� ��
2021-06-29 12:30:00	    -- 3���� ��
2021-01-29 12:30:00	    -- 2���� ��
2020-12-29 12:30:00     -- 3���� ��
*/
--> ���� ���ϰ� ����

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� MONTHS_BETWEEN()
--   ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 225.952389859617682198327359617682198327
--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--�� ������� ��ȣ�� ��-1��(����)�� ��ȯ�Ǿ��� ��쿡��
--   ù ��° ���ڰ��� �ش��ϴ� ��¥����
--   �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-07-09', 'YYYY-MM-DD'))
FROM DUAL;
--==>> -3.33787373058542413381123058542413381123


--�� NEXT_DAY()
-- ù ���� ���ڰ��� ���� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> 2021-04-03	2021-04-05

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ���� ������ ���� ���� �������� �ٽ� �� �� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>> 2021-04-03	2021-04-05

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

--ALTER�� Ŀ���̶� �ѹ� ����� �ƴ� ��� �ڵ����� Ŀ�Ե�..


--�� LAST_DAY()
--   �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>> 2021-03-31


--�� ���úη� �����̰� ���뿡 �� ��������
--   �����Ⱓ�� 22������ �Ѵ�.

--   1. ���� ���ڸ� ���Ѵ�.

--   2. �Ϸ� ���ڲ��� ���� �Ļ縦 �ؾ� �Ѵٰ� �����ϸ�
--      �����̰� �� ���� �Ծ�� ���� �����ٱ�
SELECT SYSDATE "���� ��¥"
     , ADD_MONTHS(SYSDATE, 22) "���� ����"
     , TO_DATE('2023-01-29', 'YYYY-MM-DD') - TO_DATE('2021-03-29', 'YYYY-MM-DD') "��ĥ"
     , (3*671) "�� ��"
FROM DUAL;

--�� ���� ��¥ �� �ð����κ���
--   ������(2021-07-09 18:00:00) ���� ���� �Ⱓ��
--   ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
------------------------------------------------------------------------------
���� �ð�            |        ������           |  ��  |  �ð�  |  ��  |  ��  |
------------------------------------------------------------------------------
2021-03-29 14:34:27   | 2021-07-09 18:00:00     | 110  |   3   |  15   |  33  |
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- ���� Ǯ� ���
SELECT SYSDATE "���� �ð�"
     , TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE, 0) "��"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60/60)/60), 24)"�ð�"
     , MOD(TRUNC((TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60/60), 60) "��"
     , TRUNC(MOD((TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60, 60)) "��"
FROM DUAL;
--==>> 2021-03-29 16:10:24	2021-07-09 18:00:00	102	1	49	36

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�
SELECT �������� - ��������
FROM DUAL;

-- ��������
SELECT TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2021-07-09 18:00:00 �� ��¥ ����

SELECT TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 102.079363425925925925925925925925925926
--> �����ϱ��� ���� �ϼ� (���� : ��)

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : ��
SELECT (�����ϱ��� ���� �ϼ�) * (�Ϸ縦 �����ϴ� ��ü ��)
FROM DUAL;

SELECT (TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 8819455


SELECT SYSDATE "���� �ð�"
     , TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE, 0) "��"
     , MOD(TRUNC(TRUNC((TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60/60)/60), 24)"�ð�"
     , MOD(TRUNC((TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60/60), 60) "��"
     , TRUNC(MOD((TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60, 60)) "��"
FROM DUAL;
--==>> 2021-03-29 16:17:04	2021-07-09 18:00:00	102	1	42	55


--�� ����
--   ������ �¾�� �������
--   �󸶸�ŭ�� ��, �ð�, ��, �ʸ� ��Ҵ���
--   ��ȸ�ϴ� �������� �����Ѵ�.

/*
------------------------------------------------------------------------------
���� �ð�            |     �¾ �ð�          |  ��  |  �ð�  |  ��  |  ��  |
------------------------------------------------------------------------------
2021-03-29 14:34:27   | 1995-05-29 14:40:00     | 110  |   3   |  15   |  33  |
*/

SELECT (SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)
FROM DUAL;

SELECT SYSDATE "���� �ð�"
     , TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS') "�¾ �ð�"
     , TRUNC(SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) "��"
     , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60*60/60)/60), 24) "�ð�"
     , MOD(TRUNC((SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60*60/60), 60) "��"
     , TRUNC(MOD((SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60*60, 60)) "��"
FROM DUAL;



--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                  -- 2021-03-29   �� �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "2"   -- 2021-01-01    �� �⵵���� ��ȿ�� ������(��ݱ�, �Ϲݱ� ����)
     , ROUND(SYSDATE, 'MONTH') "3"  -- 2021-04-01    �� ������ ��ȿ�� ������(15�� ����)
     , ROUND(SYSDATE, 'DD') "4"     -- 2021-03-30    �� ��¥���� ��ȿ�� ������(���� ����)
     , ROUND(SYSDATE, 'DAY') "5"    -- 2021-03-28    �� ��¥���� ��ȿ�� ������(������ ����) 
FROM DUAL;


--�� ��¥ ����
SELECT SYSDATE "1"                  -- 2021-03-29   �� �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "2"   -- 2021-01-01    �� �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "3"  -- 2021-03-01    �� ������ ��ȿ�� ������
     , TRUNC(SYSDATE, 'DD') "4"     -- 2021-03-29    �� ��¥���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "5"    -- 2021-03-28    �� ��¥���� ��ȿ�� ������ �� ������ �Ͽ���
FROM DUAL;


-----------------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()    : ���� ������(��¥ ����)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER()  : ���� ������(���� ����)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�

SELECT 10 "1", TO_CHAR(10) "2"
FROM DUAL;

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ �� �ֵ��� �Ѵ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_CURRENCY = '\';   -- ȭ����� : ��(��)
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')   -- 2021-03-29
     , TO_CHAR(SYSDATE, 'YYYY')         -- 2021
     , TO_CHAR(SYSDATE, 'YEAR')         -- TWENTY TWENTY-ONE(�����ۿ� �����ȵ�)
     , TO_CHAR(SYSDATE, 'MM')           -- 03
     , TO_CHAR(SYSDATE, 'MONTH')        -- 3��
     , TO_CHAR(SYSDATE, 'MON')          -- 3��
     , TO_CHAR(SYSDATE, 'DD')           -- 29
     , TO_CHAR(SYSDATE, 'DAY')          -- ������
     , TO_CHAR(SYSDATE, 'DY')           -- ��
     , TO_CHAR(SYSDATE, 'HH24')         -- 16
     , TO_CHAR(SYSDATE, 'HH')           -- 04
     , TO_CHAR(SYSDATE, 'HH AM')        -- 04 ����
     , TO_CHAR(SYSDATE, 'HH PM')        -- 04 ����
     , TO_CHAR(SYSDATE, 'MI')           -- 43
     , TO_CHAR(SYSDATE, 'SS')           -- 18
     , TO_CHAR(SYSDATE, 'SSSSS')        -- 60219  �� ���� �귯�� ��ü ��
     , TO_CHAR(SYSDATE, 'Q')            -- 1     �� �б�
FROM DUAL;

SELECT '04' "1", TO_NUMBER('04') "2"
FROM DUAL;
--==>> 04   4

SELECT TO_CHAR(4) "1", '4' "2"
FROM DUAL;
--==>> 4    4

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) "Ȯ��"
FROM DUAL;
-- ����Ÿ���� ����Ÿ������
--==>> 2021

--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY')     -- 2021      �� ������ �����Ͽ� ���� Ÿ������
     , TO_CHAR(SYSDATE, 'MM')       -- 03        �� ���� �����Ͽ� ����Ÿ������
     , TO_CHAR(SYSDATE, 'DD')       -- 29        �� ���� �����Ͽ� ���� Ÿ������
     , EXTRACT(YEAR FROM SYSDATE)   -- 2021      �� ������ �����Ͽ� ���� Ÿ������
     , EXTRACT(MONTH FROM SYSDATE)  -- 3         �� ���� �����Ͽ� ���� Ÿ������
     , EXTRACT(DAY FROM SYSDATE)    -- 19        �� ���� �����Ͽ� ���� Ÿ������
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�

--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "1"                            -- 60000
    , TO_CHAR(60000) "2"                    -- 60000
    , TO_CHAR(60000, '99,999') "3"          -- 60,000
    , TO_CHAR(60000, '$99,999') "4"         -- $60,000
    , TO_CHAR(60000, 'L99,999') "5"         --          \60,000
    , LTRIM(TO_CHAR(60000, 'L99,999')) "6"  -- \60,000
FROM DUAL;

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "���� �ð�"
     , SYSDATE +1 +(2/24) + (3/(24*60)) + (4/(24*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>> 
/*
2021-03-29 17:17:37	
2021-03-30 19:24:37
*/

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� ���"
FROM DUAL;
--==>>
/*
2021-03-29 17:20:58	
2022-06-01 21:26:04
*/


----------------------------------------------------------------------------------


-- ���� CASE ����(���ǹ�, �б⹮) ���� --
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�¸����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2�¸����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2�¸����

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '����'
       END "��� Ȯ��"
FROM DUAL;
--==>> 1+1=2


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�¸���') "��� Ȯ��"
FROM DUAL;
--==>> 5-2=3

--�� CASE WHEN THEN ELSE END ���� Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5�� 2�� �� �Ұ�'
       END "��� Ȯ��"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '���Ҹ���'
            ELSE '���ָ���'
       END "��� Ȯ��"
FROM DUAL;

/*
SELECT CASE WHEN F OR T AND T
*/

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=2 THEN '���Ҹ���'
            ELSE '���ָ���'
       END "��� Ȯ��"
FROM DUAL;
--==>>
/*
SELECT CASE WHEN F AND F OR T AND T THEN '��������'
                    F   OR T
                       T  AND T
                          TRUE  = '��������'
            WHEN 5<2 AND 2=2 THEN '���Ҹ���'
            ELSE '���ָ���'
       END "��� Ȯ��"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=2 THEN '���Ҹ���'
            ELSE '���ָ���'
       END "��� Ȯ��"
FROM DUAL;
/*
SELECT CASE WHEN 3<1 AND (F OR T) AND 2=2 THEN '��������'
                            T
                 F   AND   T
                      F
                      F     AND    T
                            F  =  �н�
            WHEN 5<2 AND 2=2 THEN '���Ҹ���'
                  F  AND  T
                     F   = �н�
            ELSE '���ָ���'
       END "��� Ȯ��"
FROM DUAL;
*/






































