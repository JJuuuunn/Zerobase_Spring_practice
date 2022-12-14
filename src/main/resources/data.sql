
insert into USER (ID, EMAIL, PASSWORD, PHONE, REG_DATE, UPDATE_DATE, USER_NAME, STATUS, LOCK_YN) VALUES (1, 'test01@test.com', '1111', '010-1111-1111', '2022-08-30 20:07:55.47035', null, 'test01', 1, 0);
insert into USER (ID, EMAIL, PASSWORD, PHONE, REG_DATE, UPDATE_DATE, USER_NAME, STATUS, LOCK_YN) VALUES (2, 'test02@test.com', '2222', '010-2222-2222', '2022-08-30 20:07:55.47035', null, 'test02', 1, 0);
insert into USER (ID, EMAIL, PASSWORD, PHONE, REG_DATE, UPDATE_DATE, USER_NAME, STATUS, LOCK_YN) VALUES (3, 'test03@test.com', '3333', '010-3333-3333', '2022-08-30 20:07:55.47035', null, 'test03', 2, 0);
insert into USER (ID, EMAIL, PASSWORD, PHONE, REG_DATE, UPDATE_DATE, USER_NAME, STATUS, LOCK_YN) VALUES (4, 'test11@test.com', '$2a$10$gy7fSDiEai7UCsR2x.3qt.Gw0SQprJjIRhvMq09/XwumOnRUUdI8y', '010-1234-1234', '2022-09-04 19:32:01.103224', null, 'test11', 0, 0);
insert into USER (ID, EMAIL, PASSWORD, PHONE, REG_DATE, UPDATE_DATE, USER_NAME, STATUS, LOCK_YN) VALUES (5, 'test22@test.com', '$2a$10$bn1aownTNGHccMSf9UOIDOn/p3kzt.BWV9t2d0cwYxeAVv2fdXxVi', '010-1234-1234', '2022-09-04 21:48:30.617712', null, 'test22', 1, 0);
insert into USER (ID, EMAIL, PASSWORD, PHONE, REG_DATE, UPDATE_DATE, USER_NAME, STATUS, LOCK_YN) VALUES (6, 'test33@test.com', '$2a$10$5AK6m6gZLWyV3hO7cRoy5u3MHuZ7SBzZRXUcrkv7odpFJlIzo/w36', '010-1234-1234', '2022-09-05 14:15:20.933246', null, 'test33', 1, 0);


insert into NOTICE (ID, CONTENTS, HITS, LIKES, REG_DATE, TITLE, DELETED, USER_ID) values (1, '내용1', 0, 0, '2022-08-17 01:01:01.000000', '제목1', 0, 1);
insert into NOTICE (ID, CONTENTS, HITS, LIKES, REG_DATE, TITLE, DELETED, USER_ID) values (2, '내용2', 0, 0, '2022-08-17 02:02:02.000000', '제목2', 0, 1);
insert into NOTICE (ID, CONTENTS, HITS, LIKES, REG_DATE, TITLE, DELETED, USER_ID) values (3, '내용3', 0, 0, '2022-08-17 03:03:03.000000', '제목3', 0, 1);
insert into NOTICE (ID, CONTENTS, HITS, LIKES, REG_DATE, TITLE, DELETED, USER_ID) values (4, '내용4', 0, 0, '2022-08-17 04:04:04.000000', '제목4', 0, 2);
insert into NOTICE (ID, CONTENTS, HITS, LIKES, REG_DATE, TITLE, DELETED, USER_ID) values (5, '내용5', 0, 0, '2022-08-17 05:05:05.000000', '제목5', 0, 2);
insert into NOTICE (ID, CONTENTS, HITS, LIKES, REG_DATE, TITLE, DELETED, USER_ID) values (6, '내용6', 0, 0, '2022-08-17 06:06:06.000000', '제목6', 0, 2);

insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (1, 4, 1);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (2, 5, 1);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (3, 1, 2);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (4, 2, 2);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (5, 2, 4);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (6, 2, 5);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (7, 4, 6);
insert into NOTICE_LIKE (ID, NOTICE_ID, USER_ID) values (8, 6, 1);

insert into BOARD_TYPE (ID, BOARD_NAME, REG_DATE, USING_YN)
values (1, '게시판1', '2022-09-06 02:36:51.000000', 1),
        (2, '게시판2', '2022-09-06 02:56:31.000000', 1);

insert into BOARD (ID, BOARD_TYPE_ID, USER_ID, TITLE, CONTENTS, REG_DATE, TOP_YN)
values (1, 1, 1, '제목1', '내용1', '2022-09-06 03:03:31.000000', 0),
        (2, 1, 2, '제목2', '내용2', '2022-09-06 03:03:31.000000', 0),
        (3, 1, 3, '제목3', '내용3', '2022-09-06 03:03:31.000000', 0),
        (4, 2, 4, '제목4', '내용4', '2022-09-06 03:03:31.000000', 0),
        (5, 2, 5, '제목5', '내용5', '2022-09-06 03:03:31.000000', 0),
        (6, 2, 6, '제목6', '내용6', '2022-09-06 03:03:31.000000', 0);

insert into BOARD_COMMENT (ID, USER_ID, BOARD_ID, COMMENTS, REG_DATE)
values (1, 4, 1, '게시글 1에 대한 댓글1', '2022-09-11 01:01:01.000000'),
       (2, 5, 1, '게시글 1에 대한 댓글2', '2022-09-11 01:01:01.000000'),
       (3, 4, 2, '게시글 2에 대한 댓글1', '2022-09-11 01:01:01.000000'),
       (4, 5, 2, '게시글 2에 대한 댓글2', '2022-09-11 01:01:01.000000'),
       (5, 5, 2, '게시글 2에 대한 댓글3', '2022-09-11 01:01:01.000000');
