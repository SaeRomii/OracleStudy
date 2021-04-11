SELECT USER
FROM DUAL;
--==>> SCOTT

SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.


--�� TBL_STUDENTS ���̺���
--   ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�) ���ν����� �ۼ��Ѵ�.
--   ��, ID �� PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�.
--   ���ν��� �� : PRC_STUDENTS_UPDATE
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '��� �ϻ�');

���ν��� ȣ��� ó���� ���
superman	    ������	010-9999-9999	��� �ϻ�
*/

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID AND (TBL_ID�� �ִ� PW �����;߰ڴ�);
END;


--�������� Ǯ���ֽ� ���
--��
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- UPDATE ������ ����
    /*
    UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
         FROM TBL_IDPW I JOIN TBL_STUDENTS S
         ON I.ID = S.ID;) T
    SET T.TEL = �Է¹��� ��ȭ��ȣ, T.ADDR=�Է¹����ּ�
    WHERE T.ID = �Է¹������̵� AND T.PW = �Է¹����н�����;
    */
    
    UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
             FROM TBL_IDPW I JOIN TBL_STUDENTS S
             ON I.ID = S.ID) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.


--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   ������ ���� �ִ� ��� ���̺� ������ �Է� ��
--   NUM �׸�(�����ȣ)�� ����
--   ���� �ο��� �����ȣ ������ ��ȣ�� �� ���� ��ȣ��
--   �ڵ����� �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
/*
���� ��)
EXE PRC_INSA_INSERT('������', 971006-2234567, SYSDATE, '����', '010-5555-5555'
                   , '������', '�븮', 5000000, 500000);
                   
���ν��� ȣ��� ó���� ���
1061 ������  971006-2234567  2021-04-09  ����  010-5555-5555  ������  �븮  5000000  500000
*/

--���� Ǯ���� ���
CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE
, V_CITY        IN TBL_INSA.CITY%TYPE
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.BUSEO%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS
    --INSERT ������ ���࿡ �ʿ��� ���� �߰� ����
    -- �� V_NUM
    V_NUM TBL_INSA.NUM%TYPE;
BEGIN
    --������ ����(V_NUM)�� �� ��Ƴ���
    --SELECT���� �� �־��ַ��� INTO ����� := ���Կ����� �ȵ�~!
    SELECT MAX(NUM)+1 INTO V_NUM
    FROM TBL_INSA;
    
    --INSERT ������ ����
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_��ǰ, TBL_�԰� ���̺��� �������
--   TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �Բ� ������ �� �ִ� ����� ����
--   ���ν����� �ۼ��Ѵ�.
--   ��, �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�. (������ ��� X)
--   TBL_�԰� ���̺� ���� �÷�
--   �� �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�
--   ���ν��� �� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)

CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_�԰����    IN TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ�    IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS
    V_�԰��ȣ TBL_�԰�.�԰��ȣ%TYPE;
    --0���� �ʱ�ȭ �����ִ� ������ IS�� �ʱ�ȭ ���ذŶ� ���� ���̺��� �ٲ��� ����
BEGIN
    SELECT NVL(MAX(�԰��ȣ)+1, 1) INTO V_�԰��ȣ
    FROM TBL_�԰�;
    --NVL ���ϸ� NULL���ε� NULL���� �����ص� NULL�̶� 1�� �����������
    
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
    VALUES(V_�԰��ȣ, V_��ǰ�ڵ�, DEFAULT, V_�԰����, V_�԰�ܰ�);
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.



--�������� Ǯ���ֽ� ���
--�� TBL_�԰� ���̺� �԰� �̺�Ʈ �߻� ��
--   ���� ���̺��� ����Ǿ�� �ϴ� ����
--   �� INSERT �� TBL_�԰�
--      INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
--      VALUES(1, 'H001', SYSDATE, 20, 900);
--   �� UPDATE �� TBL_��ǰ
--      UPDATE TBL_��ǰ
--      SET ������ = ���������� + 20(���԰����)
--      WHERE ��ǰ�ڵ�='H001';
CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_�԰����    IN TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ�    IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS
    -- �Ʒ��� �������� �����ϱ� ���� �ʿ��� ������ ������ ����
    V_�԰��ȣ  TBL_�԰�.�԰��ȣ%TYPE;
BEGIN
    -- ������ ����(V_�԰��ȣ)�� �� ��Ƴ���
    SELECT NVL(MAX(�԰��ȣ), 0) INTO V_�԰��ȣ
    FROM TBL_�԰�;
    
    -- ������ ����
    --   �� INSERT �� TBL_�԰�
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)
    VALUES((V_�԰��ȣ+1), V_��ǰ�ڵ�, V_�԰����, V_�԰�ܰ�);
    -- �԰����� DEFAULT�� ���ε�
    
    --   �� UPDATE �� TBL_��ǰ
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ�=V_��ǰ�ڵ�;
    
    COMMIT;
    
    -- ���� ó��
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
    -- INSERT�� UPDATE �� �ϳ� ó�� �ȵǸ� ROLLBACK �϶�� ���� �� �� �� ó���ؾ���
    
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.


--���� ���ν��� �������� ���� ó�� ����--

