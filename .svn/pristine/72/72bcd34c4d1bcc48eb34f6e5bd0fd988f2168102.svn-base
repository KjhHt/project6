/*
cmd창 실행
sqlplus
system/1111
CREATE USER p06 IDENTIFIED BY 1111;
grant dba to p06;
*/

drop table issue;
drop table jobplan;
drop table jobmember;
drop table participants;
drop table notice;
drop table project;
drop table member;

create table member
(
    mid        number primary key,
    email      varchar2(50),
    password   varchar2(20),
    name       varchar2(30),
    auth       varchar2(10),
    accessdate date,
    status     varchar2(10)
);
INSERT INTO MEMBER
values (1, 'asdasd123@asdasd.com', '123123', '홍길동', 'ADMIN', sysdate, '승인');
INSERT INTO MEMBER
values (2, 'test@test.com', '123123', '마길동', 'ADMIN', sysdate, '승인');
select *
from member;

create table project
(
    pid      number primary key,
    pname    varchar2(200),
    pcomment varchar2(500),
    pstart   date,
    pend     date,
    pregdate date,
    pstatus varchar2(10)
);
insert into project
values (1, 'PMS', '프로젝트 관리 시스템', to_date('2022-07-20', 'YYYY-MM-DD'), to_date('2022-08-23', 'YYYY-MM-DD'),
        to_date('2022-07-20', 'YYYY-MM-DD'));
insert into project
values (2, 'TEST 프로젝트', '테스트용 프로젝트입니다.', to_date('2022-08-03', 'YYYY-MM-DD'), to_date('2022-08-12', 'YYYY-MM-DD'),
        to_date('2022-07-20', 'YYYY-MM-DD'));
select *
from project;


create table notice
(
    nid      number primary key,
    pid      number,
    ntitle   varchar2(200),
    ncontent varchar2(1000),
    nregdate date,
    nuptdate date
);
insert into notice
values (1, 1, '공지사항1', '공지사항 게시판 테스트용 데이터 입니다.', sysdate, sysdate);
insert into notice
values (2, 1, '공지사항2', '두번째 테스트 데이터 입니다.', sysdate, sysdate);
insert into notice
values (3, 1, '공지사항3', '세번째 테스트 데이터 입니다.', sysdate, sysdate);
insert into notice
values (4, 1, '공지사항3', '세번째 테스트 데이터 입니다.', sysdate, sysdate);
select *
from notice;

create table participants
(
    ppid     number primary key,
    pauth    varchar2(10),
    pid      number,
    mid      number,
    joindate date,
    exitdate date
);
insert into participants
values (1, 'PM', 1, 1, sysdate, null);
insert into participants
values (2, 'Developer', 1, 2, sysdate, null);
select *
from participants;

