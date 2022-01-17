package restaurant;

import java.util.List;

public interface RestaurantService {
	
	public List<RestaurantVo> restaurantList(RestaurantVo vo);
	
	public int restaurantCount(RestaurantVo vo);
	
}
