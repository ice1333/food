package user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
