SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ UNION / UNION ALL ■■■--

--○ 실습 테이블 생성(TBL_JUMUN)
CREATE TABLE TBL_JUMUN              --주문 테이블 생성
( JUNO      NUMBER                  --주문 번호
, JECODE    VARCHAR2(30)            --주문된 제품 코드
, JUSU      NUMBER                  --주문 수량
, JUDAY     DATE DEFAULT SYSDATE    --주문 일자
);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
--> 고객의 주문이 발생했을 경우 주문 내용에 대한 데이터가 입력될 수 있는 테이블


--○ 데이터 입력 → 고객의 주문 발생 / 접수
INSERT INTO TBL_JUMUN VALUES
(1, '쫀득초코칩', 20, TO_DATE('2001-11-01 09:05:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '와클', 10, TO_DATE('2001-11-01 09:23:37', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '꼬북칩', 30, TO_DATE('2001-11-01 11:41:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, '칙촉', 12, TO_DATE('2001-11-02 10:22:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, '홈런볼', 50, TO_DATE('2001-11-03 15:50:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, '바나나킥', 40, TO_DATE('2001-11-04 11:10:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, '눈을감자', 10, TO_DATE('2001-11-10 10:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '포카칩', 40, TO_DATE('2001-11-13 09:41:14', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, '감자칩', 20, TO_DATE('2001-11-14 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, '칸쵸', 20, TO_DATE('2001-11-20 14:17:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 10


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	쫀득초코칩	20	2001-11-01 09:05:12
2	와클	    10	2001-11-01 09:23:37
3	꼬북칩	    30	2001-11-01 11:41:00
4	칙촉	    12	2001-11-02 10:22:00
5	홈런볼	    50	2001-11-03 15:50:00
6	바나나킥	40	2001-11-04 11:10:00
7	눈을감자	10	2001-11-10 10:10:10
8	포카칩	    40	2001-11-13 09:41:14
9	감자칩	    20	2001-11-14 14:20:00
10	칸쵸	    20	2001-11-20 14:17:00
*/

--○ 커밋
COMMIT;
--==>> 커밋완.

--○ 데이터 추가 입력 → 2001년 부터 시작된 주문이 현재(2021년)까지 계속 발생
INSERT INTO TBL_JUMUN VALUES(938765, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938766, '빈츠', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938767, '와클', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938768, '홈런볼', 50, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938769, '꼬북칩', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938770, '꼬북칩', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938771, '꼬북칩', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938772, '포카칩', 40, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938773, '포카칩', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938774, '칸쵸', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938775, '칸쵸', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(938776, '바나나킥', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	    쫀득초코칩	20	2001-11-01 09:05:12
2	    와클	    10	2001-11-01 09:23:37
3	    꼬북칩	    30	2001-11-01 11:41:00
4	    칙촉	    12	2001-11-02 10:22:00
5	    홈런볼	    50	2001-11-03 15:50:00
6	    바나나킥	40	2001-11-04 11:10:00
7	    눈을감자	10	2001-11-10 10:10:10
8	    포카칩	    40	2001-11-13 09:41:14
9	    감자칩	    20	2001-11-14 14:20:00
10	    칸쵸	    20	2001-11-20 14:17:00
938765	홈런볼	    10	2021-04-01 14:23:28
938766	빈츠	    10	2021-04-01 14:24:21
938767	와클	    10	2021-04-01 14:25:05
938768	홈런볼	    50	2021-04-01 14:25:34
938769	꼬북칩	    30	2021-04-01 14:26:38
938770	꼬북칩	    20	2021-04-01 14:27:01
938771	꼬북칩	    10	2021-04-01 14:27:21
938772	포카칩	    40	2021-04-01 14:27:43
938773	포카칩	    20	2021-04-01 14:28:07
938774	칸쵸	    20	2021-04-01 14:28:33
938775	칸쵸	    10	2021-04-01 14:28:55
938776	바나나킥	10	2021-04-01 14:29:21
*/


--※ 유림이가 2001년도부터 과자 쇼핑몰 운영중
--   TBL_JUMUN 테이블이 너무 무거워진 상황
--   어플리케이션과의 연동으로 인해 주문 내역을 다른 테이블에 저장할 수 있도록
--   만드는 것은 힘든 상황
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황
--   → 결과적으로 현재까지 누적된 주문 데이터 중
--      금일 발생한 주문 내역을 제외하고
--      나머지를 다른 테이블(TBL_JUMUNBACKUP)로
--      데이터 이관을 수행할 계획

CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.

SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	쫀득초코칩	20	2001-11-01 09:05:12
2	와클	    10	2001-11-01 09:23:37
3	꼬북칩	    30	2001-11-01 11:41:00
4	칙촉	    12	2001-11-02 10:22:00
5	홈런볼	    50	2001-11-03 15:50:00
6	바나나킥	40	2001-11-04 11:10:00
7	눈을감자	10	2001-11-10 10:10:10
8	포카칩	    40	2001-11-13 09:41:14
9	감자칩	    20	2001-11-14 14:20:00
10	칸쵸	    20	2001-11-20 14:17:00
*/
--> TBL_JUMUN 테이블의 데이터들 중
--  금일 주문내역 이외의 데이터는 모두 TBL_JUMUNBACKUP 테이블에 백업을 마친 상태

--○ TBL_JUMUN 테이블의 데이터들 중
-- 금일 주문내역 이외의 데이터는 모두 삭제
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> 10개 행 이(가) 삭제되었습니다.


-- 아직 제품 발송이 완료되지 않은 금일 주문 데이터를 제외하고
-- 이전의 모든 주문 데이터들이 삭제된 상황이므로
-- 테이블은 행(레코드)의 개수가 줄어들어 매우 가벼워진 상황


--○확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
938765	홈런볼	    10	2021-04-01 14:23:28
938766	빈츠	    10	2021-04-01 14:24:21
938767	와클	    10	2021-04-01 14:25:05
938768	홈런볼	    50	2021-04-01 14:25:34
938769	꼬북칩	    30	2021-04-01 14:26:38
938770	꼬북칩	    20	2021-04-01 14:27:01
938771	꼬북칩	    10	2021-04-01 14:27:21
938772	포카칩	    40	2021-04-01 14:27:43
938773	포카칩	    20	2021-04-01 14:28:07
938774	칸쵸	    20	2021-04-01 14:28:33
938775	칸쵸	    10	2021-04-01 14:28:55
938776	바나나킥    10	2021-04-01 14:29:21
*/

--○ 커밋
COMMIT;
--==>> 커밋완.

-- 그런데, 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내야 할 상황이 발생하게 되었다.
-- 그렇다면 TBL_JUMUNBACKUP 테이블의 레코드(행)와 
-- TBL_JUMUN 테이블의 레코드(행)를 합쳐서
-- 하나의 테이블을 조회하는 것과 같은
-- 결과를 확인할 수 있도록 조회해야 한다.

-- 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우 JOIN을 사용하지만
-- 레코드(행)와 레코드(행)를 결합하고자 하는 경우 UNION / UNION ALL 을 사용할 수 있다.
SELECT *
FROM TBL_JUMUNBACKUP;
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;
-- 주문번호 기준 정렬
-- 레코드중 중복된 값 있으면 하나만 나옴
-- 기능은 UNION이 더 뛰어남

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;
--성능은 UNION ALL이 더 조음(기능이 UNION보다 없음)

--※ UNION은 항상 결과물의 첫 번째 컬럼을 기준으로
--   오름차순 정렬을 수행한다.
--   UNION ALL은 결합된 순서대로 조회한 결과를 반환한다. (정렬 없음)
--   이로 인해 UNION의 부하가 더 크다.
--   또한, UNION 은 결과물에서 중복된 행이 존재할 경우
--   중복을 제거하고 1개 행만 조회된 결과를 반환하게 된다.

--○ 지금까지 주문받은 모든 데이터를 통해
--   제품별 총 주문량을 조회하는 쿼리문을 구성한다.
/*
-----------------------------------
    제품코드        총 주문량
-----------------------------------
      ..                XX
    ....               XXX
*/

--내가 풀었던 방법
SELECT T.JECODE "제품코드"
    , SUM(T.JUSU) "총 주문량"
FROM
(
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
)T
GROUP BY (T.JECODE);


--선생님이 풀어준 방법
SELECT JECODE "제품코드", SUM(JUSU) "총 주문량"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T
GROUP BY T.JECODE;
--==>>
/*
쫀득초코칩	20
꼬북칩	    90
와클	    20
칙촉	    12
포카칩	    100
바나나킥	50
눈을감자	10
홈런볼	    110
감자칩	    20
빈츠	    10
칸쵸	    50
*/


SELECT JECODE "제품코드", SUM(JUSU) "총 주문량"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T
GROUP BY T.JECODE;
--==>>
/*
꼬북칩	    60
쫀득초코칩	20
와클	    10
칙촉	    12
포카칩	    60
눈을감자	10
바나나킥	50
감자칩	    20
빈츠	    10
홈런볼	    60
칸쵸	    30
*/
-- UNION 쓰면 중복 제거됨
--> 이 문제를 해결하는 과정에서는 UNION을 사용해서는 안된다.
--  → JECODE 와 JUSU 를 조회하는 과정에서 중복된 행을 제거하는 상황이 발생


--○ INTERSECT / MINUS (→ 교집합 / 차집합)

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문량의 값이 똑같은 행만 추출하고자 한다.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
꼬북칩	30
와클	10
칸쵸	20
포카칩	40
홈런볼	50
*/
-- 교집합 찾아줌~! 양쪽 테이블에 다 있는 값

--○ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
--   제품코드와 주문량의 값이 똑같은 행의 정보를
--   주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회한다.
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP;

SELECT 제품코드가 꼬북칩이고 주문수량이 30이면 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       제품코드가 와클이고 주문수량이 10이면 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       제품코드가 칸쵸이고 주문수량이 20이면 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       제품코드가 포카칩이고 주문수량이 40이면 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       제품코드가 홈런볼이고 주문수량이 50이면 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T;


SELECT T.JECODE = '꼬북칩' AND T.JUSU = 30 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       T.JECODE = '와클' AND T.JUSU = 10 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       T.JECODE = '칸쵸' AND T.JUSU = 20 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       T.JECODE = '포카칩' AND T.JUSU = 40 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
       T.JECODE = '홈런볼' AND T.JUSU = 50 주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T;

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회

SELECT T1.JUNO, T1.JECODE, T1.JUSU, T1.JUDAY
FROM
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
)T1,
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T2
WHERE T1.JECODE = T2.JECODE
  AND T1.JUSU = T2.JUSU;
  
--조인으로 하는것도 해보자~!


JOIN
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
ON 

























