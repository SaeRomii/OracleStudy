SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ����
--�� TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
--   �޿��� (�⺻��*12)+���� ������� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��, ����)
CREATE OR REPLACE FUNCTION FN_PAY
( A NUMBER
, B NUMBER
)
RETURN NUMBER
IS
    VRESULT NUMBER := 1;
BEGIN
    VRESULT := A*12+B;
    RETURN VRESULT;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.

--�� TBL_INSA ���̺��� �Ի����� ��������
--   ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
--   �Լ��� : FN_WORKYEAR(�Ի���)
CREATE OR REPLACE FUNCTION FN_WORKYEAR
( A DATE
)
RETURN NUMBER
IS
    VRESULT NUMBER;
    B       NUMBER;
BEGIN
    B := MONTHS_BETWEEN (TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD')), TO_DATE(TO_CHAR(A, 'YYYY-MM-DD')));
    
    VRESULT := TRUNC((B/12),1);
    RETURN VRESULT;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.