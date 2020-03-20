package repository.screen;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ScreenDTO;

@Repository
public class ScreenRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "screenMapper";
	
	public Integer insertScreen(ScreenDTO screen) {
		String statement = namespace + ".insertScreen";
		return sqlSession.insert(statement, screen);
		
	}

	public List<ScreenDTO> selectScreenByTheaterNum(String theater_num) {
		String statement = namespace + ".selectScreenByTheaterNum";
		return sqlSession.selectList(statement, theater_num);
	}

}
