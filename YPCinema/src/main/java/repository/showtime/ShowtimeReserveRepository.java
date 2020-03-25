package repository.showtime;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ShowtimeReserveDTO;

@Repository
public class ShowtimeReserveRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "showtimeReserveMapper";
	
	public Integer insertReserve(ShowtimeReserveDTO showReserve) {
		String statement = namespace + ".insertReserve";
		return sqlSession.insert(statement, showReserve);
	}

}
