package admin;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface AdminService {

	public boolean login(AdminVo vo,HttpSession session);
	
	public List<UserVo> selectList(UserVo vo);
	
	public int count(UserVo vo);
	
	public int delete(String u_no);
	
}
