package repository.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.MemberDTO;

@Repository
public class MemberRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "memberMapper";
	
	public Integer insertMember(MemberDTO dto) {
		String statement = namespace + ".insertMember";
		return sqlSession.insert(statement, dto);
	}

	public MemberDTO selectByUserInfo(MemberDTO member) {
		String statement = namespace + ".selectByUserInfo";
		return sqlSession.selectOne(statement, member);
	}

	public List<MemberDTO> selectMemberAll() {
		String statement = namespace + ".selectMemberAll";
		return sqlSession.selectList(statement);
	}

	public Integer modifyMember(MemberDTO member) {
		String statement = namespace + ".modifyMember";
		return sqlSession.update(statement, member);
	}
	//sjh가 사용함요.
	public MemberDTO selectUseNum(String num) {
		String statement = namespace + ".selectUseNum";
		return sqlSession.selectOne(statement,num);
	}
	public MemberDTO selectFindUser(String text) {
		String statement = namespace + ".selectFindUser";
		return sqlSession.selectOne(statement,text);
	}
	//sjh가 사용함 끝.
	
	public Integer joinOkUpdate(MemberDTO memberDTO) {
		String statement = namespace + ".joinOkUpdate";
		return sqlSession.update(statement, memberDTO);
	}
	// 유저검색
	public List<MemberDTO> searchMemberId(MemberDTO member) {
		String statement = namespace + ".searchMemberId";
		return sqlSession.selectList(statement, member);
	}
	public List<MemberDTO> searchMemberName(MemberDTO member) {
		String statement = namespace + ".searchMemberName";
		return sqlSession.selectList(statement, member);
	}
}
