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
}