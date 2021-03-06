SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session戚(亜) 痕井鞠醸柔艦陥.

--】 庚薦
-- TBL_SAWON 砺戚鷺聖 醗遂馬食 陥製引 旭精 牌鯉級聖 繕噺廃陥.
-- 紫据腰硲, 紫据誤, 爽肯腰硲, 失紺, 薄仙蟹戚, 脊紫析
-- , 舛鰍盗送析, 悦巷析呪, 害精析呪, 厭食, 左格什

-- 舘, 薄仙蟹戚澗 廃厩蟹戚 域至狛拭 魚虞 尻至聖 呪楳廃陥.
-- 暁廃, 舛鰍盗送析精 背雁 送据税 蟹戚亜 廃厩蟹戚稽 60室亜 鞠澗 背(鰍亀)税
-- 益 送据税 脊紫 杉, 析稽 尻至聖 呪楳廃陥.
-- 益軒壱 左格什澗 1000析 戚雌 2000析 耕幻 悦巷廃 紫据精
-- 益 紫据税 据掘 厭食 奄層 30% 走厭,
-- 2000析 戚雌 悦巷廃 紫据精
-- 益 紫据税 据掘 厭食 奄層 50% 走厭聖 拝 呪 赤亀系 坦軒廃陥.

SELECT *
FROM TBL_SAWON;

-- 爽肯腰硲稽 失紺 姥馬奄  しせしせ
-- 薄仙蟹戚..  しせ しせ
-- 舛鰍盗送析精 60-薄仙蟹戚 析呪 蟹紳暗 希馬奄
-- 悦巷析呪澗 薄仙獣娃拭辞 脊紫析 皐奄       しせしせ
-- 害精析呪澗 舛鰍盗送析拭辞 薄仙獣娃 皐奄
-- 左格什澗 SAL戚 >=1000析 <2000戚檎 SAL*0.3戚壱, SAL>=2000 = SAL*0.5 しせしせ

--【【【【【【【鎧亜 熱醸揮 号狛
SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲", HIREDATE "脊紫析"
FROM TBL_SAWON;

--昼杯 坪球
SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) = '2' OR SUBSTR(JUBUN, 7, 1) = '4' THEN '食切'
       WHEN SUBSTR(JUBUN, 7, 1) = '1' OR SUBSTR(JUBUN, 7, 1) = '3' THEN '害切'
       ELSE 'X'
       END "失紺"
     , EXTRACT(YEAR FROM SYSDATE) 
       - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1  as "薄仙蟹戚"
     , HIREDATE "脊紫析"
     , TO_DATE((TO_CHAR(EXTRACT(YEAR FROM SYSDATE) + 60-(EXTRACT(YEAR FROM SYSDATE) 
       - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1)) || SUBSTR(HIREDATE, 5))) "舛鰍 盗送析"
     , TRUNC(SYSDATE-HIREDATE) "悦巷析呪"
     , TRUNC(TO_DATE((TO_CHAR(EXTRACT(YEAR FROM SYSDATE) + 60-(EXTRACT(YEAR FROM SYSDATE) 
       - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1)) || SUBSTR(HIREDATE, 5))) - SYSDATE) "害精析呪"
     , SAL "厭食"
     , CASE
       WHEN TRUNC(SYSDATE-HIREDATE) >= 1000 AND TRUNC(SYSDATE-HIREDATE) < 2000 THEN SAL*0.3
       ELSE SAL*0.5
       END "左格什"
FROM TBL_SAWON;

-- 薄仙蟹戚 嗣焼左切.. 梅壱
SELECT *
FROM TBL_SAWON;

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))
FROM DUAL;

SELECT EXTRACT(YEAR FROM SYSDATE) 
       - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1  as "薄仙蟹戚"
FROM TBL_SAWON;


-- 舛鰍盗送析 姥背左切..
-- 60 - 薄仙蟹戚
-- 薄仙 鰍亀 + 姥廃葵 + 杉析(庚切)
SELECT TO_DATE((TO_CHAR(EXTRACT(YEAR FROM SYSDATE) + 60-(EXTRACT(YEAR FROM SYSDATE) 
       - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1)) || SUBSTR(HIREDATE, 5))) "舛鰍 盗送析"
FROM TBL_SAWON;  

--害精析呪 姥背左切
--舛鰍盗送析 - 薄仙劾促
SELECT TRUNC(TO_DATE((TO_CHAR(EXTRACT(YEAR FROM SYSDATE) + 60-(EXTRACT(YEAR FROM SYSDATE) 
       - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1)) || SUBSTR(HIREDATE, 5))) - SYSDATE)
FROM TBL_SAWON;


--左格什  しせしせ
--1000析 戚雌 2000析 耕幻 悦巷廃 紫据精
-- 益 紫据税 据掘 厭食 奄層 30% 走厭,
-- 2000析 戚雌 悦巷廃 紫据精
-- 益 紫据税 据掘 厭食 奄層 50% 走厭
SELECT *
FROM TBL_SAWON;


SELECT CASE
       WHEN TRUNC(SYSDATE-HIREDATE) >= 1000 AND TRUNC(SYSDATE-HIREDATE) < 2000 THEN SAL*0.3
       ELSE SAL*0.5
       END "左格什"
FROM TBL_SAWON;


