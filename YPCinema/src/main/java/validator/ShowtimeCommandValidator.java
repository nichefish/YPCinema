package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.showtime.ShowtimeCommand;

public class ShowtimeCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ShowtimeCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "theater_num", "required");
		ValidationUtils.rejectIfEmpty(errors, "screen_num", "required");
		ValidationUtils.rejectIfEmpty(errors, "movie_num", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "show_date", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "show_start", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "show_end", "required");
	}
}
