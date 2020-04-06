package service.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.movie.MovieRepository;

@Service
public class MovieDeleteService {
	@Autowired
	private MovieRepository movieRepository;
	
	public void deleteMovie(String movie_num) {
		movieRepository.deleteMovie(movie_num);
		
	}
}
