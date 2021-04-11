SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 과제
--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.
--   급여는 (기본급*12)+수당 기반으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급, 수당)
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
--==>> Function FN_PAY이(가) 컴파일되었습니다.

--○ TBL_INSA 테이블의 입사일을 기준으로
--   현재까지의 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)
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
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.