package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.vo.Member;
import pms.vo.MemberProfile;
import pms.vo.MemberSch;

@Repository
public interface MemberDao {
	
	// 사원 등록
	public void register(Member ins);
	
	// 이메일 중복체크
	public int checkEmail(String email);
	
	// 사원 로그인
	public Member memberLogin(Member m);
	
	// 사원 디테일 페이지
	public Member getMemberDetail(int mid);
	
	// 사원 권한 부여
	public void authorize(Member upt);
	
	// 사원 삭제
	public void deleteMember(int mid);
	
	// 사원번호, 임시비밀번호 이메일 발송
	public void uptEmpnoAndPassword(Member upt);
	
	// 비밀번호 찾기 (임시비밀번호 이메일 발송)
	public void recoverPassword(Member upt);
	
	// 이메일 발송 시 이름 불러오기
	public String getMemberName(Member sch);
	
	// 마이페이지에서 비밀번호 변경
	public void uptPassword(Member upt);
	
	// 총사원수 cnt
	public int totCnt(MemberSch sch);
	
	// 사원 관리 리스트 호출
	public List<Member> memberList(MemberSch sch);
	
	// 마이페이지에서 이메일, 핸드폰 번호 수정
	public void uptInfo(Member upt);
	
	public void insProfile(MemberProfile ins);
	
	public MemberProfile getProfile(int mid);
	
	public void delProfile(int mid);
	
	public String checkProfile(int mid);
	
	public Member sendTempPassword(Member m);
}