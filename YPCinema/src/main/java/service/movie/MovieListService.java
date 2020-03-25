package service.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MovieDTO;
import repository.movie.MovieRepository;

@Service
public class MovieListService {
	@Autowired
	private MovieRepository movieRepository;

	public void selectMovieAll(Model model) {
		List<MovieDTO> lists = movieRepository.selectMovieAll();
		model.addAttribute("lists", lists);		
	}
	
}
