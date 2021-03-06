package comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	
	@Autowired
	CommentDao dao;
	
	public List<CommentVo> adqselectList(CommentVo com){
		return dao.adqselectList(com);
	}
	public int adqcominsert(CommentVo com) {
		return dao.adqcominsert(com);
	}
	public int adqdelete(int c_no) {
		return dao.adqdelete(c_no);
	}
	public List<CommentVo> restselectList(CommentVo com){
		return dao.restselectList(com);
	}
	public int restinsert(CommentVo com) {
		return dao.restinsert(com);
	}
	public int restdelete(int c_no) {
		return dao.restdelete(c_no);
	}
	public List<CommentVo> selectList(CommentVo vo) {
	return dao.selectList(vo);
	}
			  
	public int count(CommentVo vo) {
	return dao.count(vo);
	}
	
	public int adcdelete(CommentVo vo) {
	return dao.adcdelete(vo);
	}
}
