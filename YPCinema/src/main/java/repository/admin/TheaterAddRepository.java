package repository.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.TheaterAddDTO;

@Repository
public class TheaterAddRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "adminMapper";
	public void insertTheaterAdd(TheaterAddDTO dto) {
		String statement = namespace + ".theaterInsert";
		sqlSession.insert(statement, dto);
	}
	public TheaterAddDTO selectTheater(String num) {
		String statement = namespace + ".selectTheater";
		return sqlSession.selectOne(statement,num);
	}
	public void updateTheater(TheaterAddDTO dto) {
		String statement = namespace + ".modifyTheater";
		sqlSession.update(statement,dto);
	}
}
