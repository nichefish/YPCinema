package controller.park;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PPUseController {
	@RequestMapping(value="/park/ppUse")
	public String ppUse() {
		
		return "park/pub_parking_lot_status";
	}
}
