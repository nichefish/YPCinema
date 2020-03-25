package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.movie.MovieDetailService;

@Controller
public class MovieDetailController {
	@Autowired
	private MovieDetailService movieDetailService;
	
	@RequestMapping("/movie/detail")
	public String movieDetail(@RequestParam("num") String movie_num, Model model) {
		movieDetailService.selectByMovieNum(movie_num, model);
		return "movie/movie_detail";
	}
}