--【【【【【【【識持還戚 葱 号狛

--TBL_SAWON 砺戚鷺拭 糎仙馬澗 紫据級税
--脊紫析(HIREDATE) 鎮軍拭辞 杉, 析幻 繕噺馬奄
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM'), TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;
--==>>
/*
沿亜慎	2001-01-03	01	03
沿辞薄	2010-11-05	11	05
沿焼紺	1999-08-16	08	16
戚政顕	2008-02-02	02	02
舛爽費	2009-07-15	07	15
廃駁顕	2009-07-15	07	15
戚馬戚	2010-06-05	06	05
焼戚政	2012-07-13	07	13
舛層戚	2007-07-08	07	08
戚戚薦	2008-12-10	12	10
識疑伸	1990-10-10	10	10
識酔識	2002-10-10	10	10
識酔遂橿	1991-11-11	11	11
害爽舶	2010-05-05	05	05
害叡識	2012-08-14	08	14
害戚	    1990-08-14	08	14
*/

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM') || '-' || TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;
--==>>
/*
沿亜慎	2001-01-03	01-03
沿辞薄	2010-11-05	11-05
沿焼紺	1999-08-16	08-16
戚政顕	2008-02-02	02-02
舛爽費	2009-07-15	07-15
廃駁顕	2009-07-15	07-15
戚馬戚	2010-06-05	06-05
焼戚政	2012-07-13	07-13
舛層戚	2007-07-08	07-08
戚戚薦	2008-12-10	12-10
識疑伸	1990-10-10	10-10
識酔識	2002-10-10	10-10
識酔遂橿	1991-11-11	11-11
害爽舶	2010-05-05	05-05
害叡識	2012-08-14	08-14
害戚  	1990-08-14	08-14
*/

-- 紫据腰硲, 紫据誤, 爽肯腰硲, 失紺, 薄仙蟹戚, 脊紫析
-- , 舛鰍盗送析, 悦巷析呪, 害精析呪, 厭食, 左格什

--?? 紫据腰硲, 紫据誤, 爽肯腰硲, 失紺, 薄仙蟹戚, 脊紫析, 厭食
SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
     , CASE WHEN THEN ELSE END "失紺"
FROM TBL_SAWON;

SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
    -- 失紺
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '害切' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '食切'
            ELSE '失紺溌昔災亜' 
       END "失紺"
    -- 薄仙蟹戚 = 薄仙鰍亀 - 殿嬢貝鰍亀 + 1 (1900鰍企 持 / 2000鰍企 持)
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
           ELSE 0
      END "薄仙蟹戚"
    , HIREDATE "脊紫析"
    , SAL "厭食"
FROM TBL_SAWON;


    , CASE WHEN 1990鰍企 持戚虞檎
           THEN 薄仙鰍亀 - (爽肯腰硲 蒋 砧切軒 + 1899)
           WHEN 2000鰍企 持戚虞檎
           THEN 薄仙鰍亀 - (爽肯腰硲 蒋 砧切軒 + 1999)
           ELSE '蟹戚溌昔災亜'
      END "薄仙蟹戚"
      -- 拭君 降持
      
    , CASE WHEN 1990鰍企 持戚虞檎
           THEN 薄仙鰍亀 - (爽肯腰硲 蒋 砧切軒 + 1899)
           WHEN 2000鰍企 持戚虞檎
           THEN 薄仙鰍亀 - (爽肯腰硲 蒋 砧切軒 + 1999)
           ELSE 0
      END "薄仙蟹戚"
      -- ELSE 採歳 収切展脊生稽 隔嬢醤敗
      
      , CASE WHEN 爽肯腰硲 7腰属 切軒 1鯵亜 1 暁澗 2
           THEN 薄仙鰍亀 - (爽肯腰硲 蒋 砧切軒 + 1899)
           WHEN 爽肯腰硲 7腰属 切軒 1鯵亜 3 暁澗 4
           THEN 薄仙鰍亀 - (爽肯腰硲 蒋 砧切軒 + 1999)
           ELSE 0
      END "薄仙蟹戚"
      
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
           ELSE 0
      END "薄仙蟹戚"
    
--==>>
/*
1001	沿亜慎	9402252234567	食切  	28
1002	    沿辞薄	9412272234567	食切  	28
1003	沿焼紺	9303082234567	食切  	29
1004	戚政顕	9609142234567	食切  	26
1005	舛爽費	9712242234567	食切  	25
1006	廃駁顕	9710062234567	食切  	25
1007	戚馬戚	0405064234567	食切  	18
1008	焼戚政	0103254234567	食切  	21
1009	舛層戚	9804251234567	害切  	24
1010	戚戚薦	0204254234567	食切  	20
1011	識疑伸	7505071234567	害切  	47
1012	    識酔識	9912122234567	食切  	23
1013	識酔遂橿	7101092234567	食切  	51
1014	害爽舶	0203043234567	害切  	20
1015	害叡識	0512123234567	害切  	17
1016	害戚  	7012121234567	害切  	52
*/


