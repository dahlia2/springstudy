
-- 이름 변경 전 테이블, 시퀀스 삭제
-- DROP TABLE Q CASCADE CONSTRAINTS;
-- DROP TABLE A CASCADE CONSTRAINTS;
-- DROP TABLE ATTACH CASCADE CONSTRAINTS;
-- DROP TABLE OD CASCADE CONSTRAINTS;

-- DROP SEQUENCE Q_SEQ;
-- DROP SEQUENCE A_SEQ;
-- DROP SEQUENCE ATTACH_SEQ;
-- DROP SEQUENCE OD_SEQ;


DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE NOTICE_ATTACH CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE CANCEL CASCADE CONSTRAINTS;
DROP TABLE PAY CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;


DROP SEQUENCE NOTICE_ATTACH_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE PAY_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE USERS_SEQ;


CREATE SEQUENCE USERS_SEQ NOCACHE;
CREATE TABLE USERS (
    USER_NO                   NUMBER            NOT NULL,           -- 회원 번호
    USER_ID         	      VARCHAR2(20)      NOT NULL UNIQUE,    -- 회원 아이디
    USER_PW         	      VARCHAR2(20)      NOT NULL,           -- 비밀번호
    USER_NAME       	      VARCHAR2(20)      NOT NULL,           -- 이름       
    USER_TEL         	      VARCHAR2(20)      NOT NULL,           -- 휴대폰 번호 하이픈 제외(-) 후 저장
    USER_POST        	      VARCHAR2(7)       NOT NULL,           -- 우편 번호
    USER_ADDRESS     	      VARCHAR2(50)      NOT NULL,           -- 주소
    USER_ADDR_DETAIL 	      VARCHAR2(80)      NOT NULL,           -- 상세 주소
    USER_EMAIL       	      VARCHAR2(40)      NOT NULL,           -- 이메일
    USER_BIRTH       	      VARCHAR2(12)      NOT NULL,           -- 생년월일
    USER_GENDER      	      VARCHAR2(6)       NOT NULL,           -- 성별 M(남), F(여), NO(선택안함)
    USER_PW_MODIFIED_AT       DATE,                                 -- 비밀번호 변경일
    USER_AGREECODE            NUMBER         	NOT NULL,  	        -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    USER_STATE       	      NUMBER            NOT NULL,           -- 회원 상태(관리자:0, 회원:1, 비회원:2, 탈퇴회원:3)
    USER_JOINED_AT            DATE              NOT NULL,           -- 등록일자
    USER_AUTOLOGIN_ID         VARCHAR2(32),                         -- 자동로그인할 때 사용하는 ID(SESSION_ID를 사용함)
    USER_AUTOLOGIN_EXPIRED_AT DATE,                                 -- 자동로그인 만료일
    CONSTRAINT PK_USERS PRIMARY KEY(USER_NO)
);

CREATE SEQUENCE PRODUCT_SEQ NOCACHE;
CREATE TABLE PRODUCT (
    PROD_NO             NUMBER                NOT NULL,             -- 상품 번호
    PROD_NAME           VARCHAR2(60)          NOT NULL,             -- 상품명(KR)          
    PROD_NAME_ENG       VARCHAR2(60)          NOT NULL,             -- 상품명(ENG)
    PROD_PRICE          NUMBER                NOT NULL,             -- 가격
    PROD_CONTENT        CLOB                  NOT NULL,             -- 상품 설명
    PROD_IMG_WINE       VARCHAR2(100)         NOT NULL,             -- 와인 이미지
    PROD_IMG_CONTENT    CLOB                  NOT NULL,             -- 내용 이미지
    PROD_TYPE           VARCHAR2(20)          NOT NULL,             -- 종류 (RED, WHITE, SPARKLING, ROZE)
    PROD_NATION         VARCHAR2(100)         NOT NULL,             -- 제조 국가
    PROD_BODY           VARCHAR2(30)          NOT NULL,             -- 바디
    PROD_ALCOHOL        VARCHAR2(30)          NOT NULL,             -- 알코올
    PROD_DATE           DATE                  NOT NULL,             -- 등록일
    PROD_STOCK          NUMBER                NOT NULL,             -- 재고
    CONSTRAINT PK_PRODUCT PRIMARY KEY(PROD_NO)
);

