package admincomment;

import java.util.List;

public interface AdminCommentService {

   public List<AdminCommentVo> selectList(AdminCommentVo vo);
   public int count(AdminCommentVo vo);
   public int delete(AdminCommentVo vo);
   public int adcdelete(String adc_no);
   public int mycdelete(String adc_no);
   public int mydelete(AdminCommentVo vo);
   
}