package service.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MovieDTO;
import repository.movie.MovieRepository;

@Service
public class MovieDetailService {
	@Autowired
	private MovieRepository movieRepository;
	
	public MovieDTO selectByMovieNum(String movie_num, Model model) {
		MovieDTO movie = movieRepository.selectByMovieNum(movie_num);
		model.addAttribute("movieCommand", movie);
		return movie;
	}
}
