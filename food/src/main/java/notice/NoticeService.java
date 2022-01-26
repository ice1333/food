package notice;

import java.util.List;

public interface NoticeService {
	
	List<NoticeVo> selectList(NoticeVo vo);
	int count(NoticeVo vo);
	int insert(NoticeVo vo);
	NoticeVo view(int n_no);
	NoticeVo edit(int n_no);
	int update(NoticeVo vo);
	int delete(NoticeVo vo);
	//체크삭제
	int checkDelete(String n_no);
	
	//유저
	List<NoticeVo> selectList2(NoticeVo vo);
	int count2(NoticeVo vo);
	NoticeVo view2(int n_no);
}
