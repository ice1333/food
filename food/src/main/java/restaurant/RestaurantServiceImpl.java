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
	
}
