-- 시퀀스 삭제   
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE USERS_SEQ;
DROP SEQUENCE SLEEP_USERS_SEQ;
DROP SEQUENCE LEAVE_USERS_SEQ;
DROP SEQUENCE ORDER_LIST_SEQ;
DROP SEQUENCE ACCESS_USERS_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE NOTICE_ATTACH_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE COUPON_SEQ;
DROP SEQUENCE REVIEW_ATTACH_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE PROD_SEQ; 

-- 테이블 삭제   
DROP TABLE QNA;
DROP TABLE NOTICE_ATTACH;
DROP TABLE NOTICE;
DROP TABLE LIKES;
DROP TABLE REVIEW_ATTACH;
DROP TABLE REVIEW;
DROP TABLE ORDER_LIST;
DROP TABLE ORDER_DETAIL;
DROP TABLE ORDERS;
DROP TABLE CART;
DROP TABLE USER_COUPON;
DROP TABLE COUPON;
DROP TABLE ACCESS_USERS;
DROP TABLE LEAVE_USERS;
DROP TABLE SLEEP_USERS;
DROP TABLE USERS;
DROP TABLE PRODUCT;

-- 시퀀스 생성   
CREATE SEQUENCE ORDERS_SEQ NOCACHE;
CREATE SEQUENCE ORDER_DETAIL_SEQ NOCACHE;
CREATE SEQUENCE CART_SEQ NOCACHE;
CREATE SEQUENCE USERS_SEQ NOCACHE;
CREATE SEQUENCE SLEEP_USERS_SEQ NOCACHE;
CREATE SEQUENCE LEAVE_USERS_SEQ NOCACHE;
CREATE SEQUENCE ORDER_LIST_SEQ NOCACHE;
CREATE SEQUENCE ACCESS_USERS_SEQ NOCACHE;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;
CREATE SEQUENCE NOTICE_ATTACH_SEQ NOCACHE;
CREATE SEQUENCE QNA_SEQ NOCACHE;
CREATE SEQUENCE COUPON_SEQ NOCACHE;
CREATE SEQUENCE REVIEW_ATTACH_SEQ NOCACHE;
CREATE SEQUENCE PROD_SEQ NOCACHE;
CREATE SEQUENCE REVIEW_SEQ NOCACHE;

-- 상품 
CREATE TABLE PRODUCT (
    PROD_NO        NUMBER NOT NULL,
    PROD_NAME      VARCHAR2(60)  NOT NULL,      -- 품번
    PROD_NAME_ENG  VARCHAR2(60)  NOT NULL,      -- 품명(KR)
    PROD_PRICE     NUMBER        NOT NULL,      -- 품명(EN)
    PROD_CONTENT   CLOB          NOT NULL,      -- 가격
    PROD_THUMBNAIL VARCHAR2(100) NOT NULL,      -- 상세설명
    PROD_IMG       CLOB          NOT NULL,      -- 썸네일
    PROD_TYPE      VARCHAR2(20)  NOT NULL,      -- 이미지
    PROD_NATION    VARCHAR2(100) NOT NULL,      -- 종류
    PROD_BODY      VARCHAR2(30)  NOT NULL,      -- 원산지
    PROD_ALCOHOL   VARCHAR2(30)  NOT NULL,      -- 바디감
    PROD_DATE      DATE          NOT NULL,      -- 도수
    PROD_STOCK     NUMBER        NOT NULL,      -- 재고
    CONSTRAINT PK_PRODUCT PRIMARY KEY(PROD_NO)
);

INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '유 원 프리미티보', 'U-ONE PRIMITIVO', 250000, 'Alberello 농법을 사용하여 만두리아만의 독특한 떼루아를 느낄 수 있는 와인', 'https://www.winenara.com/uploads/product/550/1870_detail_069.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/211130/u1_182129.png', 'RED', '이탈리아', '무거움', '높음', '2023-04-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '샤또 루빈 라이온 앤 드래곤', 'CHATEAU ROUBINE LION AND DRAGON', 45000, 'Wine Enthusiast에 25년간 와인 AND 푸드 관련 글을 기고해온 로저 보스 (Roger Voss)가 고득점을 준 루빈의 오가닉 로제 와인.', 'https://www.winenara.com/uploads/product/550/3e516b689bdfa0bfb560b2475dc6e3ce.png', 'https://www.winenara.com/uploads/editor/20221220112525315173565.png', 'ROZE', '프랑스', '중간', '중간', '2023-03-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '산 필리포 브루넬로', 'SAN FILIPPO BRUNELLO', 199000, '2017 빈티지, 2020 James Suckling 선정 Italia Top 100-30위', 'https://www.winenara.com/uploads/product/550/7405a2f09e4139796f8d2ca15dc759a7.png', 'https://www.winenara.com/uploads/editor/202207181034292052658501.png', 'RED', '이탈리아', '무거움', '높음', '2023-02-15', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '오이스터 베이', 'OYSTER BAY', 75000, '뉴질랜드 말보로 소비뇽 블랑의 명성을 전 세계 최초로 알린 오이스터 베이가 만들어 낸 스파클링 뀌베', 'https://www.winenara.com/uploads/product/550/3085_detail_036.png', 'https://www.winenara.com/uploads/editor/20220714180842635456417.png', 'WHITE', '뉴질랜드', '중간', '낮음', '2023-03-03', 15);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '보리우 빈야드 캘리포니아', 'BV CALIFORNIA', 30000, '100년이 넘는 전통과 나파의 기준이라 불리우는 BV에서 생산하는 BEST VALUE 캘리포니아 와인', 'https://www.winenara.com/uploads/product/550/d6274c5c0c58ec4aa67fd2fa489c8c42.png', 'https://www.winenara.com/uploads/editor/202211041319161578369648.png', 'RED', '미국', '중간', '중간', '2022-11-28', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '에스쿠도로호', 'ESCUDO ROJO', 120000, '우아한 구조감과 깊은 탄닌, 베리의 와일드함과 동양적 스파이스가 함께 느껴진 칠레 최상급 와인', 'https://www.winenara.com/uploads/product/550/1870_detail_069.png', 'https://www.winenara.com/uploads/editor/20230216131750693848876.png', 'RED', '칠레', '무거움', '높음', '2023-05-01', 21);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '테 와레 라', 'TWR SAUVIGNON', 30000, '2020 JAMES SUCKLING - 10 TOP VALUE NEW ZEALAND SAUVIGNON BLANC WINES', 'https://www.winenara.com/uploads/product/550/63d5da2235048aeabd506a5c986c044d.png', 'https://www.winenara.com/uploads/editor/202209191422131490385666.png', 'WHITE', '뉴질랜드', '중간', '중간', '2023-01-02', 40);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '인비보 X 사라', 'INVIVO X SJP', 27000, '로제의 성지 프로방스와 남프랑스에서 생산된 로제와인으로 트렌디한 와인 문화를 이끌어갈 SJP의 선택', 'https://www.winenara.com/uploads/product/550/554b644c1bf51870d601542137df2071.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/220224/582_102209.png', 'ROZE', '프랑스', '가벼움', '중간', '2023-04-30', 9);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '디오라 로제', 'DIORA ROSE', 35000, '미국 TOP10 와이너리, Delicato Family wines에서 생산하는 프리미엄 캘리포니아 와인', 'https://www.winenara.com/uploads/product/550/520ed5bf54d44cd1c11717d9f4ef39ef.png', 'https://www.winenara.com/uploads/editor/20220713152718156458879.png', 'ROZE', '미국', '가벼움', '중간', '2023-01-01', 82);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '라 샤펠 고르돈느', 'LA CHAPELLE GORDONNE', 55000, '세계적 로제 열풍 속에서 Decanter가 선정한 로제 와인 Top 3', 'https://www.winenara.com/uploads/product/550/e8e4325ade849d3271bb7f8fee84d8ce.png', 'https://www.winenara.com/uploads/editor/20221018111500530987690.png', 'ROZE', '프랑스', '중간', '높음', '2023-05-10', 32);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '아라스 이제이 카', 'ARRAS E.J.CARR', 229000, '2021 James Halliday Wine Companion Awards Winner : Best Sparkling Wine', 'https://www.winenara.com/uploads/product/550/f4365619a9cbdf8484cf82477362961a.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/210610/210609EJCARLATE_pdp_101923.png', 'SPARKLING', '이탈리아', '무거움', '높음', '2023-04-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '리스보카 화이트', 'LISBOCA WHITE', 8900, '포르투갈 토착품종으로 빚은 포르투갈 현지의 매력', 'https://www.winenara.com/uploads/product/550/231ad864b52890eb3d467925bc032415.png', 'https://www.winenara.com/uploads/editor/202207151413402082447247.png', 'WHITE', '프루투칼', '중간', '중간', '2021-02-04', 13);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '르 쁘띠 에뚜알', 'LE PETIT ETOILE', 17900, '르 쁘띠 에뚜알은 작은 별 이라는 뜻으로, 이 무알콜 와인의 작고 섬세한 버블을 연상케 한다.', 'https://www.winenara.com/uploads/product/550/b85aad9e531010c9921cb0b6982fb30f.png', 'https://www.winenara.com/uploads/editor/20230508095515295704458.png', 'SPARKLING', '프랑스', '중간', '낮음', '2022-07-29', 67);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '블랙타워 스파클링', 'BLACK TOWER SPARKKLING', 19900, '독일 NO.1 브랜드, 블랙타워가 만든 가성비 甲 로제 와인. 혼술, 홈술하기에 적당한 가격과 높은 퀄리티.', 'https://www.winenara.com/uploads/product/550/12c7b362572d31a4fc3a5ae7fd89389d.png', 'https://www.winenara.com/uploads/editor/20230125142904253619290.png', 'ROZE', '독일', '가벼움', '낮음', '2021-01-02', 65);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '쥬세페 베르디', 'CECI GIUSEPPE VERDI', 13900, '입 안 가득 느껴지는 부드러운 기포와 풍부한 과일풍미, 뒤이어 느껴지는 약간의 과일 잔당과 균형 잡힌 산미의 밸런스가 인상적인 와인', 'https://www.winenara.com/uploads/product/550/34a1b2f14bc4e4c89a26e5254e46fe9d.png', 'https://www.winenara.com/uploads/editor/20221021164152792430140.png', 'SPARKLING', '이탈리아', '중간', '낮음', '2023-06-30', 120);

