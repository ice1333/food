package restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.CommentVo;

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

	@Override
	public int restaurantQnaCount(RestaurantQnaVo vo) {
		return dao.restaurantQnaCount(vo);
	}

	@Override
	public List<RestaurantQnaVo> restaurantQnaList(RestaurantQnaVo vo) {
		return dao.restaurantQnaList(vo);
	}

	@Override
	public int restaurantDelete(String r_no) {
		return dao.restaurantDelete(r_no);
	}

	@Override
	public int requestDelete(String rqna_no) {
		return dao.requestDelete(rqna_no);
	}

	@Override
	public int restinsert(RestaurantVo vo) {
		return dao.restinsert(vo);
	}

	@Override
	public RestaurantQnaVo no_select(int rqna_no) {
		return dao.selectonno_selecte(rqna_no);
	}

	@Override
	public RestaurantVo selectone(int r_no) {
		return dao.selectone(r_no);
	}

	@Override
	public int update(RestaurantVo vo) {
		return dao.update(vo);
	}

	@Override
	public List<RestaurantVo> lists(RestaurantVo vo) {
		return dao.lists(vo);
	}

	@Override
	public int restRegister(String r_no) {
		return dao.restRegister(r_no);
	}

	@Override
	public int wishinsert(WishlistVo vo) {
		return dao.wishinsert(vo);
	}

	@Override
	public int wishlistDelete(WishlistVo vo) {
		return dao.wishlistDelete(vo);
	}

	@Override
	public int wishCount(WishlistVo vo) {
		return dao.wishCount(vo);
	}
	
}
