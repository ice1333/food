package hensuUserMypage;

import java.util.List;

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
	public List<VisitVo> myList(VisitVo vo) {
		return sst.selectList("hensuUser.myList", vo);
	}
	public int visitCount(VisitVo vo) {
		return sst.selectOne("hensuUser.visitCount",vo);
	}
	public int listDelete(VisitVo vo) {
		return sst.delete("hensuUser.listDelete",vo);
	}
	public List<WishlistVo> wishList(WishlistVo vo) {
		return sst.selectList("hensuUser.myList", vo);
	}
	public int wishCount(WishlistVo vo) {
		return sst.selectOne("hensuUser.visitCount",vo);
	}
	public int wishDelete(WishlistVo vo) {
		return sst.delete("hensuUser.listDelete",vo);
	}
}
    