COMMIT;

-- 회원테이블
CREATE TABLE USERS (
    USER_NO              NUMBER             NOT NULL,           -- 회원 번호
    USER_ID             VARCHAR2(20 BYTE)   NOT NULL UNIQUE,    -- 회원 아이디
    USER_PW             VARCHAR2(20 BYTE)   NOT NULL,            -- 비밀번호
    USER_NAME           VARCHAR2(20 BYTE),                      -- 이름       
    USER_TEL             VARCHAR2(20 BYTE),                     -- 휴대폰 번호 하이픈 제외(-) 후 저장
    USER_POST            VARCHAR2(7 BYTE),                      -- 우편 번호
    USER_ADDRESS         VARCHAR2(50 BYTE),                     -- 주소
    USER_ADDR_DETAIL     VARCHAR2(80 BYTE),                     -- 상세 주소
    USER_EMAIL           VARCHAR2(40 BYTE)  NOT NULL,           -- 이메일
    USER_BIRTH           VARCHAR2(12 BYTE),                     -- 생년월일
    USER_GENDER          VARCHAR2(6 BYTE),                      -- 성별 M(남), F(여), NO(선택안함)
    USER_PW_MODIFIED_AT  DATE,                                  -- 비밀번호 변경일
    USER_AGREECODE       NUMBER             NOT NULL,           -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    USER_STATE           NUMBER(1),                             -- 회원 상태(관리자:0, 회원:1, 비회원:2, 탈퇴회원:3)
    USER_JOINED_AT       DATE,                                  -- 등록일자
    USER_AUTOLOGIN_ID    VARCHAR2(32 BYTE),                     -- 자동로그인할 때 사용하는 ID(SESSION_ID를 사용함)
    USER_AUTOLOGIN_EXPIRED_AT DATE,                             -- 자동로그인 만료일
    CONSTRAINT PK_USERS PRIMARY KEY(USER_NO)
);

INSERT INTO USERS VALUES(USERS_SEQ.NEXTVAL, 'admin', '1111', '관리자', '01012345678', '24223', '와인시 소주구 맥주동', '알콜아파트 101동 111호', 'qwe123@naver.com', '90-12-31', 'F', SYSDATE, 0, 0, SYSDATE, NULL, NULL);
COMMIT;