-- 脊紫析, 厭食 蓄亜
/*
1001	沿亜慎	9402252234567	食切	    28	2001-01-03	3000
1002	    沿辞薄	9412272234567	食切	    28	2010-11-05	2000
1003	沿焼紺	9303082234567	食切	    29	1999-08-16	5000
1004	戚政顕	9609142234567	食切	    26	2008-02-02	4000
1005	舛爽費	9712242234567	食切	    25	2009-07-15	2000
1006	廃駁顕	9710062234567	食切	    25	2009-07-15	2000
1007	戚馬戚	0405064234567	食切	    18	2010-06-05	1000
1008	焼戚政	0103254234567	食切	    21	2012-07-13	3000
1009	舛層戚	9804251234567	害切	    24	2007-07-08	4000
1010	戚戚薦	0204254234567	食切	    20	2008-12-10	2000
1011	識疑伸	7505071234567	害切	    47	1990-10-10	3000
1012	    識酔識	9912122234567	食切	    23	2002-10-10	2000
1013	識酔遂橿	7101092234567	食切	    51	1991-11-11	1000
1014	害爽舶	0203043234567	害切  	20	2010-05-05	2000
1015	害叡識	0512123234567	害切	    17	2012-08-14	1000
1016	害戚  	7012121234567	害切  	52	1990-08-14	2000
*/

-- 紫据腰硲, 紫据誤, 爽肯腰硲, 失紺, 薄仙蟹戚, 脊紫析
-- , 舛鰍盗送析, 悦巷析呪, 害精析呪, 厭食, 左格什


