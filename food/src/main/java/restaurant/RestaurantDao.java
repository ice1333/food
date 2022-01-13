package restaurant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.UserVo;

@Repository
public class RestaurantDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<RestaurantVo> restaurantList(RestaurantVo vo) {
		return sqlSession.selectList("restaurant.restaurantList", vo);
	}
	public int restaurantCount(RestaurantVo vo) {
		return sqlSession.selectOne("restaurant.restaurantCount",vo);
	}
}
