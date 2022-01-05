package admin;

import javax.servlet.http.HttpSession;

public interface AdminService {

	public boolean login(AdminVo vo,HttpSession session);
}
