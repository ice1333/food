package usermypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import admincomment.AdminCommentService;
import admincomment.AdminCommentVo;
import user.UserService;
import user.UserVo;
import util.CommonUtil;

@Controller
public class UserMyPageController {

   @Autowired
   AdminCommentService service;
   
   @GetMapping("user/mypage/myComment")
   public String userList1(UserVo uvo, HttpSession sess, Model model, AdminCommentVo vo) {
      vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
      System.out.println("uvo :"+uvo.getU_no());
      
      int totCount = service.count(vo);
      int totPage = totCount / 10; //총페이지수 
      if(totCount % 10 > 0) totPage++;
      
      int startIdx = (vo.getPage()-1)*10;
      vo.setStartIdx(startIdx);
      
      List<AdminCommentVo> list = service.selectList(vo);
      model.addAttribute("list",list);
      model.addAttribute("totPage",totPage);      
      model.addAttribute("totCount",totCount);
      model.addAttribute("PageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
      
      return "user/myComment";      
   }
   
   @RequestMapping("mycomment/mycommentdelAjax.do")
   public String delAjax(HttpServletRequest req, Model model, AdminCommentVo vo) {
      
      String[] Msg = req.getParameterValues("valueArr");
      int size = Msg.length;
      for(int i=0; i<size; i++) {
         service.adcdelete(Msg[i]);
      }
      return "admin/include/result";
   }
   @GetMapping("mycomment/mydelete.do") 
   public String delete(Model model, AdminCommentVo vo) {
      model.addAttribute("vo",service.delete(vo));
      return "user/myComment";
   }
   
   
}