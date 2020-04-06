package validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.member.MemberCommand;

public class MemberCommandValidator implements Validator {
	private static final String emailRegExp = "^[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	private static final String phRegExp = "^\\d{3}-\\d{3,4}-\\d{4}$";
	private Pattern emailPattern;
	private Pattern phPattern;
	public MemberCommandValidator() {
		emailPattern = Pattern.compile(emailRegExp);
		phPattern = Pattern.compile(phRegExp);
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberCommand regReq = (MemberCommand) target;
		if (regReq.getM_email() == null || regReq.getM_email().trim().isEmpty()) {
			errors.rejectValue("m_email", "required");	// error.properties에서 key값에 value 할당...
		} else {
			Matcher matcher = emailPattern.matcher(regReq.getM_email());	// true or false로 저장됨...
			if (!matcher.matches()) {
				errors.rejectValue("m_email", "bad");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_pass", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_pass_con", "required");
		if (!regReq.getM_pass().isEmpty()) {
			if (!regReq.isPwEqualToPwCon()) {
				errors.rejectValue("m_pass_con", "nomatch");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_gen", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_birth", "required");
		if (regReq.getM_ph() == null || regReq.getM_ph().trim().isEmpty()) {
			errors.rejectValue("m_ph", "required");	// error.properties에서 key값에 value 할당...
		} else {
			Matcher matcher = phPattern.matcher(regReq.getM_ph());	// true or false로 저장됨...
			if (!matcher.matches()) {
				errors.rejectValue("m_ph", "bad");
			}
		}
		ValidationUtils.rejectIfEmpty(errors, "m_addr1", "required");
		ValidationUtils.rejectIfEmpty(errors, "m_addr2", "required");
		ValidationUtils.rejectIfEmpty(errors, "m_zip", "required");
	}
}
