package repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.JicmuDTO;
import model.DTO.TheaterAddDTO;

@Repository
public class JicmuRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "adminSMapper";
	public List<TheaterAddDTO> selectList() {
		String statement = namespace + ".selectTheaterList";
		return sqlSession.selectList(statement);
	}
	public List<JicmuDTO> selectJicmu() {
		String statement = namespace + ".selectJicmuList";
		return sqlSession.selectList(statement);
	}
	//Insert Part
	public void insertJicmu(String jicmu) {
		String statement = namespace + ".insertJicmu";
		sqlSession.insert(statement, jicmu);
	}
}
