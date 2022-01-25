package hensuUser;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HensuUserController {

	
	@GetMapping("user/mypage/myComment")
	public String main() {
		return "user/myComment";
	}
}
