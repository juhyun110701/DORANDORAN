DROP TABLE BOOK;
DROP TABLE OLD_BOOK;
DROP TABLE MEMBER;
DROP TABLE COMMENTS;
DROP TABLE BOUGHT; 
DROP TABLE GENRES;
DROP SEQUENCE OLD_BOOK_SEQ;
DROP SEQUENCE COMMENTS_SEQ;
DROP SEQUENCE BOUGHT_SEQ;
DROP VIEW MEMVIEW;

--중고책 시퀀스(PK)
CREATE SEQUENCE OLD_BOOK_SEQ INCREMENT BY 1 START WITH 1;

--후기 시퀀스(PK)
CREATE SEQUENCE COMMENTS_SEQ INCREMENT BY 1 START WITH 1;

--구매목록 시퀀스(PK)
CREATE SEQUENCE BOUGHT_SEQ INCREMENT BY 1 START WITH 1;

--(새) 책 테이블
CREATE TABLE BOOK 
(
  TITLE VARCHAR2(40) NOT NULL 
, WRITER VARCHAR2(20) NOT NULL 
, PUBLISHER VARCHAR2(20) NOT NULL 
, PUBLISH_DATE DATE NOT NULL 
, STOCK NUMBER DEFAULT 0 NOT NULL 
, PRICE NUMBER NOT NULL
, GENRE VARCHAR2(20) NOT NULL
, TRANSLATOR VARCHAR2(20)
, IMAGE BLOB
, CONSTRAINT BOOK_PK PRIMARY KEY 
  (
    TITLE 
  )
  ENABLE 
);

--(중고) 책 테이블
CREATE TABLE OLD_BOOK 
(
  NUM NUMBER NOT NULL 
, TITLE VARCHAR2(40) NOT NULL 
, WRITER VARCHAR2(20) NOT NULL 
, PUBLISHER VARCHAR2(20) NOT NULL 
, PUBLISH_DATE DATE NOT NULL 
, PRICE NUMBER NOT NULL 
, GENRE VARCHAR2(20) NOT NULL
, SELLER VARCHAR2(20) NOT NULL 
, BUYER VARCHAR2(20)
, STATUS VARCHAR2(10)
, IMAGE BLOB
, CONSTRAINT OLD_BOOK_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

--회원 테이블
CREATE TABLE MEMBER 
(
  ID VARCHAR2(30) NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, EMAIL VARCHAR2(40) NOT NULL 
, ADDRESS VARCHAR2(100) 
, PW VARCHAR2(50) NOT NULL 
, PWCHK VARCHAR2(50) NOT NULL 
, CONSTRAINT TABLE1_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

--후기 테이블
CREATE TABLE COMMENTS 
(
  NUM NUMBER NOT NULL 
, ID VARCHAR2(30) NOT NULL 
, TITLE VARCHAR2(40) NOT NULL 
, CTITLE VARCHAR2(40) NOT NULL 
, CONTENT VARCHAR2(100) NOT NULL 
, CONSTRAINT COMMENTS_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

--구매 목록 테이블
CREATE TABLE BOUGHT 
(
  NUM NUMBER NOT NULL 
, TITLE VARCHAR2(40) NOT NULL 
, SELLER VARCHAR2(30) NOT NULL 
, BUYER VARCHAR2(30) NOT NULL 
, PRICE NUMBER NOT NULL 
, BOUGHT_DATE DATE NOT NULL 
, CONSTRAINT BOUGHT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

--장르 테이블
CREATE TABLE GENRES 
(
  GENRE_NUM VARCHAR2(20) NOT NULL
, GENRE VARCHAR2(20) NOT NULL 
, CONSTRAINT GENRES_PK PRIMARY KEY 
  (
    GENRE_NUM 
  )
  ENABLE 
);

--(중고) 책 테이블 FK
--ALTER TABLE OLD_BOOK
--ADD CONSTRAINT OLD_BOOK_FK1 FOREIGN KEY
--(
--  SELLER 
--)
--REFERENCES MEMBER
--(
--  ID 
--)
--ENABLE;

--ALTER TABLE OLD_BOOK
--ADD CONSTRAINT OLD_BOOK_FK2 FOREIGN KEY
--(
--  BUYER 
--)
--REFERENCES MEMBER
--(
--  ID 
--)
--ENABLE;

--중고책 시퀀스 테이블에 부여
CREATE TRIGGER OLD_BOOK_TRG 
BEFORE INSERT ON OLD_BOOK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.NUM IS NULL THEN
      SELECT OLD_BOOK_SEQ.NEXTVAL INTO :NEW.NUM FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

--후기 시퀀스 테이블에 부여
CREATE TRIGGER COMMENTS_TRG 
BEFORE INSERT ON COMMENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.NUM IS NULL THEN
      SELECT COMMENTS_SEQ.NEXTVAL INTO :NEW.NUM FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

--구매 목록 시퀀스 테이블에 부여
CREATE TRIGGER BOUGHT_TRG 
BEFORE INSERT ON BOUGHT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.NUM IS NULL THEN
      SELECT BOUGHT_SEQ.NEXTVAL INTO :NEW.NUM FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

SELECT * FROM BOOK;
SELECT * FROM OLD_BOOK;
SELECT * FROM MEMBER;
SELECT * FROM BOUGHT;

INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('0', '총류');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('1', '철학');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('2', '종교');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('3', '사회과학');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('4', '순수과학');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('5', '기술과학');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('6', '예술');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('7', '언어');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('8', '문학');
INSERT INTO GENRES (GENRE_NUM, GENRE) VALUES ('9', '역사');


--사용자정의함수
CREATE FUNCTION minusStock(original IN NUMBER, n IN NUMBER)
RETURN NUMBER
IS stock NUMBER:=0;
BEGIN
    stock:=original-n;
RETURN stock;
END;
/

--책 후기 테이블 FK
--ALTER TABLE COMMENTS
--ADD CONSTRAINT COMMENTS_FK1 FOREIGN KEY
--(
--  ID 
--)
--REFERENCES MEMBER
--(
--  ID 
--)
--ENABLE;

--인덱스
CREATE TABLE DORAN.CLIENTTBL
AS
    SELECT first_name||', '||last_name 이름, email 이메일, phone_number 전화번호
    FROM HR.employees;
    
--뷰
CREATE VIEW MEMVIEW
AS
    SELECT id, name, tel, email 
    FROM MEMBER;
    
--그룹함수
SELECT TITLE, SELLER, BUYER, COUNT(*) as cnt, SUM(PRICE) as price
FROM BOUGHT
GROUP BY CUBE(title, seller, buyer)
ORDER BY title NULLS LAST, seller NULLS LAST, buyer NULLS LAST, price desc;

--데이터사전
SELECT table_name, data_type, data_length FROM cols;
