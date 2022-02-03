package hensuUserMypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.UserVo;

@Service
public class HensuMyService {
	
	@Autowired
	HensuMyDao dao;
	
	public UserVo selectone(int rqna_no) {
		return dao.selectone(rqna_no);
	
	}
}
