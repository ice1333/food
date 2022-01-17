package admincomment;

import java.util.List;

public interface AdminCommentService {

	public List<AdminCommentVo> selectList(AdminCommentVo vo);
	public int admincommentDelete(String adc_no);
	public int count(AdminCommentVo vo);
}
