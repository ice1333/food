package hensuUserMypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import restaurant.RestaurantVo;
import user.UserVo;

@Repository
public class HensuMyDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public UserVo selectone(int rqna_no) {
		return sst.selectOne("hensuUser.Detail",rqna_no);
	}
	public int insert(VisitVo vo) {
		return sst.insert("hensuUser.visitInsert", vo);
	}
}
    