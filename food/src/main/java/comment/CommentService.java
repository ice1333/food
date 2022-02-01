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
}
