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

	public List<UserVo> selectList(UserVo vo) {
		return sqlSession.selectList("admin.userList", vo);
	}
	
	public int count(UserVo vo) {
		return sqlSession.selectOne("admin.count",vo);
	}
	
	public int delete(UserVo vo) {
		return sqlSession.selectOne("admin.delete",vo);
	}
}