--辞崎汀軒庚 拙失 板 醗遂馬食 汀軒庚 拙失
SELECT T.紫据腰硲, T.紫据誤, T.爽肯腰硲, T.失紺, T.薄仙蟹戚, T.脊紫析
     -- 【 舛鰍盗送析
      -- 舛鰍盗送鰍亀 ≧ 背雁 送据税 蟹戚亜 廃厩蟹戚稽 60室亜 鞠澗 背
      -- 薄仙 蟹戚亜 58室檎 2鰍 板 盗送  = 2021(薄仙鰍亀) ≧ 2023(盗送鰍亀)
      -- 薄仙 蟹戚亜 35室檎 25鰍 板 盗送 = 2021(薄仙鰍亀) ≧ 2046(盗送鰍亀)
      -- ADD_MONTHS(SYSDATE, 害精鰍呪*12)
      --                    --------
      --                    (60 - 薄仙蟹戚)
      -- ADD_MONTHS(SYSDATE, (60 - 薄仙蟹戚) * 12)
      -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - 薄仙蟹戚) * 12), 'YYYY') ≧ 舛鰍盗送 鰍亀幻 蓄窒
      -- TO_CHAR(脊紫析, 'MM-DD')                                  ≧ 脊紫杉析幻 蓄窒
      -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - 薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(脊紫析, 'MM-DD') "舛鰍盗送析"
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(T.脊紫析, 'MM-DD') "舛鰍盗送析"
     
     -- 【 悦巷析呪
      -- 悦巷析呪 = 薄仙析 - 脊紫析
     , TRUNC(SYSDATE - T.脊紫析) "悦巷析呪"
     
     -- 【 害精析呪
      -- 害精析呪 = 舛鰍盗送析 - 薄仙析
      -- , TRUNC(TO_DATE(舛鰍盗送庚切伸, 'YYYY-MM-DD') - SYSDATE) "害精析呪"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(T.脊紫析, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "害精析呪"
     
     -- 【 厭食
     , T.厭食
     
     -- 【 左格什
      -- 悦巷析呪亜 1000析 戚雌 2000析 耕幻戚檎 厭食税 30%
      -- 悦巷析呪亜 2000析 戚雌戚檎 厭食税 50%
      -- 蟹袴走                    0%
     , CASE WHEN TRUNC(SYSDATE - T.脊紫析) >= 2000 THEN T.厭食*0.5
            WHEN TRUNC(SYSDATE - T.脊紫析) >= 1000 THEN T.厭食*0.3
            ELSE 0
        END "左格什"
FROM
(
    SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
        -- 失紺
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '害切' 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '食切'
               ELSE '失紺溌昔災亜' 
          END "失紺"
        -- 薄仙蟹戚 = 薄仙鰍亀 - 殿嬢貝鰍亀 + 1 (1900鰍企 持 / 2000鰍企 持)
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
              ELSE 0
         END "薄仙蟹戚"
        , HIREDATE "脊紫析"
        , SAL "厭食"
    FROM TBL_SAWON
)T;


--【 爽汐 蒸裳 獄穿
SELECT T.紫据腰硲, T.紫据誤, T.爽肯腰硲, T.失紺, T.薄仙蟹戚, T.脊紫析
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(T.脊紫析, 'MM-DD') "舛鰍盗送析"
    , TRUNC(SYSDATE - T.脊紫析) "悦巷析呪"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(T.脊紫析, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "害精析呪"
    , T.厭食
    , CASE WHEN TRUNC(SYSDATE - T.脊紫析) >= 2000 THEN T.厭食*0.5
            WHEN TRUNC(SYSDATE - T.脊紫析) >= 1000 THEN T.厭食*0.3
            ELSE 0
      END "左格什"
FROM
(
    SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
        -- 失紺
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '害切' 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '食切'
               ELSE '失紺溌昔災亜' 
          END "失紺"
        -- 薄仙蟹戚 = 薄仙鰍亀 - 殿嬢貝鰍亀 + 1 (1900鰍企 持 / 2000鰍企 持)
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
              ELSE 0
         END "薄仙蟹戚"
        , HIREDATE "脊紫析"
        , SAL "厭食"
    FROM TBL_SAWON
)T;
--==>>
/*
紫据腰硲	紫据誤	爽肯腰硲	        失紺	  薄仙蟹戚     脊紫析	舛鰍盗送析	悦巷析呪	   害精析呪	    厭食	    左格什
1001	沿亜慎	9402252234567	食切	    28	    2001-01-03	2053-01-03	 7391	    11601	    3000	1500
1002	    沿辞薄	9412272234567	食切	    28	    2010-11-05	2053-11-05	 3798	    11907	    2000	    1000
1003	沿焼紺	9303082234567	食切	    29	    1999-08-16	2052-08-16	 7897	    11461	    5000	2500
1004	戚政顕	9609142234567	食切  	26	    2008-02-02	2055-02-02	 4805	    12361	    4000	2000
1005	舛爽費	9712242234567	食切  	25	    2009-07-15	2056-07-15	 4276	    12890	    2000	    1000
1006	廃駁顕	9710062234567	食切  	25	    2009-07-15	2056-07-15	 4276	    12890	    2000    	1000
1007	戚馬戚	0405064234567	食切  	18	    2010-06-05	2063-06-05	 3951	    15406	    1000	500
1008	焼戚政	0103254234567	食切  	21	    2012-07-13	2060-07-13	 3182       14349	    3000	1500
1009	舛層戚	9804251234567	害切	    24	    2007-07-08	2057-07-08	 5014	    13248	    4000	2000
1010	戚戚薦	0204254234567	食切	    20	    2008-12-10	2061-12-10	 4493	    14864	    2000    	1000
1011	識疑伸	7505071234567	害切	    47	    1990-10-10	2034-10-10	 11129	    4941	    3000	1500
1012	    識酔識	9912122234567	食切	    23	    2002-10-10	2058-10-10	 6746	    13707	    2000    	1000
1013	識酔遂橿	7101092234567	食切	    51	    1991-11-11	2030-11-11	 10732	    3512        	1000	500
1014	害爽舶	0203043234567	害切  	20	    2010-05-05	2061-05-05	 3982	    14645	    2000	    1000
1015	害叡識	0512123234567	害切	    17	    2012-08-14	2064-08-14	 3150	    15842	    1000	500
1016	害戚  	7012121234567	害切  	52	    1990-08-14	2029-08-14	 11186	    3058	    2000	    1000
*/

-- 雌奄 鎧遂拭辞 働舛 悦巷析呪税 紫据聖 溌昔背醤 廃陥暗蟹
-- 働舛 左格什 榎衝聖 閤澗 紫据聖 溌昔背醤 拝 井酔亜 持掩 呪 赤陥.
-- 戚人 旭精 井酔 背雁 汀軒庚聖 陥獣 姥失馬澗 腰暗稽崇聖 匝析 呪 赤亀系
-- 坂(VIEW)研 幻級嬢 煽舌背 却 呪 赤陥.

CREATE OR REPLACE VIEW VIEW_SAWON
--据掘 CREATE VIEW VIEW誤 戚係惟 旋嬢醤馬澗汽 益君檎 気嬢床奄虞辞 OR REPLACE 潤操醤敗
--汽戚斗澗 砺戚鷺拭 赤製 悦汽 益撹 潤獄軒檎 益 是拭 気嬢床奄虞辞 OR REPLACE 潤操醤敗 益軍 VIEW税 汽戚斗(汀軒庚)亜 持沿
AS
SELECT T.紫据腰硲, T.紫据誤, T.爽肯腰硲, T.失紺, T.薄仙蟹戚, T.脊紫析
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(T.脊紫析, 'MM-DD') "舛鰍盗送析"
    , TRUNC(SYSDATE - T.脊紫析) "悦巷析呪"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.薄仙蟹戚) * 12), 'YYYY') || '-' || TO_CHAR(T.脊紫析, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "害精析呪"
    , T.厭食
    , CASE WHEN TRUNC(SYSDATE - T.脊紫析) >= 2000 THEN T.厭食*0.5
            WHEN TRUNC(SYSDATE - T.脊紫析) >= 1000 THEN T.厭食*0.3
            ELSE 0
      END "左格什"
FROM
(
    SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
        -- 失紺
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '害切' 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '食切'
               ELSE '失紺溌昔災亜' 
          END "失紺"
        -- 薄仙蟹戚 = 薄仙鰍亀 - 殿嬢貝鰍亀 + 1 (1900鰍企 持 / 2000鰍企 持)
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
              ELSE 0
         END "薄仙蟹戚"
        , HIREDATE "脊紫析"
        , SAL "厭食"
    FROM TBL_SAWON
)T;
--==>> View VIEW_SAWON戚(亜) 持失鞠醸柔艦陥

SELECT *
FROM TBL_SAWON;
--> 薄仙 T : 1001	沿亜慎	9402252234567	2001-01-03	3000

SELECT *
FROM VIEW_SAWON;
--> 薄仙 V : 1001	沿亜慎	9402252234567	食切	28	2001-01-03	2053-01-03	7391	11601	3000	1500


--】 VIEW 持失 戚板 汽戚斗 痕井
UPDATE TBL_SAWON
SET HIREDATE=SYSDATE, SAL=100
WHERE SANO=1001;
--==>> 1 楳 戚(亜) 穣汽戚闘鞠醸柔艦陥.


--】 溌昔
SELECT *
FROM VIEW_SAWON;

--】 朕行
COMMIT;

SELECT *
FROM TBL_SAWON;
--> 痕井 穿 T : 1001   	沿亜慎	9402252234567	2001-01-03	3000
--> 痕井 板 T : 1001	    沿亜慎	9402252234567	2021-03-30	100

SELECT *
FROM VIEW_SAWON;
--> 痕井 穿 V : 1001   	沿亜慎	9402252234567	食切	28	2001-01-03	2053-01-03	7391	11601	3000	1500
--> 痕井 板 V : 1001	    沿亜慎	9402252234567	食切	28	2021-03-30	2053-03-30	0	    11687	 100       0


--】 庚薦
-- 辞崎汀軒研 醗遂馬食 TBL_SAWON 砺戚鷺聖 陥製引 旭戚 繕噺拝 呪 赤亀系 廃陥. (砺戚鷺 戚遂)
/*
----------------------------------------------------------------------
    紫据誤   失紺    薄仙蟹戚    厭食  蟹戚左格什
----------------------------------------------------------------------

舘, 蟹戚左格什澗 薄仙 蟹戚亜 40室 戚雌戚檎 厭食税 70%
    30室 戚雌 40室 耕幻戚檎 厭食税 50%
    20室 戚雌 30室 耕幻戚檎 厭食税 30%稽 廃陥.
    
暁廃, 刃失吉 繕噺 姥庚聖 奄鋼生稽
VIEW_SAWON2 虞澗 戚硯税 坂(VIEW)研 持失廃陥.
*/

SELECT *
FROM TBL_SAWON;


CREATE OR REPLACE VIEW VIEW_SAWON2
AS

SELECT T.紫据誤, T.失紺, T.薄仙蟹戚, T.厭食
     --蟹戚左格什
     , CASE WHEN T.薄仙蟹戚 >= 40 THEN T.厭食*0.7
            WHEN T.薄仙蟹戚 >= 30 AND T.薄仙蟹戚 < 40 THEN T.厭食*0.5
            WHEN T.薄仙蟹戚 >= 20 AND T.薄仙蟹戚 < 30 THEN T.厭食*0.3
            ELSE 0
       END "蟹戚左格什"
FROM
(
    SELECT SANO "紫据腰硲", SANAME "紫据誤", JUBUN "爽肯腰硲"
        -- 失紺
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '害切' 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '食切'
               ELSE '失紺溌昔災亜' 
          END "失紺"
        -- 薄仙蟹戚 = 薄仙鰍亀 - 殿嬢貝鰍亀 + 1 (1900鰍企 持 / 2000鰍企 持)
        , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
              ELSE 0
         END "薄仙蟹戚"
        , SAL "厭食"
    FROM TBL_SAWON
)T;
--==>> View VIEW_SAWON2戚(亜) 持失鞠醸柔艦陥.
/*
沿亜慎	食切  	28	100	    30
沿辞薄	食切  	28	2000	    600
沿焼紺	食切  	29	5000	1500
戚政顕	食切	    26	4000	1200
舛爽費	食切  	25	2000	    600
廃駁顕	食切  	25	2000    	600
戚馬戚	食切  	18	1000	0
焼戚政	食切  	21	3000	900
舛層戚	害切  	24	4000	1200
戚戚薦	食切  	20	2000    	600
識疑伸	害切  	47	3000	2100
識酔識	食切  	23	2000    	600
識酔遂橿	食切  	51	1000	700
害爽舶	害切	    20	2000    	600
害叡識	害切	    17	1000	0
害戚	    害切  	52	2000    	1400
*/

--】 VIEW_SAWON2 溌昔
SELECT *
FROM VIEW_SAWON2;


-------------------------------------------------------------------------------

--】 RANK() ≧ 去呪(授是)研 鋼発馬澗 敗呪
SELECT EMPNO "紫据腰硲", ENAME "紫据誤", DEPTNO "採辞腰硲", SAL "厭食"
     , RANK() OVER(ORDER BY SAL DESC) "穿端厭食授是"
FROM EMP;
-==>>
/*
7839	KING    	10	5000	1
7902	    FORD    	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	    4
7698	BLAKE	30	2850	    5
7782	    CLARK	10	2450    	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521    	WARD	    30	1250	    10
7654	MARTIN	30	1250	    10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	    13
7369	SMITH	20	800	    14
*/

SELECT EMPNO "紫据腰硲", ENAME "紫据誤", DEPTNO "採辞獄硲", SAL "厭食"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "採辞鎧厭食授是"
     , RANK() OVER(ORDER BY SAL DESC) "穿端厭食授是"
FROM EMP;
--==>>
/*
7839	KING    	10	5000	1	1
7902    	FORD    	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	    3	4
7698	BLAKE	30	2850	    1	5
7782	    CLARK	10	2450    	2	6
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7934	MILLER	10	1300	3	9
7521    	WARD	    30	1250	    4	10
7654	MARTIN	30	1250    	4	10
7876	ADAMS	20	1100	4	12
7900	JAMES	30	950	    6	13
7369	SMITH	20	800	    5	14
*/

SELECT EMPNO "紫据腰硲", ENAME "紫据誤", DEPTNO "採辞獄硲", SAL "厭食"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "採辞鎧厭食授是"
     , RANK() OVER(ORDER BY SAL DESC) "穿端厭食授是"
FROM EMP
ORDER BY 3, 4 DESC;
--==>>
/*
7839	KING    	10	5000	1	1
7782	    CLARK	10	2450	    2	6
7934	MILLER	10	1300	3	9
7902	    FORD	    20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	    3	4
7876	ADAMS	20	1100	4	12
7369	SMITH	20	800	    5	14
7698	BLAKE	30	2850	    1	5
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7654	MARTIN	30	1250    	4	10
7521    	WARD	    30	1250    	4	10
7900	JAMES	30	950	    6	13
*/


--】 DENSE_RANK() ≧ 辞伸聖 鋼発馬澗 敗呪
SELECT EMPNO "紫据腰硲", ENAME "紫据誤", DEPTNO "採辞獄硲", SAL "厭食"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "採辞鎧厭食辞伸"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "穿端厭食辞伸"
FROM EMP
ORDER BY 3, 4 DESC;
--==>>
/*
7839	KING	    10	5000	1	1
7782	    CLARK	10	2450    	2	5
7934	MILLER	10	1300	3	8
7902	    FORD	    20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975    	2	3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	    4	12
7698	BLAKE	30	2850	    1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	    4	9
7521	    WARD	    30	1250	    4	9
7900	JAMES	30	950	    5	11
*/

, RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "採辞鎧厭食授是"
     , RANK() OVER(ORDER BY SAL DESC) "穿端厭食授是"

--】 EMP 砺戚鷺税 紫据 舛左研
-- 紫据誤, 採辞腰硲, 尻裟, 採辞鎧 尻裟授是, 穿端 尻裟授是 牌鯉生稽 繕噺廃陥.
SELECT ENAME "紫据誤", SAL "厭食", COMM "朕耕芝", DEPTNO "採辞腰硲", (SAL*12+NVL(COMM, 0)) "尻裟"
FROM EMP;

--尻裟 : 厭食*12 + COMM
-- (SAL*12+NVL(COMM, 0))

--鎧亜 熱醸揮 号狛
SELECT ENAME "紫据誤", DEPTNO "採辞腰硲", SAL*12+NVL(COMM, 0) "尻裟"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM, 0)) DESC) "採辞鎧厭食授是"
     , RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC) "穿端 尻裟授是"
