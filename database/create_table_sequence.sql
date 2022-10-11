CREATE TABLE MEMBER (					-- 회원 테이블
	mid 		number PRIMARY KEY,		-- 회원 아이디 (시퀀스 사용해서 입력)
	email		varchar2(50),			-- 이메일주소
	password	varchar2(20),			-- 비밀번호
	name		varchar2(30),			-- 회원 이름
	auth		varchar2(10),			-- 회원 권한 (ceo, pm, 일반회원... 제가 임의로 쓴거니까 권한 꼭 이렇게 나누지 않으셔도 돼요)
	accessdate	date,					-- 최근 접속일
	status		varchar2(10),			-- 가입 상태 (대기 / 승인 / 탈퇴)
	empno		NUMBER					-- 사원번호 (로그인시 사용하는 아이디)
	birthdate varchar2(30),				-- 생일
	phonenumber varchar2(30)			-- 핸드폰번호
);

CREATE SEQUENCE member_seq
	INCREMENT BY 1
	START WITH 1;

CREATE SEQUENCE empno_seq
	INCREMENT BY 1
	START WITH 7000;

ALTER TABLE MEMBER DROP COLUMN phonenumber;
ALTER TABLE MEMBER ADD birthdate varchar2(30);
ALTER TABLE MEMBER ADD phonenumber varchar2(30);

CREATE TABLE profile (					-- 회원 프로필 사진 테이블
	mid REFERENCES member(mid),			-- 회원 아이디 레퍼런스
	PATH varchar2(120),					-- 경로
	fname varchar2(50)					-- 사진 이름
);


DELETE FROM MEMBER, log, participants
USING 

CREATE TABLE project (					-- 프로젝트 테이블
	pid			number PRIMARY KEY,		-- 프로젝트 아이디 (시퀀스 사용해서 입력)
	pname		varchar2(300),			-- 프로젝트 이름 (한글 기준 최대 100자)
	pcomment	varchar2(1500),			-- 프로젝트에 대한 간략한 설명 (한글 기준 최대 500자)
	pstart		date,					-- 프로젝트 시작 날짜
	pend		date,					-- 프로젝트 마감 날짜
	pregdate	date					-- 프로젝트 등록 날짜
);

CREATE SEQUENCE project_seq
	INCREMENT BY 1
	START WITH 1;

ALTER TABLE PROJECT ADD pstatus varchar(10);


CREATE TABLE log (									-- 로그 테이블
	lid			number	PRIMARY KEY,				-- 로그 아이디 (시퀀스 사용해서 입력)
	TYPE		varchar2(20),						-- 작업 구분 (공지작성, 업무등록, 산출물제출, 이슈작성 등의 구분)
	execdate	date,								-- 작업 수행 날짜
	pid			number	REFERENCES project(pid),	-- 프로젝트 아이디
	content		varchar2(1000),						-- 수행 내용 (쿼리 실행시 쿼리문 저장)
	mid			number	REFERENCES member(mid)		-- 회원 아이디 (작업을 수행한 사람)
);

CREATE SEQUENCE log_seq
	INCREMENT BY 1
	START WITH 1;



CREATE TABLE participants (							-- 참여인원 테이블
	ppid		number	PRIMARY KEY,				-- 참여인원 아이디 (시퀀스 사용해서 입력)
	pauth		varchar2(10),						-- 프로젝트 권한 (pm, 일반팀원)
	pid			number	REFERENCES project(pid),	-- 프로젝트 아이디
	mid			number	REFERENCES member(mid),		-- 회원 아이디
	joindate	date,								-- 이 프로젝트에 투입된 날짜
	exitdate	date								-- 이 프로젝트에서 빠진 날짜 / 끝까지 참여한 경우 프로젝트 마감 날짜
);

CREATE SEQUENCE participants_seq
	INCREMENT BY 1
	START WITH 1;



CREATE TABLE minutes (								-- 회의록 테이블
	minid		number	PRIMARY KEY,				-- 회의 아이디 (시퀀스 사용해서 입력)
	pid			number	REFERENCES project(pid),	-- 프로젝트 아이디
	mtitle		varchar2(300),						-- 회의 제목 (한글 기준 최대 100자)
	mdate		date,								-- 회의 날짜
	mcontent	varchar2(3000),						-- 회의록 내용 (한글 기준 최대 1000자)
	mregdate	date,								-- 등록일
	muptdate	date								-- 수정일
);

