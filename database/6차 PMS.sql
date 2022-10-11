/*
cmd창 실행
sqlplus
system/1111
CREATE USER p06 IDENTIFIED BY 1111;
grant dba to p06;
*/
SELECT * FROM MEMBER;
CREATE TABLE member(
	email varchar2(50),
	password varchar2(20),
	name varchar2(30),
	auth varchar2(10),
	accessdate date
);

INSERT INTO MEMBER values('test@gmail.com', 'zxc!23123', '홍길동', 'ADMIN', sysdate);

create table notice(
                       nid number primary key,
                       pid number,
                       ntitle varchar2(200),
                       ncontent varchar2(1000),
                       nregdate date,
                       nuptdate date
);
insert into notice values (1, 1, '공지사항1', '공지사항 게시판 테스트용 데이터 입니다.', sysdate, sysdate);
insert into notice values (2, 1, '공지사항2', '두번째 테스트 데이터 입니다.', sysdate, sysdate);
insert into notice values (3, 1, '공지사항3', '세번째 테스트 데이터 입니다.', sysdate, sysdate);
select * from notice;

-- 재환
create table jobplan(
    jid number primary key,
    jname varchar2(200),
    jstart date,
    jend date,
    realstart date,
    realend date,
    content varchar2(1000),
    jprogress varchar2(10),
    jregdate date,
    juptdate date,
    required number
);
DROP TABLE jobplan;

INSERT INTO jobplan VALUES (1,'개발프로젝트',sysdate,sysdate,sysdate,sysdate,'생산기술','53',sysdate,sysdate,1);
INSERT INTO jobplan VALUES (2,'개발프로젝트',sysdate,sysdate,sysdate,sysdate,'설계','42',sysdate,sysdate,1);
INSERT INTO jobplan VALUES (3,'개발프로젝트',sysdate,sysdate,sysdate,sysdate,'품질(종합)','63',sysdate,sysdate,1);
INSERT INTO jobplan VALUES (4,'개발프로젝트',sysdate,sysdate,sysdate,sysdate,'상품기획','87',sysdate,sysdate,1);
				
SELECT * FROM jobplan;
--