FROM EMP
ORDER BY 2, 3 DESC;
--==>>
/*
KING	    10	60000	1	1
CLARK	10	29400	2	6
MILLER	10	15600	3	10
FORD	    20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
WARD	    30	15500	5	11
JAMES	30	11400	6	13
*/


--識持還戚 熱嬢爽重 号狛
SELECT T.*
     , RANK() OVER(PARTITION BY T.採辞腰硲 ORDER BY T.尻裟 DESC) "採辞鎧尻裟授是"
     , RANK() OVER(ORDER BY T.尻裟 DESC) "穿端 尻裟授是"
FROM
(
    SELECT ENAME "紫据誤", DEPTNO "採辞腰硲"
         , SAL*12+NVL(COMM, 0) "尻裟"
    FROM EMP
)T
ORDER BY 2, 3 DESC;
--==>>
/*
KING	    10	60000	1	1
CLARK	10	29400	2	6
MILLER	10	15600	3	10
FORD    	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
WARD    	30	15500	5	11
JAMES	30	11400	6	13
*/

--】 EMP 砺戚鷺拭辞 穿端 尻裟 授是亜 1去採斗 5去猿走幻
-- 紫据誤, 採辞腰硲, 尻裟, 穿端尻裟授是 牌鯉生稽 繕噺廃陥.
SELECT *
FROM EMP;

