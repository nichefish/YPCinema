package repository.showtime;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import command.showtime.ShowtimeListCommand;
import model.DTO.ShowtimeDTO;

@Repository
public class ShowtimeRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "showtimeMapper";
	
	public Integer insertShowtime(ShowtimeDTO show) {
		String statement = namespace + ".insertShowtime";
		return sqlSession.insert(statement, show);
	}

	public List<ShowtimeDTO> selectAllShowtime() {
		String statement = namespace + ".selectAllShowtime";
		return sqlSession.selectList(statement);
	}

	public ShowtimeDTO selectByShowId(ShowtimeDTO show) {
		String statement = namespace + ".selectByShowId";
		return sqlSession.selectOne(statement, show);
	}

	public List<ShowtimeDTO> selectByShowInfo(ShowtimeListCommand show) {
		String statement = namespace + ".selectByShowInfo";
		return sqlSession.selectList(statement, show);
	}

	public ShowtimeDTO selectEarliestShowByDate(ShowtimeDTO show) {
		String statement = namespace + ".selectEarliestShowByDate";
		return sqlSession.selectOne(statement, show);
	}
}