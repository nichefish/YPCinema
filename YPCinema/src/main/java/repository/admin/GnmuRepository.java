package repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.GngijunDTO;

@Repository
public class GnmuRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "gnmuMapper";
	
	//근무분류 목록
	public List<GngijunDTO> gnmuLists(){
		String statement = namespace + ".selectGngijunLists";
		return sqlSession.selectList(statement);
	}
	//전체 시간
	public int totalTime(GngijunDTO dto) {
		String statement = namespace + ".selectTotalTime";
		return sqlSession.selectOne(statement, dto);
	}
	public String totalTime2(GngijunDTO otd) {
		String statement = namespace + ".selectTotalTime2";
		return sqlSession.selectOne(statement, otd);
	}
	public String totalTime3(GngijunDTO otd) {
		String statement = namespace + ".selectTotalTime3";
		return sqlSession.selectOne(statement, otd);
	}
	//근무분류 추가
	public void addGnmuTime(GngijunDTO dto) {
		String statement = namespace + ".insertGnmuTime";
		sqlSession.insert(statement, dto);
	}
	//근무분류 삭제
	public void deleteGnmuTime(String gbunNum) {
		String statement = namespace + ".deleteGnmuTime";
		sqlSession.delete(statement, gbunNum);
	}
}
