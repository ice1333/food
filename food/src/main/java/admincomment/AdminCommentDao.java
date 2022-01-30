package admincomment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCommentDao {

   @Autowired
   SqlSessionTemplate sqlSession;
   
   public int count(AdminCommentVo vo) {
      return sqlSession.selectOne("admincomment.count",vo);
   }

   public List<AdminCommentVo> selectList(AdminCommentVo vo) {
      return sqlSession.selectList("admincomment.selectList",vo);
   }
   
   public int delete(AdminCommentVo vo) {
      return sqlSession.delete("admincomment.delete", vo.getAdc_no());
   }
   
   public int adcdelete(String adc_no) {
      return sqlSession.delete("admincomment.adcdelete", adc_no);
   }
   
   public int mydelete(AdminCommentVo vo) {
      return sqlSession.delete("admincomment.mydelete", vo.getAdc_no());
   }
   
   public int mycdelete(String adc_no) {
      return sqlSession.delete("admincomment.mycdelete", adc_no);
   }
}