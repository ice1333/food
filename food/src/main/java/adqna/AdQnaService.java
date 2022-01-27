package adqna;

import java.util.List;

public interface AdQnaService {

	
	//해당페이지 10개만 보이게
	List<AdQnaVo> selectList(AdQnaVo vo);
	
	//삭제
	int delete(AdQnaVo vo);
	
	//선택삭제
	int adqnadelete(String adqna_no);
	
	//총갯수
	int adqnacount(AdQnaVo vo);
	
	//상세
	AdQnaVo no_select(int adqna_no);
	
	
	AdQnaVo edit(int adqna_no);
	
	//유저이름 가져오기
	AdQnaVo adqnaName(String u_no);
	
	int adqnaUpdate(AdQnaVo vo);
	
	int adqnainsert(AdQnaVo vo);
	
}
