package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.movie.MovieCommand;
import service.movie.MovieInfoAPIService;
import service.movie.MovieRegisterService;
import validator.MovieCommandValidator;
import validator.YakganValidator;

@Controller
public class MovieRegisterController {
	@Autowired
	private MovieInfoAPIService movieInfoAPIService;
	@Autowired
	private MovieRegisterService movieRegisterService;
	
	@RequestMapping(value="/movie/register", method=RequestMethod.GET)
	public String movieRegisterForm(@RequestParam(value="movie_num", required=false) String movie_num, MovieCommand movieCommand, Errors errors) {
		try {
			Integer result = movieInfoAPIService.getMovieInfoAPI(movie_num, movieCommand);
			if (!movie_num.equals("") && result == 0) {
				errors.rejectValue("movie_num", "bad");
			}
		} catch (Exception e) {
			if (!movie_num.equals("")) {
				errors.rejectValue("movie_num", "bad");
			}
		}
		return "movie/movie_add";
	}
	
	@RequestMapping(value="/movie/register", method=RequestMethod.POST)
	public String movieRegisterAction(MovieCommand movieCommand, Errors errors) {
		new MovieCommandValidator().validate(movieCommand, errors);
		if (errors.hasErrors()) {
			return "movie/movie_add";
		}
		Integer result = movieRegisterService.movieRegister(movieCommand);	
		return "redirect:/movie/list";
	}
}