--号狛 1
SELECT ENAME "紫据誤", DEPTNO "採辞腰硲", SAL*12+NVL(COMM, 0) "尻裟"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0)) "穿端尻裟授是"
FROM EMP
WHERE ;


--号狛 2
SELECT T.*
FROM
(
    SELECT ENAME "紫据誤", DEPTNO "採辞腰硲", SAL*12+NVL(COMM, 0) "尻裟"
    , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "穿端尻裟授是"
    FROM EMP
)T
WHERE T.穿端尻裟授是 <= '5';
--==>>
/*
KING    	10	60000	1
SCOTT	20	36000	2
FORD    	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--識持還 祢澗 号狛
SELECT ENAME "紫据誤", DEPTNO "採辞腰硲", SAL*12+NVL(COMM, 0) "尻裟"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "穿端尻裟授是"
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) <= 5;
--==>> 拭君 降持
/*
RA-30483: window  functions are not allowed here
30483. 00000 -  "window  functions are not allowed here"
*Cause:    Window functions are allowed only in the SELECT list of a query.
           And, window function cannot be an argument to another window or group
           function.
*Action:
695楳, 37伸拭辞 神嫌 降持
*/

--『 是税 鎧遂精 RANK() OVER() 敗呪研 WHERE 繕闇箭拭辞 紫遂廃 井酔戚悟
--   戚 敗呪澗 WHERE 繕闇箭拭辞 紫遂拝 呪 蒸奄 凶庚拭 降持馬澗 拭君戚陥.
--   戚 井酔, 酔軒澗 INLINE VIEW 研 醗遂馬食 熱戚背醤 廃陥.
--   辞崎汀軒 照床檎 背衣 公馬澗 庚薦績..
SELECT T.*
FROM
(
    SELECT ENAME "紫据誤", DEPTNO "採辞腰硲", SAL*12+NVL(COMM, 0) "尻裟"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "穿端尻裟授是"
    FROM EMP
)T
WHERE T.穿端尻裟授是 <=5;
--==>>
/*
KING	    10	60000	1
SCOTT	20	36000	2
FORD	    20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--】 EMP 砺戚鷺拭辞 唖 採辞紺稽 尻裟 去呪亜 1去採斗 2去猿走幻 繕噺廃陥.
--   紫据腰硲, 紫据誤, 採辞腰硲, 尻裟, 採辞鎧尻裟去呪, 穿端尻裟去呪
SELECT *
FROM EMP;

         
SELECT T.*
FROM
(
    SELECT EMPNO "紫据腰硲", ENAME "紫据誤", DEPTNO "採辞腰硲"
         , SAL*12+NVL(COMM, 0) "尻裟"
         , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM, 0) DESC) "採辞鎧尻裟授是"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "穿端 尻裟授是"
    FROM EMP
)T
WHERE T.採辞鎧尻裟授是 <=2;
--==>>
/*
7839	KING	    10	60000	1	1
7782	    CLARK	10	29400	2	6
7902	    FORD	    20	36000	1	2
7788	SCOTT	20	36000	1	2
7698	BLAKE	30	34200	1	5
7499	ALLEN	30	19500	2	7
*/


