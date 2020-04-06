package validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.member.MemberCommand;
import command.screen.ScreenCommand;

public class ScreenCommandValidator implements Validator {
	private static final String rowRegExp = "^\\d{1,2}-\\d{1,2}-\\d{1,2}$";
	private Pattern rowPattern;
	public ScreenCommandValidator() {
		rowPattern = Pattern.compile(rowRegExp);
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ScreenCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ScreenCommand regReq = (ScreenCommand) target;
		ValidationUtils.rejectIfEmpty(errors, "screen_name", "required");
		if (regReq.getScreen_row().trim().isEmpty()) {
			errors.rejectValue("screen_row", "bad");	// error.properties에서 key값에 value 할당...
		} else {
			Matcher matcher = rowPattern.matcher(regReq.getScreen_row());	// true or false로 저장됨...
			if (!matcher.matches()) {
				errors.rejectValue("screen_row", "bad");
			}
		}
		System.out.println("!@#!@#:" + regReq.getScreen_col());
		if (Integer.parseInt(regReq.getScreen_col()) <= 0) {
			errors.rejectValue("screen_col", "bad");
		}
		
		
	}

}
