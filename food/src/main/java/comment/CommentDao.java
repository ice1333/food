package comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import util.CommonVo;

@Repository
public class CommentDao {
	
	@Autowired 
	SqlSessionTemplate sst;
	
	public List<CommentVo> adqselectList(CommentVo com){
		return sst.selectList("comment.adqselectList",com);
	}
	public int adqcominsert(CommentVo com) {
		return sst.insert("comment.adqcominsert",com);
	}
	public int adqdelete(int c_no) {
		return sst.delete("comment.adqdelete",c_no);
	}
	public int aqstatus(int aq_status) {
		return sst.selectOne("comment.aqstatus",aq_status);
	}
	public List<CommentVo> restselectList(CommentVo com){
		return sst.selectList("comment.restselectList", com);
	}
	public int restinsert(CommentVo com) {
		return sst.insert("comment.restinsert",com);
	}
	public int restdelete(int c_no) {
		return sst.delete("comment.restdelete",c_no);
	}
	
	public int count(CommentVo vo) {
		return sst.selectOne("comment.count",vo);
	}

	public List<CommentVo> selectList(CommentVo vo) {
		return sst.selectList("comment.selectList",vo);
	}
   
	public int adcdelete(CommonVo vo) {
		return sst.delete("comment.adcdelete", vo);
	}

}
