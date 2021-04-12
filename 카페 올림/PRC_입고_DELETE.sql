--○ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다.
--   프로시저 명 : PRC_입고_DELETE(입고번호);
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( V_입고번호    IN TBL_입고.입고번호%TYPE
)
IS
    V_상품코드  TBL_상품.상품코드%TYPE;
    V_이전입고수량  TBL_입고.입고수량%TYPE;
    V_상품코드  TBL_상품.상품코드%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_이전입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;

    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF (V_재고수량 -  V_입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    DELETE
    SET TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-2003, '삭제할 수 없습니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    COMMIT;
END;