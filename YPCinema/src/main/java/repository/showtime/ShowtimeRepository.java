package repository.showtime;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import command.showtime.ShowtimeCommand;
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

	public List<ShowtimeDTO> selectByShowInfo(ShowtimeDTO show) {
		String statement = namespace + ".selectByShowInfo";
		return sqlSession.selectList(statement, show);
	}
}