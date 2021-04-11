SELECT USER
FROM DUAL;
--==>> SCOTT

SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.


--○ TBL_STUDENTS 테이블에서
--   전화번호와 주소 데이터를 수정하는(변경하는) 프로시저를 작성한다.
--   단, ID 와 PW 가 일치하는 경우에만 수정을 진행할 수 있도록 한다.
--   프로시저 명 : PRC_STUDENTS_UPDATE
/*
실행 예)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '경기 일산');

프로시저 호출로 처리된 결과
superman	    박정준	010-9999-9999	경기 일산
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
    WHERE ID=V_ID AND (TBL_ID에 있는 PW 가져와야겠다);
END;


--선생님이 풀어주신 방법
--①
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- UPDATE 쿼리문 구성
    /*
    UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
         FROM TBL_IDPW I JOIN TBL_STUDENTS S
         ON I.ID = S.ID;) T
    SET T.TEL = 입력받은 전화번호, T.ADDR=입력받은주소
    WHERE T.ID = 입력받은아이디 AND T.PW = 입력받은패스워드;
    */
    
    UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
             FROM TBL_IDPW I JOIN TBL_STUDENTS S
             ON I.ID = S.ID) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.


--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   구조를 갖고 있는 대상 테이블에 데이터 입력 시
--   NUM 항목(사원번호)의 값은
--   기존 부여된 사원번호 마지막 번호의 그 다음 번호를
--   자동으로 입력 처리할 수 있는 프로시저로 구성한다.
--   프로시저 명 : PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
/*
실행 예)
EXE PRC_INSA_INSERT('한혜림', 971006-2234567, SYSDATE, '서울', '010-5555-5555'
                   , '영업부', '대리', 5000000, 500000);
                   
프로시저 호출로 처리된 결과
1061 한혜림  971006-2234567  2021-04-09  서울  010-5555-5555  영업부  대리  5000000  500000
*/

--내가 풀었던 방법
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
    --INSERT 쿼리문 수행에 필요한 변수 추가 선언
    -- → V_NUM
    V_NUM TBL_INSA.NUM%TYPE;
BEGIN
    --선언한 변수(V_NUM)에 값 담아내기
    --SELECT에서 값 넣어주려면 INTO 써야함 := 대입연산자 안됨~!
    SELECT MAX(NUM)+1 INTO V_NUM
    FROM TBL_INSA;
    
    --INSERT 쿼리문 구성
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.


--○ TBL_상품, TBL_입고 테이블을 대상으로
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 함께 변동될 수 있는 기능을 가진
--   프로시저를 작성한다.
--   단, 이 과정에서 입고번호는 자동 증가 처리한다. (시퀀스 사용 X)
--   TBL_입고 테이블 구성 컬럼
--   → 입고번호, 상품코드, 입고일자, 입고수량, 입고단가
--   프로시저 명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)

CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
, V_입고단가    IN TBL_입고.입고단가%TYPE
)
IS
    V_입고번호 TBL_입고.입고번호%TYPE;
    --0으로 초기화 안해주는 이유는 IS에 초기화 해준거라서 실제 테이블값은 바뀌지 않음
BEGIN
    SELECT NVL(MAX(입고번호)+1, 1) INTO V_입고번호
    FROM TBL_입고;
    --NVL 안하면 NULL값인데 NULL에는 연산해도 NULL이라서 1로 변경해줘야함
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;

    INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
    VALUES(V_입고번호, V_상품코드, DEFAULT, V_입고수량, V_입고단가);
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.



--선생님이 풀어주신 방법
--※ TBL_입고 테이블에 입고 이벤트 발생 시
--   관련 테이블에서 수행되어야 하는 내용
--   ① INSERT → TBL_입고
--      INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--      VALUES(1, 'H001', SYSDATE, 20, 900);
--   ② UPDATE → TBL_상품
--      UPDATE TBL_상품
--      SET 재고수량 = 기존재고수량 + 20(←입고수량)
--      WHERE 상품코드='H001';
CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
, V_입고단가    IN TBL_입고.입고단가%TYPE
)
IS
    -- 아래의 쿼리문을 수행하기 위해 필요한 데이터 변수로 선언
    V_입고번호  TBL_입고.입고번호%TYPE;
BEGIN
    -- 선언한 변수(V_입고번호)에 값 담아내기
    SELECT NVL(MAX(입고번호), 0) INTO V_입고번호
    FROM TBL_입고;
    
    -- 쿼리문 구성
    --   ① INSERT → TBL_입고
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
    VALUES((V_입고번호+1), V_상품코드, V_입고수량, V_입고단가);
    -- 입고일자 DEFAULT라서 빼두됨
    
    --   ② UPDATE → TBL_상품
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드=V_상품코드;
    
    COMMIT;
    
    -- 예외 처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
    -- INSERT나 UPDATE 중 하나 처리 안되면 ROLLBACK 하라는 구문 → 둘 다 처리해야함
    
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.