CREATE SEQUENCE CART_SEQ NOCACHE;
CREATE TABLE CART (
    CART_NO             NUMBER             NOT NULL,       -- 상품 PK
    QUANTITY            NUMBER             NOT NULL,       -- 주문수량 
    USER_NO             NUMBER             NOT NULL,       -- 유저 고유번호 FK
    PROD_NO             NUMBER             NOT NULL,       -- 상품 고유번호 FK
    CONSTRAINT PK_CART PRIMARY KEY(CART_NO),
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO),
    CONSTRAINT FK_CART_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO)
);
    
CREATE SEQUENCE ORDERS_SEQ NOCACHE;
CREATE TABLE ORDERS (
    ORDER_NO                NUMBER           NOT NULL,     -- 주문 번호
    ORDER_DATE              DATE             NOT NULL,     -- 주문 일자
    RECEIVER_NAME           VARCHAR2(15)     NULL,         -- 수령자명
    RECEIVER_TEL            VARCHAR2(11)     NOT NULL,     -- 수령자 연락처
    RECEIVER_ADDRESS        VARCHAR2(50)     NULL,         -- 도로명 주소
    RECEIVER_JIBUN_ADDRESS  VARCHAR2(50)     NULL,         -- 지번 주소
    RECEIVER_DETAIL_ADDRESS VARCHAR2(80)     NULL,         -- 상세 주소
    ORDER_REQUEST           CLOB             NULL,         -- 요청사항
    CART_NO                 NUMBER           NOT NULL,     -- 장바구니 번호
    PROD_NO                 NUMBER           NOT NULL,     -- 상품 번호
    USER_NO                 NUMBER           NOT NULL,     -- 회원 번호
    CONSTRAINT PK_ORDERS PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_ORDERS_CART FOREIGN KEY(CART_NO) REFERENCES CART(CART_NO) ON DELETE CASCADE,
    CONSTRAINT FK_ORDERS_PRODUCT FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE CASCADE,
    CONSTRAINT FK_ORDERS_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE ORDER_DETAIL_SEQ NOCACHE;
CREATE TABLE ORDER_DETAIL (
    ORDER_DETAIL_ID             NUMBER             NOT NULL,                    -- 주문 내역 번호
    PROD_NO                     NUMBER             NOT NULL,                    -- 상품 번호
    ORDER_NO                    NUMBER             NOT NULL,                    -- 주문 번호
    USER_NO                     NUMBER             NOT NULL,                    -- 회원 번호
    QUANTITY                    NUMBER             NULL,                        -- 주문 수량
    ORDER_DETAIL_PRICE          NUMBER             NULL,                        -- 주문 금액
    CONSTRAINT PK_ORDER_DETAIL PRIMARY KEY(ORDER_DETAIL_ID),
    CONSTRAINT FK_ORDER_DETAIL_PRODUCT FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE CASCADE,
    CONSTRAINT FK_ORDER_DETAIL_ORDERS FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE REVIEW_SEQ NOCACHE;
CREATE TABLE REVIEW (
    REVIEW_NO       NUMBER          NOT NULL,   -- 리뷰 번호
    REVIEW_TITLE    VARCHAR2(50)    NOT NULL,   -- 리뷰 제목
    REVIEW_CONTENT  CLOB            NOT NULL,   -- 리뷰 내용
    REVIEW_GRADE    NUMBER          NOT NULL,   -- 리뷰 평점 (1~5는 jsp에서 작업하세요 알아서 ㅋ)
    ORDER_NO        NUMBER          NOT NULL,   -- 주문 번호
    USER_NO         NUMBER          NOT NULL,   -- 회원 번호
    PROD_NO         NUMBER          NOT NULL,   -- 상품 번호
    CONSTRAINT PK_REVIEW PRIMARY KEY(REVIEW_NO),
    CONSTRAINT FK_REVIEW_ORDERS FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_PRODUCT FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE CASCADE
);

CREATE SEQUENCE REVIEW_ATTACH_SEQ NOCACHE;
CREATE TABLE REVIEW_ATTACH (
    R_ATTACH_NO       NUMBER              NOT NULL,    -- 첨부파일 번호(PK)
    R_PATH            CLOB                NOT NULL,    -- 첨부 파일 경로
    R_ORIGIN_NAME     CLOB                NOT NULL,    -- 기존 파일명
    R_FILESYSTEM_NAME VARCHAR2(50)        NOT NULL,    -- 첨부 파일명
    R_DOWNLOAD_COUNT  NUMBER                  NULL,    -- 다운로드 횟수
    R_HAS_THUMBNAIL   NUMBER                  NULL,    -- 썸네일 유무(썸네일이 있으면 1, 없으면 0) 
    REVIEW_NO         NUMBER              NOT NULL,    -- 리뷰 번호  
    CONSTRAINT FK_REVIEW_ATTACH_REVIEW FOREIGN KEY(REVIEW_NO) REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE
);

CREATE SEQUENCE NOTICE_SEQ NOCACHE;
CREATE TABLE NOTICE (
    NOTICE_NO      NUMBER           NOT NULL,             -- 공지 번호		
    NOTICE_TITLE   VARCHAR2(50)     NOT NULL,             -- 제목			
    NOTICE_CONTENT CLOB             NOT NULL,             -- 내용
    NOTICE_IMG     VARCHAR2(30)     NOT NULL,             -- 공지글 이미지
    NOTICE_C_AT    DATE             NOT NULL,             -- 공지 등록일
    NOTICE_FIELD   NUMBER           NOT NULL,             -- 공지글 카테고리(공지:0, 이벤트:1, 자주묻는질문:2)	
    USER_NO        NUMBER           NOT NULL,             -- 회원 번호
    CONSTRAINT PK_NOTICE PRIMARY KEY(NOTICE_NO),
    CONSTRAINT FK_NOTICE_USERS FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO)
);

CREATE SEQUENCE QNA_SEQ NOCACHE;
CREATE TABLE QNA (
    QNA_NO          NUMBER         NOT NULL,               -- 문의글 번호 
    USER_NO         NUMBER         NOT NULL,               -- 회원 번호		
    QNA_TITLE       VARCHAR(60)    NOT NULL,               -- 글 제목
    QNA_REGDATE     DATE           NOT NULL,               -- 등록일
    QNA_GUBUN       VARCHAR2(10)   NOT NULL,               -- 카테고리
    QNA_CONTENT     CLOB           NOT NULL,               -- 글 내용
    CONSTRAINT PK_QNA PRIMARY KEY(QNA_NO),
    CONSTRAINT FK_QNA_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE NOTICE_ATTACH_SEQ NOCACHE;
CREATE TABLE NOTICE_ATTACH (
    N_ATTACH_NO       NUMBER              NOT NULL,    -- 첨부파일번호(PK)
    N_PATH            CLOB                NOT NULL,    -- 첨부 파일 경로
    N_ORIGIN_NAME     CLOB                NOT NULL,    -- 기존 파일명
    N_FILESYSTEM_NAME VARCHAR2(50)        NOT NULL,    -- 저장 파일명 
    N_DOWNLOAD_COUNT  NUMBER,                          -- 다운로드 횟수
    N_HAS_THUMBNAIL   NUMBER,                          -- 썸네일 유무(썸네일이 있으면 1, 없으면 0)  
    NOTICE_NO         NUMBER              NOT NULL,    -- 공지 번호
    CONSTRAINT FK_NOTICE_ATTACH_NOTICE FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE
);
