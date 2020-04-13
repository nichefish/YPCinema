package repository.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import model.DTO.MovieDTO;
import model.DTO.MovieRatingDTO;

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

	public List<MovieDTO> selectMovieByRating(MovieRatingDTO movieRatingDTO, Model model) {
		String statement = namespace + ".selectMovieByRating";
		return sqlSession.selectList(statement, movieRatingDTO);
	}

	public Integer deleteMovie(String movie_num) {
		String statement = namespace + ".deleteMovie";
		return sqlSession.update(statement, movie_num);
	}

	public Integer modifyMovie(MovieDTO movie) {
		String statement = namespace + ".modifyMovie";
		return sqlSession.update(statement, movie);
	}

}