--�� �ǽ� ���̺� ����(TBL_MEMBER) �� 20210409_02_scott.sql ���� ����

--�� TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν����� ����
--   ��, �� ���ν����� ���� �����͸� �Է��� ���
--   CITY(����) �׸� '����', '���', '��õ' �� �Է��� �����ϵ��� �����Ѵ�.
--   �� ���� ���� ������ ���ν��� ȣ���� ���� �Է��Ϸ��� ���
--   ���� ó���� �Ϸ��� �Ѵ�.
--   ���ν��� �� : PRC_MEMBER_INSERT(�̸�, ��ȭ��ȣ, ����)
CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- ���� ������ ������ ������ ���� �ʿ��� ������ ���� ����
    V_NUM TBL_MEMBER.NUM%TYPE;
    
    -- �� ����� ���� ���ܿ� ���� �������� CHECK
    -- �ڹٷ� ������ throws EXCeption
    USER_DEFINE_ERROR EXCEPTION;
    --(������ ������)  ����
BEGIN

    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ����������
    -- �ƴ����� ���θ� ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_CITY NOT IN ('����', '���', '��õ'))   --����, ���, ��õ �� �ϳ��� ������� �ʴٸ�
        -- ���� �߻� CHECK
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM), 0) INTO V_NUM  -- 0 OR �ִ밪
    FROM TBL_MEMBER;
    
    -- INSERT ������ ����
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    --Ŀ��
    COMMIT;
    
    -- �� ����ó��
    -- �ڹٷ� ������ TRY CATCH ��
    -- BEGIN �ȿ� �ִ� �����߿� ���� �߻��ϸ� �������� �ͼ� ó����
    /*
    EXCEPTION
        WHEN �̷� ���ܶ��
            THEN �̷��� ó���ϰ�
        WHEN ���� ���ܶ��
            THEN ������ ó���ض�
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-�����ڵ�, ����������);
        WHEN ���� ���ܶ��
            THEN ������ ó���ض�
    */
    EXCEPTION
        WHEN USER_DEFINE_ERROR  --����ڰ� ó���� ���ܰ� �߻��ϸ� THEN ��¼�� ó���ϰ� �ѹ�
            THEN RAISE_APPLICATION_ERROR(-20001, '����,��õ,��⸸ �Է� �����մϴ�.');   
            --�����ڵ�� 20001���� ����ؼ� ������ �� ���� �������� �ƴ� ������ 1~20000������ ����Ŭ���� ����ϴ� �����ڵ�
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            --�ٸ������� ���ܸ� ROLLBACK�ض�
    
    
END;
--==>> Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.



--�� TBL_��� ���̺� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �����Ǵ� ���ν����� �ۼ��Ѵ�.
--   ��, ����ȣ�� �԰��ȣ�� ���������� �ڵ� ����.
--   ����, ��� ������ ��� �������� ���� ���
--   ��� �׼��� ����� �� �ֵ��� ó���Ѵ�. ��� �̷������ �ʵ���
--   ���ν��� �� : PRC_���_INSERT(��ǰ�ڵ�, ������, ���ܰ�)
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_������    IN TBL_���.������%TYPE
, V_���ܰ�    IN TBL_���.���ܰ�%TYPE
)
IS
    -- �ֿ� ���� ����
    V_����ȣ TBL_���.����ȣ%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
  
    --����� ���� ���ܿ� ���� ���� ����
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    --������ ���� ������ ���� ���� Ȯ�� �� ���� ��� Ȯ�� �� ��� ������ ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    --��� ���������� ������ �� �������� ���� ���� Ȯ��
    --(�ľ��� ���������� �������� ������ ���� �߻�)
    IF (V_������ > V_������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    --������ ������ �� ��Ƴ���
    SELECT NVL(MAX(����ȣ), 0)+1 INTO V_����ȣ
    FROM TBL_���;

    --UPDATE ������ ����
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    --INSERT ������ ����
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
    VALUES(V_����ȣ, V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    COMMIT;
    
    --���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� �����Դϴ�.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_��� ���̺��� ��� ������ ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_���_UPDATE(����ȣ, ������ ����);
-- ��� ������ ��� �ٽ� ��� �װŶ� ������ �������̶� ��
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_����ȣ    IN TBL_���.����ȣ%TYPE
, V_�������    IN TBL_���.������%TYPE
)
IS
  V_������    TBL_��ǰ.������%TYPE;
  V_��ǰ�ڵ�    TBL_��ǰ.��ǰ�ڵ�%TYPE;
  V_������    TBL_���.������%TYPE;
  
  --�� �ӳ� ����ó����
  USER_DEFINE_ERROR EXCEPTION;
  
BEGIN
    --�̰� �ٲ㺸��~!!!
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    SELECT ��ǰ�ڵ� INTO V_��ǰ�ڵ�
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    SELECT ������ INTO V_������
    FROM TBL_���
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF(V_������� - V_������ > V_������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT NVL(MAX(����ȣ), 0)+1 INTO V_����ȣ
    FROM TBL_���;
    
    --UPDATE ������ �ۼ�
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_������ + V_�������
    WHERE ����ȣ = V_����ȣ;
    
    --����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '��� �����Դϴ�.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;





