-- 휴면회원
CREATE TABLE SLEEP_USERS (
    USER_NO              NUMBER              NOT NULL,           -- 회원 번호
    USER_ID              VARCHAR2(20 BYTE)   NOT NULL UNIQUE,    -- 회원 아이디
    USER_PW              VARCHAR2(20 BYTE)   NOT NULL,           -- 비밀번호
    USER_NAME            VARCHAR2(20 BYTE),                      -- 이름       
    USER_TEL             VARCHAR2(20 BYTE),                      -- 휴대폰 번호 하이픈 제외(-) 후 저장
    USER_POST            VARCHAR2(7 BYTE),                       -- 우편 번호
    USER_ADDRESS         VARCHAR2(50 BYTE),                      -- 주소
    USER_ADDR_DETAIL     VARCHAR2(80 BYTE),                      -- 상세 주소
    USER_EMAIL           VARCHAR2(40 BYTE)   NOT NULL,           -- 이메일
    USER_BIRTH           VARCHAR2(12 BYTE),                      -- 생년월일
    USER_GENDER          VARCHAR2(6 BYTE),                       -- 성별 M(남), F(여), NO(선택안함)
    USER_PW_MODIFIED_AT  DATE,                                   -- 비밀번호 변경일
    USER_AGREECODE       NUMBER              NOT NULL,           -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    USER_STATE           NUMBER(1),                              -- 회원 상태(관리자:0, 회원:1, 비회원:2, 탈퇴회원:3)
    USER_JOINED_AT       DATE,                                   -- 등록일자
    USER_SLEEP_AT        DATE                                    -- 휴면일
);

-- 탈퇴회원
CREATE TABLE LEAVE_USERS (
    USER_ID          VARCHAR2(40 BYTE)   NOT NULL UNIQUE,        -- 회원 아이디
    USER_EMAIL       VARCHAR2(100 BYTE)  NOT NULL UNIQUE,        -- 이메일
    USER_JOINED_AT   DATE,                                       -- 가입일
    USER_LEAVED_AT   DATE                                        -- 탈퇴일
);

-- 회원 접속 기록(회원마다 마지막 로그인 날짜 1개만 기록)
CREATE TABLE ACCESS_USERS (
    USER_ID             VARCHAR2(40 BYTE) NOT NULL UNIQUE,     -- 로그인한 사용자 ID
    LAST_LOGIN_AT       DATE,                                  -- 마지막 로그인 날짜
    CONSTRAINT FK_ACCESS_USERS FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE
);

-- 쿠폰(관리자)
CREATE TABLE COUPON (
    COUPON_NO         NUMBER              NOT NULL,       
    COUPON_NAME       VARCHAR2(20)        NOT NULL,    
    COUPON_DISCOUNT   NUMBER NOT NULL,    
    COUPON_STARTDATE  VARCHAR2(20)        NOT NULL,    
    COUPON_EXPIRED    VARCHAR2(20)        NOT NULL,
    CONSTRAINT PK_COUPON PRIMARY KEY(COUPON_NO)
);

-- 쿠폰(사용자)
CREATE TABLE USER_COUPON (
    USER_NO         NUMBER         NOT NULL,         
    COUPON_NO       NUMBER         NOT NULL,    
    COUPON_STATUS   NUMBER         NOT NULL,
    CONSTRAINT FK_USERS_COUPON_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO),
    CONSTRAINT FK_USERS_COUPON_COUPON FOREIGN KEY(COUPON_NO) REFERENCES COUPON(COUPON_NO)
);


