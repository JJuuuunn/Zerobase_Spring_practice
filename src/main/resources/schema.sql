DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS NOTICE;
DROP TABLE IF EXISTS NOTICE_LIKE;
DROP TABLE IF EXISTS USER_LOGIN_HISTORY;
DROP TABLE IF EXISTS BOARD_TYPE;
DROP TABLE IF EXISTS BOARD;

CREATE TABLE USER (
    ID              BIGINT auto_increment primary key,
    EMAIL           VARCHAR(255),
    USER_NAME       VARCHAR(255),
    PASSWORD        VARCHAR(255),
    PHONE           VARCHAR(255),
    REG_DATE        TIMESTAMP,
    UPDATE_DATE     TIMESTAMP,
    STATUS          INTEGER,
    LOCK_YN         BOOLEAN
);

CREATE TABLE NOTICE (
    ID              BIGINT auto_increment primary key,
    TITLE           VARCHAR(255),
    CONTENTS        VARCHAR(255),

    HITS            INTEGER,
    LIKES           INTEGER,

    REG_DATE        TIMESTAMP,
    UPDATE_DATE     TIMESTAMP,
    DELETED_DATE    TIMESTAMP,
    DELETED         BOOLEAN,

    USER_ID         BIGINT,
    constraint FK_NOTICE_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE NOTICE_LIKE (
    ID              BIGINT auto_increment primary key,
    NOTICE_ID       BIGINT,
    USER_ID         BIGINT not null,
    constraint FK_NOTICE_LIKE_NOTICE_ID foreign key(NOTICE_ID) references NOTICE(ID),
    constraint FK_NOTICE_LIKE_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE USER_LOGIN_HISTORY (
    ID              BIGINT auto_increment primary key,
    USER_ID         BIGINT,
    EMAIL           VARCHAR(255),
    USER_NAME       VARCHAR(255),
    LOGIN_DATE      TIMESTAMP,
    IP_ADDR         VARCHAR(255)
);

CREATE TABLE BOARD_TYPE (
    ID              BIGINT auto_increment primary key,
    BOARD_NAME      VARCHAR(255),
    REG_DATE        TIMESTAMP,
    UPDATE_DATE     TIMESTAMP,
    USING_YN        BOOLEAN
);

CREATE TABLE BOARD (
    ID                  BIGINT auto_increment primary key,
    CONTENTS            VARCHAR(255),
    REG_DATE            TIMESTAMP,
    TITLE               VARCHAR(255),
    BOARD_TYPE_ID       BIGINT,
    USER_ID             BIGINT,
    TOP_YN              BOOLEAN,

    PUBLISH_START_DATE  DATE,
    PUBLISH_END_DATE    DATE,

    constraint FK_BOARD_TYPE_ID foreign key(BOARD_TYPE_ID) references BOARD_TYPE(ID),
    constraint FK_BOARD_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE BOARD_HITS (
    ID                  BIGINT auto_increment primary key,
    BOARD_ID            BIGINT,
    USER_ID             BIGINT,
    REG_DATE            TIMESTAMP,

    constraint FK_BOARD_HITS_BOARD_ID foreign key(BOARD_ID) references BOARD(ID),
    constraint FK_BOARD_HITS_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE BOARD_LIKE (
    ID                  BIGINT auto_increment primary key,
    BOARD_ID            BIGINT,
    USER_ID             BIGINT,
    REG_DATE            TIMESTAMP,

    constraint FK_BOARD_LIKE_BOARD_ID foreign key(BOARD_ID) references BOARD(ID),
    constraint FK_BOARD_LIKE_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE BOARD_BAD_REPORT (
    ID                  BIGINT auto_increment primary key,
    BOARD_ID            BIGINT,
    BOARD_USER_ID       BIGINT,
    BOARD_TITLE         VARCHAR(255),
    BOARD_CONTENTS      VARCHAR(255),
    BOARD_REG_DATE      TIMESTAMP,

    USER_ID             BIGINT,
    USER_EMAIL          VARCHAR(255),
    USER_NAME           VARCHAR(255),

    COMMENTS            VARCHAR(255),
    REG_DATE            TIMESTAMP
);

CREATE TABLE BOARD_SCRAP (
    ID                  BIGINT auto_increment primary key,

    USER_ID             BIGINT,

    BOARD_ID            BIGINT,
    BOARD_TYPE_ID       BIGINT,
    BOARD_USER_ID       BIGINT,
    BOARD_TITLE         VARCHAR(255),
    BOARD_CONTENTS      VARCHAR(255),
    BOARD_REG_DATE      TIMESTAMP,

    REG_DATE            TIMESTAMP,

    constraint FK_BOARD_SCRAP_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE BOARD_BOOKMARK (
    ID                  BIGINT auto_increment primary key,

    USER_ID             BIGINT,

    BOARD_ID            BIGINT,
    BOARD_TYPE_ID       BIGINT,
    BOARD_TITLE         VARCHAR(255),
    BOARD_URL           VARCHAR(255),

    REG_DATE            TIMESTAMP,

    constraint FK_BOARD_BOOKMARK_USER_ID foreign key(USER_ID) references USER(ID)
);

CREATE TABLE USER_INTEREST (
    ID                  BIGINT auto_increment primary key,

    USER_ID             BIGINT,
    INTEREST_USER_ID    BIGINT,
    REG_DATE            TIMESTAMP,

    constraint FK_USER_INTEREST_USER_ID foreign key(USER_ID) references USER(ID),
    constraint FK_USER_INTEREST_INTERESTUSER_ID foreign key(INTEREST_USER_ID) references USER(ID)
);

CREATE TABLE BOARD_COMMENT (
    ID                  BIGINT auto_increment primary key,

    USER_ID             BIGINT,
    BOARD_ID            BIGINT,
    COMMENTS            VARCHAR(255),
    REG_DATE            TIMESTAMP,

    constraint FK_USER_COMMENT_USER_ID foreign key(USER_ID) references USER(ID),
    constraint FK_USER_COMMENT_BOARD_ID foreign key(BOARD_ID) references BOARD(ID)
);

CREATE TABLE USER_POINT (
    ID                  BIGINT auto_increment primary key,

    USER_ID             BIGINT,
    USER_POINT_TYPE     VARCHAR(255),
    POINT               BIGINT,

    constraint FK_USER_POINT_USER_ID foreign key(USER_ID) references USER(ID)
);