CREATE TABLE jobplan
(                                 -- 업무 일정 테이블
    jid       number PRIMARY KEY, -- 업무 일정 아이디 (시퀀스 사용해서 입력)
    jname     varchar2(300),      -- 업무 이름 (한글 기준 최대 100자)
    jstart    date,               -- 업무 시작 예정일
    jend      date,               -- 업무 마감 예정일
    realstart date,               -- 실제 시작 날짜
    realend   date,               -- 실제 마감 날짜
    content   varchar2(1500),     -- 업무 상세 내용 설명 (한글 기준 최대 500자_
    jregdate  date,               -- 업무 등록일
    juptdate  date,               -- 업무 수정일
    required  number,             -- 선행 작업, 먼저 처리해야하는 업무 일정 아이디
    pid       NUMBER,             -- 프로젝트 아이디
    jstatus   varchar2(10)        -- 업무 진행 현황 (진행, 지연, 완료, ...)
);
insert into jobplan
values (1, '대시보드 차트 적용',
        to_date('2022-07-28', 'YYYY-MM-DD'), to_date('2022-07-30', 'YYYY-MM-DD'),
        to_date('2022-07-28', 'YYYY-MM-DD'), to_date('2022-08-02', 'YYYY-MM-DD'),
        '대시보드에 lib활용하여 데이터를 차트형식으로 표시하기',
        to_date('2022-07-28', 'YYYY-MM-DD'), to_date('2022-07-28', 'YYYY-MM-DD'),
        null, 1, '진행중');
insert into jobplan
values (2, '원형차트 도입',
        to_date('2022-08-02', 'YYYY-MM-DD'), to_date('2022-08-04', 'YYYY-MM-DD'),
        to_date('2022-08-02', 'YYYY-MM-DD'), to_date('2022-08-04', 'YYYY-MM-DD'),
        '원형차트 대시보드에 도입(업무,이슈)',
        to_date('2022-08-04', 'YYYY-MM-DD'), to_date('2022-08-04', 'YYYY-MM-DD'),
        1, 1, '완료');
insert into jobplan
values (3, '간트차트 도입',
        to_date('2022-08-05', 'YYYY-MM-DD'), to_date('2022-08-05', 'YYYY-MM-DD'),
        to_date('2022-08-05', 'YYYY-MM-DD'), null,
        '간트차트를 통한 업무현황 표시',
        to_date('2022-08-05', 'YYYY-MM-DD'), to_date('2022-08-05', 'YYYY-MM-DD'),
        2, 1, '진행중');
select *
from jobplan;

CREATE TABLE jobmember
(                                                   -- 업무 담당 테이블
    jmid     number PRIMARY KEY,                    -- 업무 담당 아이디 (시퀀스를 사용해서 입력)
    jid      number REFERENCES jobplan (jid),       -- 업무 일정 아이디
    ppid     number REFERENCES participants (ppid), -- 참여인원 아이디
    progress NUMBER,                                -- 진행률 (백분율 표기)
    jmstatus varchar2(10)                           -- 업무 산출물 처리 현황 (승인 / 반려)
);
insert into jobmember
values (1, 1, 1, 50);
insert into jobmember
values (2, 1, 2, 70);
select *
from jobmember;

create table issues
(
    iid       number primary key,
    ititle    varchar2(200),
    icontent  varchar2(1000),
    iprogress varchar2(10),
    iregdate  date,
    iuptdate  date,
    jmid      number
);
insert into issues
values (1, '차트구현 지연', '개인적인 사정으로 인한 대시보드 차트 일정 지연', '해결',
        to_date('2022-07-29', 'YYYY-MM-DD'), to_date('2022-08-02', 'YYYY-MM-DD'),
        1);
insert into issues
values (2, '테스트 이슈1', '테스트 이슈사항 내용1', '해결중',
        to_date('2022-08-01', 'YYYY-MM-DD'), to_date('2022-08-01', 'YYYY-MM-DD'),
        1);
insert into issues
values (3, '테스트 이슈2', '테스트 이슈사항 내용2', '해결중',
        to_date('2022-08-01', 'YYYY-MM-DD'), to_date('2022-08-03', 'YYYY-MM-DD'),
        2);
insert into issues
values (4, '테스트 이슈3', '테스트 이슈사항 내용33', '해결불가',
        to_date('2022-08-02', 'YYYY-MM-DD'), to_date('2022-08-02', 'YYYY-MM-DD'),
        2);
insert into issues
values (5, '테스트 이슈4', '테스트 이슈사항 내용44', '해결',
        to_date('2022-08-02', 'YYYY-MM-DD'), to_date('2022-08-03', 'YYYY-MM-DD'),
        2);
insert into issues
values (6, '테스트 이슈5', '테스트 이슈사항 내용55', '해결중',
        to_date('2022-07-28', 'YYYY-MM-DD'), to_date('2022-07-29', 'YYYY-MM-DD'),
        1);
insert into issues
values (7, '테스트 이슈6', '테스트 이슈사항 내용66', '해결중',
        to_date('2022-08-01', 'YYYY-MM-DD'), to_date('2022-08-04', 'YYYY-MM-DD'),
        2);
select *
from issues;
--delete from issue where iid = 2;

select iid, jname, ititle, iprogress, name, iuptdate
from issues i,
     jobmember jm,
     jobplan jp,
     (select *
      from member m,
           participants pp
      where m.mid = pp.mid) m
where i.jmid = jm.jmid
  and jm.jid = jp.jid
  and jm.ppid = m.ppid
  and jp.pid = 1
order by iuptdate;

select *
from (select ib.*, rownum cnt
      from (select iid, jname, ititle, iprogress, name, iuptdate
            from issues i,
                 jobmember jm,
                 jobplan jp,
                 (select *
                  from member m,
                       participants pp
                  where m.mid = pp.mid) m
            where i.jmid = jm.jmid
              and jm.jid = jp.jid
              and jm.ppid = m.ppid
              and jp.pid = 1
            order by iuptdate desc) ib)
where cnt between 1 and 3;

select *
from (select nb.*, rownum cnt from (select * from notice where pid = 1 order by nuptdate desc) nb)
where cnt between 1 and 3;

select count(*) from participants where mid = 1 and pid = 1;
select count(m.mid)
from participants p, member m
where p.mid = m.mid(+) and ((p.mid = 1 and p.pid = 1) or (m.auth = 'ADMIN'));

select * from CALENDARMEMBER;

<<<<<<< HEAD
insert into CALENDARMEMBER
values (CALENDARMEMBER_SEQ.nextval, 2, 'test', sysdate, to_date('2022-08-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'tt test tt',NULL,'#0099CC','#ccffff',0);

SELECT * FROM MEMBER;
=======
select * from CALENDARMEMBER;
		SELECT jobfile_seq.nextval FROM dual;
		DROP TABLE jobfile;
		DROP SEQUENCE jobfile_seq;
		SELECT * FROM jobfile;

select * from CALENDARMEMBER;
		SELECT jobfile_seq.nextval FROM dual;
		DROP TABLE jobfile;
		DROP SEQUENCE jobfile_seq;
		SELECT * FROM jobfile;

select * from CALENDARMEMBER;
		SELECT jobfile_seq.nextval FROM dual;
		DROP TABLE jobfile;
		DROP SEQUENCE jobfile_seq;
		SELECT * FROM jobfile;

select * from CALENDARMEMBER;
		SELECT jobfile_seq.nextval FROM dual;
		DROP TABLE jobfile;
		DROP SEQUENCE jobfile_seq;
		SELECT * FROM jobfile;

select * from CALENDARMEMBER;
		SELECT jobfile_seq.nextval FROM dual;
		DROP TABLE jobfile;
		DROP SEQUENCE jobfile_seq;
		SELECT * FROM jobfile;

select * from CALENDARMEMBER;
SELECT * FROM jobfile;
>>>>>>> branch 'develop' of https://github.com/IDontHaveBrain/project06
