package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.movie.MovieListService;

@Controller
public class MovieListController {
	@Autowired
	private MovieListService movieListService;
	
	@RequestMapping("/movie/list")
	public String movieList(Model model) {
		movieListService.selectMovieAll(model);
		return "movie/movie_list";
	}
}