-- 주문 테이블   
CREATE TABLE ORDERS (
    ORDER_NO                NUMBER  NOT NULL PRIMARY KEY,   -- 주문번호 
    USER_NO                 NUMBER  NOT NULL,               -- 회원번호 
    ORDER_DATE              DATE    NOT NULL,               -- 주문일  
    RECEIVER_NAME           VARCHAR2(15 BYTE),              -- 수령인 이름   
    RECEIVER_TEL            VARCHAR2(11 BYTE)   NOT NULL,   -- 수령인 연락처  
    RECEIVER_ADDRESS        VARCHAR2(50 BYTE),              -- 도로명 주소   
    RECEIVER_JIBUN_ADDRESS  VARCHAR2(50 BYTE),              -- 지번 주소    
    RECEIVER_DETAIL_ADDRESS VARCHAR2(80 BYTE),              -- 상세 주소    
    ORDER_REQUEST           CLOB,                           -- 요청사항 
    PAY_METHOD              VARCHAR2(20 BYTE),              -- 결제 방식    
    ORDER_AMOUNT            NUMBER,                         -- 주문 금액    
    PAY_NO                  VARCHAR2(50 BYTE),              -- 결제 번호(merchan uid)    
    PAY_SUCCESS             NUMBER,                         -- 결제 여부    
    ORDER_DISCOUNT          NUMBER,                         -- 할인 금액 
    
    CONSTRAINT FK_ORDERS_USERS FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO)
);


-- 장바구니 테이블 (장바구니에 담긴 상품)
CREATE TABLE CART (
    CART_NO     NUMBER  NOT NULL PRIMARY KEY,   -- 장바구니 번호 
    USER_NO     NUMBER  NOT NULL,               -- 회원 번호    
    PROD_NO     NUMBER  NOT NULL,               -- 상품 번호    
    QUANTITY    NUMBER  NOT NULL,               -- 주문 수량    
    
    CONSTRAINT FK_CART_USERS FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO),
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (PROD_NO) REFERENCES PRODUCT(PROD_NO)
    
);

-- 주문상세 테이블 (장바구니 목록)
CREATE TABLE ORDER_DETAIL (
    ORDER_DETAIL_NO     NUMBER  NOT NULL PRIMARY KEY,   -- 주문상세번호   
    ORDER_NO            NUMBER  NOT NULL,               -- 주문번호 
    PROD_NO             NUMBER  NOT NULL,               -- 상품번호 
    COUPON_NO           NUMBER  NOT NULL,               -- 쿠폰번호 
    QUANTITY            NUMBER  NOT NULL,               -- 주문수량 
    ORDER_AMOUNT        NUMBER  NOT NULL,               -- 주문 금액    
    ORDER_DISCOUNT      NUMBER,                         -- 할인 금액    
    
    CONSTRAINT FK_ORDER_DETAIL_ORDERS FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(ORDER_NO),
    CONSTRAINT FK_ORDER_DETAIL_PRODUCT FOREIGN KEY (PROD_NO) REFERENCES PRODUCT(PROD_NO),
    CONSTRAINT FK_ORDER_DETAIL_COUPON FOREIGN KEY (COUPON_NO) REFERENCES COUPON(COUPON_NO)
);

-- 주문내역
CREATE TABLE ORDER_LIST (
    ORDER_NO             NUMBER          NOT NULL,   -- 주문번호
    USER_NO                NUMBER        NOT NULL,   -- 회원번호
    ORDER_DATE             DATE          NOT NULL,   -- 주문일자
    RECEIVER_NAME         VARCHAR2(15),              -- 수령자명
    RECEIVER_TEL         VARCHAR2(11)    NOT NULL,   -- 수령자연락처
    RECEIVER_ADDRESS      VARCHAR2(50),              -- 도로명주소
    RECEIVER_JIBUN_ADDRESS   VARCHAR2(50),           -- 지번주소
    RECEIVER_DETAIL_ADDRESS   VARCHAR2(80),          -- 상세주소
    ORDER_REQUEST         CLOB,                      -- 요청사항
    PAY_METHOD             VARCHAR2(20),             -- 결제방식
    ORDER_AMOUNT         NUMBER,                     -- 주문금액
    ORDER_DISCOUNT          NUMBER,                  -- 할인금액
    CONSTRAINT FK_ORDER_LIST_ORDERS FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_ORDER_LIST_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);


-- 리뷰 
CREATE TABLE REVIEW (
    REVIEW_NO NUMBER NOT NULL,                  -- 리뷰번호
    USER_NO        NUMBER       NOT NULL,       -- 회원번호
    ORDER_NO       NUMBER       NOT NULL,       -- 주문번호
    COUPON_NO      NUMBER       NOT NULL,       -- 쿠폰번호
    REVIEW_TITLE   VARCHAR2(50) NOT NULL,       -- 리뷰제목
    REVIEW_CONTENT CLOB         NOT NULL,       -- 리뷰내용
    REVIEW_GRADE   NUMBER       NOT NULL,       -- 리뷰평점
    CONSTRAINT PK_REVIEW PRIMARY KEY(REVIEW_NO),
    CONSTRAINT FK_REVIEW_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO),
    CONSTRAINT FK_REVIEW_ORDERS FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO),
    CONSTRAINT FK_REVIEW_COUPON FOREIGN KEY(COUPON_NO) REFERENCES COUPON(COUPON_NO)
);


