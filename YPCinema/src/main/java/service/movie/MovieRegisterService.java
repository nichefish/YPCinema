package service.movie;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import command.movie.MovieCommand;
import model.DTO.MovieDTO;
import repository.movie.MovieRepository;

@Service
public class MovieRegisterService {
	@Autowired
	private MovieRepository movieRepository;
	
	public Integer movieRegister(MovieCommand movieCommand) {
		MovieDTO movie = new MovieDTO();
		movie.setMovie_num(movieCommand.getMovie_num());
		movie.setMovie_title(movieCommand.getMovie_title());
		movie.setMovie_director(movieCommand.getMovie_director());
		movie.setMovie_nation(movieCommand.getMovie_nation());
		movie.setMovie_date(movieCommand.getMovie_date());
		movie.setMovie_genre(movieCommand.getMovie_genre());
		movie.setMovie_plot(movieCommand.getMovie_plot());
		movie.setMovie_age(movieCommand.getMovie_age());
		movie.setMovie_runtime(movieCommand.getMovie_runtime());
		movie.setMovie_poster_url(movieCommand.getMovie_poster_url());
		movie.setMovie_still_url(movieCommand.getMovie_still_url());
		return movieRepository.insertMovie(movie);
	}
	
}
