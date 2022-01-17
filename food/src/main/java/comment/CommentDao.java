package comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