-- 리뷰 첨부 파일
CREATE TABLE REVIEW_ATTACH (
    REVIEW_ATTACH_NO    NUMBER NOT NULL PRIMARY KEY,
    REVIEW_NO           NUMBER NOT NULL,
    REVIEW_PATH         CLOB   NOT NULL,
    REVIEW_ORIGIN_NAME  CLOB   NOT NULL,
    REVIEW_FILESYSTEM_NAME  VARCHAR2(50 BYTE)   NOT NULL,
    REVIEW_DOWNLOAD_COUNT   NUMBER,
    REVIEW_HAS_THUMBNAIL    NUMBER,
    
    CONSTRAINT FK_REVIEW_ATTACH_REVIEW FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO)
);



-- 좋아요
CREATE TABLE LIKES (
    REVIEW_NO   NUMBER NOT NULL,
    USER_NO     NUMBER NOT NULL,
    COUPON_NO   NUMBER NOT NULL,
    
    CONSTRAINT FK_LIKES_REVIEW FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO),
    CONSTRAINT FK_LIKES_USERS FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO),
    CONSTRAINT FK_LIKES_COUPON FOREIGN KEY (COUPON_NO) REFERENCES COUPON(COUPON_NO)
);


-- 공지사항 
CREATE TABLE NOTICE (
    NOTICE_NO           NUMBER           NOT NULL,             -- 공지 번호      
    NOTICE_TITLE        VARCHAR2(50)     NOT NULL,             -- 제목         
    NOTICE_CONTENT      CLOB             NOT NULL,             -- 내용
    NOTICE_IMG          VARCHAR2(30)     NOT NULL,             -- 공지글 이미지
    NOTICE_CREATED_AT   DATE             NOT NULL,             -- 공지 등록일
    NOTICE_GUBUN        NUMBER           NOT NULL,             -- 공지글 카테고리(공지:0, 이벤트:1, 자주묻는질문:2)   
    CONSTRAINT PK_NOTICE PRIMARY KEY(NOTICE_NO)
);

-- 공지사항 첨부
CREATE TABLE NOTICE_ATTACH (
    N_ATTACH_NO       NUMBER              NOT NULL,    -- 첨부파일번호(PK)
    N_PATH            CLOB                NOT NULL,    -- 첨부 파일 경로
    N_ORIGIN_NAME     CLOB                NOT NULL,    -- 기존 파일명
    N_FILESYSTEM_NAME VARCHAR2(50)        NOT NULL,    -- 저장 파일명 
    N_DOWNLOAD_COUNT  NUMBER,                          -- 다운로드 횟수
    N_HAS_THUMBNAIL   NUMBER,                          -- 썸네일 유무(썸네일이 있으면 1, 없으면 0)  
    NOTICE_NO         NUMBER              NOT NULL,    -- 공지 번호
    CONSTRAINT PK_NOTICE_ATTACH PRIMARY KEY(N_ATTACH_NO),
    CONSTRAINT FK_NOTICE_ATTACH_NOTICE FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE
);

-- 문의게시판
CREATE TABLE QNA (
    QNA_NO          NUMBER         NOT NULL,               -- 문의글 번호 
    QNA_TITLE       VARCHAR(60)    NOT NULL,               -- 글 제목
    QNA_REGDATE     DATE           NOT NULL,               -- 등록일
    QNA_GUBUN       VARCHAR2(10)   NOT NULL,               -- 카테고리
    QNA_CONTENT     CLOB           NOT NULL,               -- 글 내용
    QNA_DEPTH       NUMBER         NOT NULL,               -- 1문의 1답변(문의 0, 답변 1)
    USER_NO         NUMBER         NOT NULL,               -- 회원 번호   
    CONSTRAINT PK_QNA PRIMARY KEY(QNA_NO),
    CONSTRAINT FK_QNA_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);