SELECT EMAPNO "紫据腰硲", ENAME "紫据誤", DEPTNO "採辞腰硲"
     , SAL*12+NVL(COMM, 0) "尻裟"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM, 0) DESC) "採辞鎧尻裟授是"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "穿端 尻裟授是"
FROM EMP
WHERE RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM, 0) DESC) <=2;


--＝＝＝ 益血 敗呪 ＝＝＝--

-- SUM() 杯, AVG() 汝液, COUNT() 朝錘闘, MAX() 置企葵, MIN() 置社葵
-- , VARIANCE() 歳至, STDDEV() 妊層畷託

--『 益血 敗呪税 亜舌 笛 働臓精
--   坦軒背醤 拝 汽戚斗級 掻 NULL戚 糎仙馬檎
--   戚 NULL精 薦須馬壱 尻至聖 呪楳廃陥澗 依戚陥.


-- SUM() 
-- EMP 砺戚鷺聖 企雌生稽 穿端 紫据級税 厭食 恥杯聖 繕噺廃陥.
SELECT SUM(SAL) -- 800 + 1600 + 1250 + ... + 1300
FROM EMP;
--==>> 29025

SELECT SUM(COMM) -- 300 + 500 + 1400 + 0
FROM EMP;
--==>> 2200


-- COUNT()
-- 楳税 鯵呪 繕噺馬食 衣引葵 鋼発
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)
FROM EMP;
--==>> 4

SELECT COUNT(*)
FROM EMP;
--==>> 14


-- AVG()
-- 汝液 鋼発
SELECT SUM(SAL) / COUNT(SAL) "1", AVG(SAL) "2"
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
2073.214285714285714285714285714285714286
*/

SELECT AVG(COMM)
FROM EMP;
--==>> 550 ≧ 送据級税 呪雁 汝液

SELECT SUM(COMM) / COUNT(COMM)
FROM EMP;
--==>> 550

SELECT SUM(COMM) / COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--『 妊層畷託税 薦咽戚 歳至
--   歳至税 薦咽悦戚 妊層畷託
SELECT AVG(SAL), VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
1398313.87362637362637362637362637362637	
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL), 2), VARIANCE(SAL)
FROM EMP;
--薦咽
--==>>
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

--歳至 薦咽悦
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL)
FROM EMP;
--==>>
/* 妊層畷託
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/


-- MAX() / MIN()
-- 置企葵 / 置社葵 鋼発
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--==>> 5000 800


--『 爽税
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 拭君 降持
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
860楳, 8伸拭辞 神嫌 降持
*/
-- 陥掻 坪球 旭戚 繕噺馬檎 拭君 降持敗

SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> 拭君 降持
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
860楳, 8伸拭辞 神嫌 降持
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--採辞腰硲 奄層生稽 広製坦軒
--==>>
/*
10	8750
20	10875
30	9400
*/

SELECT DEPTNO "採辞腰硲", SUM(SAL) "厭食杯"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
(null)	29025(恥杯)
*/

SELECT *
FROM TBL_EMP;

