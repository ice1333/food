package notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(NoticeVo vo) {
		return sqlSessionTemplate.selectOne("notice.count", vo);
	}
	
	public List<NoticeVo> selectList(NoticeVo vo) {
		return sqlSessionTemplate.selectList("notice.selectList",vo);
	}
	
	public int insert(NoticeVo vo) {
		int r = -1;
		try {
			r= sqlSessionTemplate.insert("notice.insert", vo);
		} catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}	
	public NoticeVo selectOne(int n_no) {
		return sqlSessionTemplate.selectOne("notice.selectOne", n_no);		
	}
		
	public int updateN_readcount(int n_no) {
		return sqlSessionTemplate.update("notice.updateN_readcount", n_no);		
	}
	
	public int update(NoticeVo vo) {
		return sqlSessionTemplate.update("notice.update", vo);
	}
	
	public int delete(NoticeVo vo) { //view 페이지에서
		return sqlSessionTemplate.delete("notice.delete", vo.getN_no());
	}
	//체크박스 선택삭제
	public int checkDelete(String n_no) {
		return sqlSessionTemplate.delete("notice.checkDelete", n_no);
	}
	

}
