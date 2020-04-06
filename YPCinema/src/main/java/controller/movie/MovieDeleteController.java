package controller.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.movie.MovieDeleteService;

@Controller
public class MovieDeleteController {
	@Autowired
	private MovieDeleteService movieDeleteService;
	
	@RequestMapping("/movie/delete")
	public String movieDelete(@RequestParam("num") String movie_num) {
		movieDeleteService.deleteMovie(movie_num);
		return "redirect:/movie/list";
	}
}
