SELECT USER
FROM DUAL;
--==>> SCOTT


--�� TRIGGER �� ���� ��ȸ
SELECT *
FROM USER_TRIGGERS;



--�� ������ ��Ű���� ��ȿ���� Ȯ��(�׽�Ʈ)
--   �� ��Ű���� �������� ������ �Լ� ȣ�� Ȯ��
SELECT INSA_PACK.FN_GENDER('751212-1234567') "ȣ�� Ȯ��"
FROM DUAL;
--==>> ����

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN) "ȣ�� Ȯ��"
FROM TBL_INSA;
