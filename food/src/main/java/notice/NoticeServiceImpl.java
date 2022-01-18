package notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public int count(NoticeVo vo) {
		return noticeDao.count(vo);
	}
	
	@Override
	public List<NoticeVo> selectList(NoticeVo vo) {
		return noticeDao.selectList(vo);	
	}
	@Override
	public int insert(NoticeVo vo) {
		return noticeDao.insert(vo);
	}
	
	@Override
	public NoticeVo view(int n_no) {
		noticeDao.updateN_readcount(n_no);
		return noticeDao.selectOne(n_no);
	}
	@Override
	public NoticeVo edit(int n_no) {
		return noticeDao.selectOne(n_no);
	}
	@Override
	public int update(NoticeVo vo) {
		return noticeDao.update(vo);
	}
	@Override
	public int delete(NoticeVo vo) {
		return noticeDao.delete(vo);
	}

	@Override //체크삭제
	public int checkDelete(String n_no) {
		return noticeDao.checkDelete(n_no);
	}
}
