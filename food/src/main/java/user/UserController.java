package user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
   
   @Autowired
   UserService service;
   //수연 페이지 확인   
   @GetMapping("user/main.do")
   public String main() {
      return "user/main";
   }
   @GetMapping("user/list.do")
   public String list() {
      return "user/restaurantlist";
   }
   @GetMapping("user/login.do")
   public String login() {
      return "user/login";
   }
   @PostMapping("/user/login.do")
   public String loginProcess(Model model, UserVo vo, HttpSession sess) {
      if (service.login(vo, sess)) {
         model.addAttribute("url", "/res/user/main.do");
         return "include/return";
      } else {
         model.addAttribute("msg", "아이디, 비밀번호를 확인해 주세요");
         model.addAttribute("url", "/res/user/login.do");
         return "include/return";
      }
   }
   @GetMapping("/user/logout.do")
   public String logOut(Model model, HttpSession sess) {
      model.addAttribute("msg", "로그아웃되었습니다.");
      model.addAttribute("url", "/res/user/login.do");
      sess.invalidate();
      return "include/return";
   }
   @GetMapping("user/searchid.do")
   public String searchid() {
      return "user/searchId";
   }
   @GetMapping("user/searchpwd.do")
   public String searchidpwd() {
      return "user/searchPwd";
   }
   @GetMapping("user/notice.do")
   public String notice() {
      return "user/notice";
   }

	//수연 페이지 끝 
	
	//창혁 회원가입 , 마이페이지시작
	@GetMapping("user/join.do")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/user/insert.do")
	public String insert(UserVo vo, HttpServletRequest req) {
		if(service.insert(vo) > 0) {
		req.setAttribute("msg", "정상적으로 가입되었습니다.");
		req.setAttribute("url", "/res/user/main.do");
		} else {
		req.setAttribute("msg", "가입오류");
		}
		return "include/return";
	}
	
	@GetMapping("/user/emailCheck.do")
	public String emailCheck(Model model,@RequestParam String u_uemail) {
		model.addAttribute("result", service.emailCheck(u_uemail));
		return "include/result";
	}
	
	
	@GetMapping("user/privacy.do")
	public String privacy(Model model,UserVo vo,HttpServletRequest req,HttpSession ses) {
		user.UserVo uv= (user.UserVo)ses.getAttribute("userInfo");
		List<UserVo> list = service.getPrivacy(vo);
		model.addAttribute("list",list);
		
		return "user/privacy";
	}
	
	@RequestMapping("user/update.do")
	public String update() {
		return "";
	}

}
   