package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.movie.MovieCommand;

public class MovieCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MovieCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movie_num", "required");
		ValidationUtils.rejectIfEmpty(errors, "movie_title", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movie_age", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movie_runtime", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movie_rating_plus", "required");
		
	}

}