--】 汽戚斗 脊径
INSERT INTO TBL_EMP VALUES
(8001, '呪走', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 楳 戚(亜) 諮脊鞠醸柔艦陥.

INSERT INTO TBL_EMP VALUES
(8002, '焼戚政', 'CLERK', 7566, SYSDATE, 1000, 0, NULL);
--==>> 1 楳 戚(亜) 諮脊鞠醸柔艦陥.

INSERT INTO TBL_EMP VALUES
(8003, '舛政耕', 'SALESMAN', 7698, SYSDATE, 2000, NULL, NULL);
--==>> 1 楳 戚(亜) 諮脊鞠醸柔艦陥.

INSERT INTO TBL_EMP VALUES
(8004, '戚薦汎', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 楳 戚(亜) 諮脊鞠醸柔艦陥.

INSERT INTO TBL_EMP VALUES
(8005, '廃走肯', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 楳 戚(亜) 諮脊鞠醸柔艦陥.

--溌昔
SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	    1980-12-17	800		20
7499	ALLEN	SALESMAN	    7698	1981-02-20	1600	300	    30
7521    	WARD	    SALESMAN	    7698	1981-02-22	1250	    500	    30
7566	JONES	MANAGER	    7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	    7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		30
7782    	CLARK	MANAGER	    7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING    	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	    7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03	950		30
7902    	FORD    	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	    1982-01-23	1300		    10
8001	呪走  	CLERK	    7566	2021-03-30	1500	10	
8002	    焼戚政	CLERK	    7566	2021-03-30	1000	0	
8003	舛政耕	SALESMAN	    7698	2021-03-30	2000		
8004	戚薦汎	SALESMAN	    7698	2021-03-30	2500		
8005	廃走肯	SALESMAN	    7698	2021-03-30	1000		
*/


--朕行
COMMIT;

SELECT DEPTNO "採辞腰硲", SUM(SAL) "厭食杯"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
(null)	8000       -- 採辞腰硲亜 NULL昔 汽戚斗級晦軒税 厭食 杯
(null)	37025      -- 乞窮 採辞税 厭食 杯
*/


--是拭辞 繕噺廃 鎧遂聖
--==>>
/*
採辞腰硲 厭食杯
------- -------
10	     8750
20	     10875
30	     9400
昔渡	 8000     
乞窮採辞	 37025    
*/
--鎧亜 熱醸揮 号狛
SELECT NVL(T.採辞腰硲, '乞窮採辞') "採辞腰硲" , SUM(T.厭食杯) "厭食杯"
FROM
(
    SELECT NVL(TO_CHAR(DEPTNO), '昔渡') "採辞腰硲", SUM(SAL) "厭食杯"
    FROM TBL_EMP
    GROUP BY DEPTNO
)T
GROUP BY ROLLUP(T.採辞腰硲);
--==>>
/*
10	        8750
20	        10875
30	        9400
昔渡	    8000
乞窮採辞	    37025
*/



--識持還戚 熱嬢爽重 号狛
-- 【 号狛1
SELECT CASE DEPTNO WHEN NULL THEN '昔渡'
                   ELSE DEPTNO
       END "採辞腰硲"
FROM TBL_EMP;
--==>> 拭君 降持
/*
ORA-00932: inconsistent datatypes: expected CHAR got NUMBER
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:
996楳, 29伸拭辞 神嫌 降持
*/

SELECT CASE DEPTNO WHEN NULL THEN '昔渡'
                   ELSE TO_CHAR(DEPTNO)
       END "採辞腰硲"
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
(null)
(null)
(null)
(null)
(null)
*/

SELECT CASE WHEN DEPTNO IS NULL THEN '昔渡'
            ELSE TO_CHAR(DEPTNO)
       END "採辞腰硲"
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
昔渡
昔渡
昔渡
昔渡
昔渡
*/

SELECT CASE WHEN DEPTNO IS NULL THEN '昔渡'
            ELSE TO_CHAR(DEPTNO)
       END "採辞腰硲"
     , SUM(SAL) "厭食杯"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
昔渡	    8000
昔渡	    37025
*/
--> GROUP BY亜 SELECT左陥 希 胡煽 坦軒掬辞 NULL葵戚 陥 昔渡生稽 郊会

-- 【 号狛2
SELECT NVL(DEPTNO, '昔渡') "採辞腰硲", SUM(SAL) "厭食杯"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> 拭君 降持
/* DEPTNO澗 収切展脊 '昔渡'精 庚切展脊戚虞 展脊 照限焼辞 拭君
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '昔渡') "採辞腰硲", SUM(SAL) "厭食杯"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
昔渡	    8000
昔渡  	37025
*/

--『 GROUPING()
SELECT DEPTNO "採辞腰硲", SUM(SAL) "厭食杯", GROUPING(DEPTNO) "益欠芭衣引"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);


SELECT CASE WHEN DEPTNO IS NULL AND GROUPING(DEPTNO) = 0 THEN '昔渡' 
            WHEN DEPTNO IS NULL AND GROUPING(DEPTNO) = 1 THEN '乞窮採辞'
            ELSE TO_CHAR(DEPTNO)
            END "採辞腰硲"
     , SUM(SAL) "厭食杯", GROUPING(DEPTNO) "益欠芭衣引"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);


/*
採辞腰硲 厭食杯
------- -------
10	     8750
20	     10875
30	     9400
昔渡	     8000     
乞窮採辞	 37025    
*/

SELECT NVL(T.採辞腰硲, '乞窮採辞') "採辞腰硲" , SUM(T.厭食杯) "厭食杯"
FROM
(
    SELECT NVL(TO_CHAR(DEPTNO), '昔渡') "採辞腰硲", SUM(SAL) "厭食杯"
    FROM TBL_EMP
    GROUP BY DEPTNO
)T
GROUP BY ROLLUP(T.採辞腰硲);




























