package user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import restaurant.RestaurantVo;

@Service
public class UserService {

	@Autowired
	UserDao dao;
	
	public boolean login(UserVo vo, HttpSession sess) {
		UserVo uv = dao.login(vo);
		if (uv != null) { // 로그인 성공
			sess.setAttribute("userInfo", uv);
			return true;
		}
		return false;
	}
	
	public int emailCheck(String u_uemail) {
		return dao.emailCheck(u_uemail);
	}
	
	public int insert(UserVo vo) {
		return dao.insert(vo);
	}
	
	public List<UserVo> getPrivacy(UserVo vo){
		return dao.getPrivacylist(vo);
	}
	
	public int updatePrivacy(UserVo vo) {
		return dao.updatePrivacy(vo);
	}
	
	public int logupdate(UserVo vo) {
		return dao.logupdate(vo);
	}
	public List<RestaurantVo> listselect(RestaurantVo vo){
		return dao.listselect(vo);
	}
	
}
