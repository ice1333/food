package hensuUserMypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import restaurant.RestaurantVo;
import user.UserVo;

@Service
public class HensuMyService {
	
	@Autowired
	HensuMyDao dao;
	
	public UserVo selectone(int rqna_no) {
		return dao.selectone(rqna_no);
	
	}
	public int insert(VisitVo vo) {
		return dao.insert(vo);
	}
	public List<VisitVo> mylist(VisitVo vo){
		return dao.myList(vo);
	}
	public int restaurantCount(VisitVo vo) {
		return dao.myListCount(vo);
	}
}