CREATE SEQUENCE minutes_seq
	INCREMENT BY 1
	START WITH 1;



CREATE TABLE notice (								-- 공지사항 테이블
	nid			number	PRIMARY KEY,				-- 공지아이디 (시퀀스 사용해서 입력)
	pid			number	REFERENCES project(pid),	-- 프로젝트 아이디
	ntitle		varchar2(300),						-- 공지 제목 (한글 기준 최대 100자)
	ncontent	varchar2(3000),						-- 공지 내용 (한글 기준 최대 1000자)
	nregdate	date,								-- 공지 등록일
	nuptdate	date								-- 공지 수정일
);

CREATE SEQUENCE notice_seq
	INCREMENT BY 1
	START WITH 1;


CREATE TABLE jobplan (					-- 업무 일정 테이블
	jid			number PRIMARY KEY,		-- 업무 일정 아이디 (시퀀스 사용해서 입력)
	jname		varchar2(300),			-- 업무 이름 (한글 기준 최대 100자)
	jstart		date,					-- 업무 시작 예정일
	jend		date,					-- 업무 마감 예정일
	realstart	date,					-- 실제 시작 날짜
	realend		date,					-- 실제 마감 날짜
	content		varchar2(1500),			-- 업무 상세 내용 설명 (한글 기준 최대 500자_
	jregdate	date,					-- 업무 등록일
	juptdate	date,					-- 업무 수정일
	required	number,					-- 선행 작업, 먼저 처리해야하는 업무 일정 아이디
	pid			NUMBER,					-- 프로젝트 아이디
	jstatus		varchar2(10)			-- 업무 진행 현황 (진행, 지연, 완료, ...)
);

CREATE SEQUENCE jobplan_seq
	INCREMENT BY 1
	START WITH 1;



CREATE TABLE jobfile (					-- 업무 첨부파일 테이블 (업무 산출물)
	fid			number PRIMARY key,		-- 파일 아이디 (시퀀스 사용해서 입력)
	jmid		number,					-- 업무담당 아이디
	fregdate	date,					-- 등록일
	PATH		varchar2(200),			-- 파일 경로
	fname		varchar2(100)			-- 파일 이름
);

CREATE SEQUENCE jobfile_seq
	INCREMENT BY 1
	START WITH 1;
SELECT * FROM jobfile;


CREATE TABLE jobmember (								-- 업무 담당 테이블
	jmid		number	PRIMARY KEY,					-- 업무 담당 아이디 (시퀀스를 사용해서 입력)
	jid			number	REFERENCES jobplan(jid),		-- 업무 일정 아이디
	ppid		number	REFERENCES participants(ppid),	-- 참여인원 아이디
	progress	NUMBER,									-- 진행률 (백분율 표기)
	jmstatus	varchar2(10)							-- 업무 산출물 처리 현황 (승인 / 반려)
);

CREATE SEQUENCE jobmember_seq
	INCREMENT BY 1
	START WITH 1;

ALTER TABLE JOBMEMBER DROP foreigen key

CREATE TABLE issues (								-- 업무 이슈 테이블
	iid			number PRIMARY KEY,					-- 업무 이슈 아이디 (시퀀스를 사용해서 입력)
	ititle		varchar2(300),						-- 이슈 제목 (한글 기준 최대 100자)
	icontent	varchar2(1500),						-- 이슈 내용 (한글 기준 최대 500자)
	iprogress	varchar2(10),						-- 처리 현황 (검토 / 완료 / 불가)
	iregdate	date,								-- 작성일
	iuptdate	date,								-- 수정일
	jmid		number	REFERENCES jobmember(jmid)	-- 업무 담당 아이디
);

SELECT * FROM MEMBER;
CREATE TABLE calendarmember(
    mcid number primary key,
    mid number,
    title varchar2(100),
    cstart date,
    cend date,
    content varchar2(500),
    bordercolor varchar2(20),
    backgroundcolor varchar2(20),
    textcolor varchar2(20),
    allday number
);

CREATE SEQUENCE calendarmember_seq
    INCREMENT BY 1
    START WITH 1;