--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ 실습 테이블 생성(TBL_MEMBER) → 20210409_02_scott.sql 파일 참조

--○ TBL_MEMBER 테이블에 데이터를 입력하는 프로시저를 생성
--   단, 이 프로시저를 통해 데이터를 입력할 경우
--   CITY(지역) 항목에 '서울', '경기', '인천' 만 입력이 가능하도록 구성한다.
--   이 지역 외의 지역을 프로시저 호출을 통해 입력하려는 경우
--   예외 처리를 하려고 한다.
--   프로시저 명 : PRC_MEMBER_INSERT(이름, 전화번호, 지역)
CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 데이터 변수 선언
    V_NUM TBL_MEMBER.NUM%TYPE;
    
    -- ☆ 사용자 정의 예외에 대한 변수선언 CHECK
    -- 자바로 따지면 throws EXCeption
    USER_DEFINE_ERROR EXCEPTION;
    --(예외의 변수명)  예외
BEGIN

    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지
    -- 아닌지의 여부를 가장 먼저 확인할 수 있도록 코드 구성
    IF (V_CITY NOT IN ('서울', '경기', '인천'))   --서울, 경기, 인천 중 하나가 들어있지 않다면
        -- 예외 발생 CHECK
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM), 0) INTO V_NUM  -- 0 OR 최대값
    FROM TBL_MEMBER;
    
    -- INSERT 쿼리문 구성
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    --커밋
    COMMIT;
    
    -- ☆ 예외처리
    -- 자바로 따지면 TRY CATCH 문
    -- BEGIN 안에 있는 구문중에 예외 발생하면 이쪽으로 와서 처리함
    /*
    EXCEPTION
        WHEN 이런 예외라면
            THEN 이렇게 처리하고
        WHEN 저런 예외라면
            THEN 저렇게 처리해라
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-에러코드, 에러내용기술);
        WHEN 저런 예외라면
            THEN 저렇게 처리해라
    */
    EXCEPTION
        WHEN USER_DEFINE_ERROR  --사용자가 처리한 예외가 발생하면 THEN 어쩌구 처리하고 롤백
            THEN RAISE_APPLICATION_ERROR(-20001, '서울,인천,경기만 입력 가능합니다.');   
            --에러코드는 20001부터 약속해서 지정할 수 있음 정해진거 아님 하지만 1~20000까지는 오라클에서 사용하는 에러코드
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            --다른형태의 예외면 ROLLBACK해라
    
    
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.



--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.
--   또한, 출고 수량이 재고 수량보다 많은 경우
--   출고 액션을 취소할 수 있도록 처리한다. 출고가 이루어지지 않도록
--   프로시저 명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가)
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
, V_출고단가    IN TBL_출고.출고단가%TYPE
)
IS
    -- 주요 변수 선언
    V_출고번호 TBL_출고.출고번호%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
  
    --사용자 정의 예외에 대한 변수 선언
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    --쿼리문 수행 이전에 수행 여부 확인 → 기존 재고 확인 → 출고 수량과 비교
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    --출고를 정상적으로 진행해 줄 것인지에 대한 여부 확인
    --(파악한 재고수량보다 출고수량이 많으면 예외 발생)
    IF (V_출고수량 > V_재고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    --선언한 변수에 값 담아내기
    SELECT NVL(MAX(출고번호), 0)+1 INTO V_출고번호
    FROM TBL_출고;

    --UPDATE 쿼리문 구성
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    --INSERT 쿼리문 구성
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES(V_출고번호, V_상품코드, V_출고수량, V_출고단가);
    
    COMMIT;
    
    --예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족입니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에서 출고 수량을 변경(수정)하는 프로시저를 작성한다.
--   프로시저 명 : PRC_출고_UPDATE(출고번호, 변경할 수량);
-- 출고 수량을 재고에 다시 담고 그거랑 변경한 출고수량이랑 비교
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호    IN TBL_출고.출고번호%TYPE
, V_변경수량    IN TBL_출고.출고수량%TYPE
)
IS
  V_재고수량    TBL_상품.재고수량%TYPE;
  V_상품코드    TBL_상품.상품코드%TYPE;
  V_출고수량    TBL_출고.출고수량%TYPE;
  
  --그 머냐 예외처리도
  USER_DEFINE_ERROR EXCEPTION;
  
BEGIN
    --이거 바꿔보자~!!!
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    SELECT 상품코드 INTO V_상품코드
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    SELECT 출고수량 INTO V_출고수량
    FROM TBL_출고
    WHERE 상품코드 = V_상품코드;
    
    IF(V_변경수량 - V_출고수량 > V_재고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT NVL(MAX(출고번호), 0)+1 INTO V_출고번호
    FROM TBL_출고;
    
    --UPDATE 쿼리문 작성
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량 + V_변경수량
    WHERE 출고번호 = V_출고번호;
    
    --예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '재고 부족입니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;





























