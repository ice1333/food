package restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	RestaurantDao dao;

	@Override
	public List<RestaurantVo> restaurantList(RestaurantVo vo) {
		return dao.restaurantList(vo);
	}
	
	@Override
	public int restaurantCount(RestaurantVo vo) {
		return dao.restaurantCount(vo);
	}
	
}
