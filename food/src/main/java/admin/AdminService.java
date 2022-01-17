package admin;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface AdminService {

	public boolean login(AdminVo vo,HttpSession session);
	
	public List<UserVo> userList(UserVo vo);
	
	public List<AdminVo> adminList(AdminVo vo);
	
	public int userCount(UserVo vo);
	
	public int adminCount(AdminVo vo);
	
	public int userDelete(String u_no);
	
	public int adminDelete(String A_no);
	
}
