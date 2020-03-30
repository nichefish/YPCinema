package repository.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ScreenDTO;
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
	public void deleteTheater(String num) {
		String statement = namespace + ".deleteTheater";
		sqlSession.delete(statement,num);
	}
	public TheaterAddDTO selectTheater(String num) {
		String statement = namespace + ".selectTheater";
		return sqlSession.selectOne(statement,num);
	}
	public void updateTheater(TheaterAddDTO dto) {
		String statement = namespace + ".modifyTheater";
		sqlSession.update(statement,dto);
	}
	public void modifySpecial(TheaterAddDTO dto) {
		String statement = namespace + ".modifySpecial";
		sqlSession.update(statement,dto);
	}
	public Integer countTheaterScreen(String theater_num) {
		String statement = namespace + ".countTheaterScreen";
		return sqlSession.selectOne(statement, theater_num);
	}
	public Integer countTheaterMaxSeat(String theater_num) {
		String statement = namespace + ".countTheaterMaxSeat";
		return sqlSession.selectOne(statement, theater_num);
	}
	public void modifyRating(TheaterAddDTO dto) {
		String statement = namespace + ".modifyRating";
		sqlSession.update(statement,dto);
	}
}
