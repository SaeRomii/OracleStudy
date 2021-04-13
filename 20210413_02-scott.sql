SELECT USER
FROM DUAL;
--==>> SCOTT


--※ TRIGGER 의 정보 조회
SELECT *
FROM USER_TRIGGERS;



--○ 구성한 패키지가 유효한지 확인(테스트)
--   → 패키지에 논리적으로 구성된 함수 호출 확인
SELECT INSA_PACK.FN_GENDER('751212-1234567') "호출 확인"
FROM DUAL;
--==>> 남자

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN) "호출 확인"
FROM TBL_INSA;
