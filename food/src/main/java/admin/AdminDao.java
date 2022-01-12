package admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public AdminVo login(AdminVo vo) {
		return sqlSession.selectOne("admin.login",vo);
	}

	public List<UserVo> userList(UserVo vo) {
		return sqlSession.selectList("admin.userList", vo);
	}

	public List<AdminVo> adminList(AdminVo vo) {
		return sqlSession.selectList("admin.adminList", vo);
	}
	
	public int userCount(UserVo vo) {
		return sqlSession.selectOne("admin.userCount",vo);
	}
	public int adminCount(AdminVo vo) {
		return sqlSession.selectOne("admin.adminCount",vo);
	}
	
	public int userDelete(String u_no) {
		return sqlSession.delete("admin.userDelete",u_no);
	}
	public int adminDelete(String A_no) {
		return sqlSession.delete("admin.adminDelete",A_no);
	}
	
}
