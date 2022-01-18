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
	public int delete(AdminCommentVo vo) {
		return dao.delete(vo);
	}

	@Override
	public int adcdelete(String adc_no) {
		return dao.adcdelete(adc_no);
	}
	
}
