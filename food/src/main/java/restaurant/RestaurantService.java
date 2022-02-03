package restaurant;

import java.util.List;

public interface RestaurantService {
	
	public List<RestaurantVo> restaurantList(RestaurantVo vo);
	
	public int restaurantCount(RestaurantVo vo);
	
	public int restaurantQnaCount(RestaurantQnaVo vo);

	public List<RestaurantQnaVo> restaurantQnaList(RestaurantQnaVo vo);

	public int restaurantDelete(String r_no);
	
	public int requestDelete(String rqna_no);
	
	public int restinsert(RestaurantVo vo);
	
	RestaurantQnaVo no_select(int rqna_no);
	
	public RestaurantVo selectone(int r_no);
	int update(RestaurantVo vo);
}
