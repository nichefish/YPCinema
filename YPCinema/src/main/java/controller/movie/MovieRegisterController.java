package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.movie.MovieCommand;
import service.movie.MovieInfoAPIService;
import service.movie.MovieRegisterService;

@Controller
public class MovieRegisterController {
	@Autowired
	private MovieInfoAPIService movieInfoAPIService;
	@Autowired
	private MovieRegisterService movieRegisterService;
	
	@RequestMapping(value="/movie/register", method=RequestMethod.GET)
	public String movieRegisterForm(@RequestParam(value="movie_num", required=false) String movie_num, MovieCommand movieCommand) {
		if (movie_num != null) {
			movieInfoAPIService.getMovieInfoAPI(movie_num, movieCommand);
		}
		return "movie/movie_add";
	}
	
	@RequestMapping(value="/movie/register", method=RequestMethod.POST)
	public String movieRegisterAction(MovieCommand movieCommand) {
		System.out.println("movie_num: " + movieCommand.getMovie_num());
		Integer result = movieRegisterService.movieRegister(movieCommand);	
		return "redirect:/main";
	}
}