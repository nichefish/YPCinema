package repository.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.MovieDTO;

@Repository
public class MovieRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "movieMapper";
	
	public Integer insertMovie(MovieDTO movie) {
		String statement = namespace + ".insertMovie";
		return sqlSession.insert(statement, movie);
	}

	public List<MovieDTO> selectMovieAll() {
		String statement = namespace + ".selectMovieAll";
		return sqlSession.selectList(statement);
	}

	public MovieDTO selectByMovieNum(String movie_num) {
		String statement = namespace + ".selectByMovieNum";
		return sqlSession.selectOne(statement, movie_num);
	}

}
