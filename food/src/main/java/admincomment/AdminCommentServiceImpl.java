package admincomment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminCommentServiceImpl implements AdminCommentService {

	@Autowired
	AdminCommentDao dao;


	@Override
	public List<AdminCommentVo> selectList(AdminCommentVo vo) {
		return dao.selectList(vo);
	}

	@Override
	public int count(AdminCommentVo vo) {
		return dao.count(vo);
	}

	@Override
	public int admincommentDelete(String adc_no) {
		return dao.sqlSession.delete(adc_no);
	}
	
}
