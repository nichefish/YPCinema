package service.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MovieDTO;
import model.DTO.MovieRatingDTO;
import model.DTO.ScreenDTO;
import model.DTO.TheaterAddDTO;
import repository.movie.MovieRepository;

@Service
public class MovieListService {
	@Autowired
	private MovieRepository movieRepository;

	public void selectMovieAll(Model model) {
		List<MovieDTO> lists = movieRepository.selectMovieAll();
		model.addAttribute("lists", lists);
	}
	
	public void selectMovieByRating(TheaterAddDTO theater, ScreenDTO screen, Model model) {
		String temp = "";
		Integer ratingA = null;
		Integer ratingB = null;
		if (theater.getTheater_rating().compareTo(screen.getScreen_rating()) <= 0) {			// 고등급-
			temp = screen.getScreen_rating();
		} else {
			temp = theater.getTheater_rating();
		}
		System.out.println("temp: " + temp);
		switch (temp) {
		case "D" : 
			ratingA = 0;
			ratingB = 40;
			break;
		case "C" :
			ratingA = 40;
			ratingB = 60;
			break;
		case "B" :
			ratingA = 60;
			ratingB = 80;
			break;
		case "A" :
			ratingA = 100;
			ratingB = 100;
			break;
		}
		MovieRatingDTO movieRatingDTO = new MovieRatingDTO();
		movieRatingDTO.setRatingA(ratingA);
		movieRatingDTO.setRatingB(ratingB);
		movieRatingDTO.setTheater_special(theater.getTheater_special());
		
		List<MovieDTO> lists = movieRepository.selectMovieByRating(movieRatingDTO, model);
		model.addAttribute("lists", lists);
	}
}
