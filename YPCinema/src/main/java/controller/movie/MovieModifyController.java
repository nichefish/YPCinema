package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.movie.MovieCommand;
import service.movie.MovieDetailService;
import service.movie.MovieModifyService;
import validator.MovieCommandValidator;

@Controller
public class MovieModifyController {
	@Autowired
	private MovieDetailService movieDetailService;
	@Autowired
	private MovieModifyService movieModifyService;
	
	@RequestMapping(value="movie/modify", method=RequestMethod.GET)
	public String movieModify(@RequestParam("num") String movie_num, MovieCommand movieCommand, Model model) {
		movieDetailService.selectByMovieNum(movie_num, model);
		return "movie/movie_modify";
	}
	
	@RequestMapping(value="movie/modify", method=RequestMethod.POST)
	public String movieModifyAction(@RequestParam("num") String movie_num, MovieCommand movieCommand, Model model, Errors errors) {
		new MovieCommandValidator().validate(movieCommand, errors);
		if (errors.hasErrors()) {
			return "movie/movie_modify";
		}
		movieModifyService.movieModify(movieCommand);
		return "redirect:/movie/detail";
	}
}
