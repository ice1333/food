package restaurant;

import java.util.List;

import comment.CommentVo;

public interface RestaurantService {
	
	public List<RestaurantVo> restaurantList(RestaurantVo vo);
	
	public int restaurantCount(RestaurantVo vo);
	
	public int restaurantQnaCount(RestaurantQnaVo vo);

	public List<RestaurantQnaVo> restaurantQnaList(RestaurantQnaVo vo);

	public int restaurantDelete(String r_no);
	
	public int restRegister(String r_no);
	
	public int requestDelete(String rqna_no);
	
	public int restinsert(RestaurantVo vo);
	
	RestaurantQnaVo no_select(int rqna_no);
	
	public RestaurantVo selectone(int r_no);
	
	int update(RestaurantVo vo);
	
	public List<RestaurantVo> lists(RestaurantVo vo);
	
	public int wishinsert(WishlistVo vo);
	
	public int wishlistDelete(WishlistVo vo);
	
	public int wishCount(WishlistVo vo);
	
}
