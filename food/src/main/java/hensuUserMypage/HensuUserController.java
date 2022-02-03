package hensuUserMypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import user.UserVo;

@Controller
public class HensuUserController {

	
	
	@GetMapping("user/mypage/myLove.do")
	public String love() {
		return "user/myLove";
	}
	@GetMapping("user/mypage/mylist.do")
	public String list() {
		return "user/mylist";
	}
	@GetMapping("user/foot.do")
	public String sad() {
		return "include/user_footer";
	}
	
}
