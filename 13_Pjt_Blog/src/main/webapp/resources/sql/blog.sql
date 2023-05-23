DROP TABLE GOOD_T;
DROP TABLE COMMENT_T;
DROP TABLE SUMMERNOTE_IMAGE_T;
DROP TABLE BLOG_T;
DROP TABLE MEMBER_T;

-- 사용자
CREATE TABLE MEMBER_T (
    MEMBER_NO  NUMBER             NOT NULL,
    ID         VARCHAR2(30 BYTE)  NOT NULL   UNIQUE,
    PW         VARCHAR2(30 BYTE)  NOT NULL,
    NAME       VARCHAR2(30 BYTE) 
);

-- 하나의 게시글의 여러 첨부파일 : 일대다관계
-- 블로그
CREATE TABLE BLOG_T (
    BLOG_NO      NUMBER NOT NULL,
    TITLE        VARCHAR2(100 BYTE)  NOT NULL,
    CONTENT      CLOB,
    HIT          NUMBER              NOT NULL,
    CREATED_AT   DATE,
    MODIFIED_AT  DATE,
    MEMBER_NO    NUMBER    -- FK
);

-- 블로그 본문 작성 에디터 SUMMERNOTE에서 사용한 이미지의 목록
CREATE TABLE SUMMERNOTE_IMAGE_T (
    FILESYSTEM_NAME  VARCHAR2(50 BYTE),
    BLOG_NO          NUMBER      -- FK
);

-- 댓글 (1단 계층형, 대댓글 불가한 형태)
CREATE TABLE COMMENT_T (
    COMMENT_NO   NUMBER                NOT NULL,        
    CONTENT      VARCHAR2(4000 BYTE)   NOT NULL,
    STATE        NUMBER,        -- 정상 1, 삭제 -1 
    DEPTH        NUMBER,        -- 댓글 0, 댓글에 달린 댓글 1
    GROUP_NO     NUMBER,        -- 댓글과 댓글에 달린 댓글은 같은 그룹
    CREATED_AT   DATE,
    BLOG_NO      NUMBER,        -- FK
    MEMBER_NO    NUMBER         -- FK
);

-- 좋아요
CREATE TABLE GOOD_T (
    MEMBER_NO   NUMBER,  -- FK
    BLOG_NO     NUMBER,  -- FK
    MARKED_AT   DATE
);


-- 사용자 기본키
ALTER TABLE MEMBER_T
    ADD CONSTRAINT PK_MEMBER
        PRIMARY KEY(MEMBER_NO);
        
-- 블로그 기본키
ALTER TABLE BLOG_T
    ADD CONSTRAINT PK_BLOG
        PRIMARY KEY(BLOG_NO);
        
-- 댓글 기본키
ALTER TABLE COMMENT_T
    ADD CONSTRAINT PK_COMMENT
        PRIMARY KEY(COMMENT_NO);
        
        
-- 블로그 외래키 : 작성자가 삭제되면 블로그도 함께 삭제된다.
ALTER TABLE BLOG_T
    ADD CONSTRAINT FK_BLOG_MEMBER
        FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER_T(MEMBER_NO)
        ON DELETE CASCADE;
        
-- 써머노트 이미지 외래키 : 블로그가 삭제되면 이미지도 함께 삭제된다.
ALTER TABLE SUMMERNOTE_IMAGE_T
    ADD CONSTRAINT FK_SUMMERNOTE_BLOG
        FOREIGN KEY(BLOG_NO) REFERENCES BLOG_T(BLOG_NO)
        ON DELETE CASCADE;

-- 댓글 외래키(블로그) : 블로그가 삭제되면 댓글도 삭제된다.
ALTER TABLE COMMENT_T
    ADD CONSTRAINT FK_COMMENT_BLOG
     FOREIGN KEY(BLOG_NO) REFERENCES BLOG_T(BLOG_NO)
     ON DELETE CASCADE;

-- 댓글 외래키(회원)   : 댓글 작성자가 삭제되면 댓글의 MEMBER_NO를 NULL 처리한다.
ALTER TABLE COMMENT_T
    ADD CONSTRAINT FK_COMMENT_MEMBER
     FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER_T(MEMBER_NO)
     ON DELETE SET NULL;

-- 좋아요 외래키(블로그) : 블로그가 삭제되면 좋아요도 삭제된다.
ALTER TABLE GOOD_T
    ADD CONSTRAINT FK_GOOD_BLOG
     FOREIGN KEY(BLOG_NO) REFERENCES BLOG_T(BLOG_NO)
     ON DELETE CASCADE;
     
-- 좋아요 외래키(회원)   : 좋아요를 누른 사람이 삭제되면 좋아요도 삭제된다.
ALTER TABLE GOOD_T
    ADD CONSTRAINT FK_GOOD_MEMBER
     FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER_T(MEMBER_NO)
     ON DELETE CASCADE;

     
-- 시퀀스
DROP   SEQUENCE MEMBER_SEQ;
DROP   SEQUENCE BLOG_SEQ;
DROP   SEQUENCE COMMENT_SEQ;
CREATE SEQUENCE MEMBER_SEQ NOCACHE;
CREATE SEQUENCE BLOG_SEQ NOCACHE;
CREATE SEQUENCE COMMENT_SEQ NOCACHE;


-- 회원 데이터
INSERT INTO MEMBER_T VALUES(MEMBER_SEQ.NEXTVAL, 'ryan', '1111', '라이언');
INSERT INTO MEMBER_T VALUES(MEMBER_SEQ.NEXTVAL, 'prodo', '2222', '프로도');    
INSERT INTO MEMBER_T VALUES(MEMBER_SEQ.NEXTVAL, 'apeach', '3333', '어피치'); 
COMMIT;