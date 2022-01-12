package admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao dao;
	
	@Override
	public boolean login(AdminVo vo, HttpSession sess) {
		AdminVo av = dao.login(vo);
		if (av != null) { // 로그인 성공
			sess.setAttribute("adminInfo", av);
			return true;
		}
		return false;
	}

	@Override
	public List<UserVo> userList(UserVo vo) {
		return dao.userList(vo);
	}


	@Override
	public int userDelete(String u_no) {
		return dao.userDelete(u_no);
	}

	@Override
	public int adminDelete(String A_no) {
		return dao.adminDelete(A_no);
	}

	@Override
	public List<AdminVo> adminList(AdminVo vo) {
		return dao.adminList(vo);
	}

	@Override
	public int userCount(UserVo vo) {
		return dao.userCount(vo);
	}

	@Override 
	public int adminCount(AdminVo vo) {
		return dao.adminCount(vo);
	}


	
}
