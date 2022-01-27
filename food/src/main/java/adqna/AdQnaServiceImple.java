package adqna;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdQnaServiceImple implements AdQnaService {
	
	@Autowired
	AdQnaDao adqnaDao;


	@Override //해당페이지 10개씩 만보이게
	public List<AdQnaVo> selectList(AdQnaVo vo) {
		
		return adqnaDao.adqnalist(vo);
	}

	@Override //삭제
	public int delete(AdQnaVo vo) {
		return adqnaDao.delete(vo);
	}

	@Override //총갯수
	public int adqnacount(AdQnaVo vo) {
		return adqnaDao.adqnacount(vo);
	}

	@Override //상세
	public AdQnaVo no_select(int adqna_no) {
		return adqnaDao.no_select(adqna_no);
	}

	@Override//선택삭제
	public int adqnadelete(String adqna_no) {
		
		return adqnaDao.adqnadelete(adqna_no);
	}

	
	@Override
	public AdQnaVo edit(int adqna_no) {
		return adqnaDao.adqnaOne(adqna_no);
	}
	
	@Override // 유저이름가져오기
	public AdQnaVo adqnaName(String u_name) {
		return adqnaDao.adqnaName(u_name);
	}

	

	


}
