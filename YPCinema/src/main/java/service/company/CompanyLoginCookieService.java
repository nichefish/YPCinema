package service.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import org.springframework.stereotype.Service;

@Service
public class CompanyLoginCookieService {
	public void execute(HttpServletRequest request, HttpSession session) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("storeId")) {
					request.setAttribute("id", c.getValue());
					request.setAttribute("isCheck", true);
				}
				if (c.getName().equals("adminSelect")) {
					request.setAttribute("admin", c.getValue());
				}
				if (c.getName().equals("autoLogin")) {
					session.setAttribute("memId", c.getValue());
					System.out.println("!!");
				}
			}
		}
	}

}
