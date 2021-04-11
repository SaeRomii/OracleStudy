--○ 접속된 사용자 조회
SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 과제
--   본인이 태어나서 현재까지
--   얼마만큼의 일, 시간, 분, 초를 살았는지
--   조회하는 쿼리문을 구성한다.

/*
------------------------------------------------------------------------------
현재 시각            |     태어난 시각          |  일  |  시간  |  분  |  초  |
------------------------------------------------------------------------------
2021-03-29 14:34:27   | 1995-05-29 14:40:00     | 110  |   3   |  15   |  33  |
*/

SELECT (SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)
FROM DUAL;
--==>> 815302505

SELECT (SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60*60
FROM DUAL;

SELECT SYSDATE "현재 시각"
     , TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS') "태어난 시각"
     , TRUNC(SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) "일"
     , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60)/60), 24) "시간"
     , MOD(TRUNC((SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60), 60) "분"
     , MOD((SYSDATE-TO_DATE('1995-05-29 14:40:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60), 60) "초" 
FROM DUAL;
--==>> 
/*
현재 시각               태어난 시간      일   시간  분  초
2021-03-29 23:42:38	1995-05-29 14:40:00	9436	9	2	38
*/

