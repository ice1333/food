package admincomment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCommentDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int count(AdminCommentVo vo) {
		return sqlSession.selectOne("admincomment.count",vo);
	}

	public List<AdminCommentVo> selectList(AdminCommentVo vo) {
		return sqlSession.selectList("admincomment.selectList",vo);
	}
	
	
}
