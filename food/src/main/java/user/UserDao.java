package user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public UserVo login(UserVo vo) {
		return sst.selectOne("user.login", vo);
	}
	
	// 이메일 중복체크
	public int emailCheck(String u_uemail) {
		return sst.selectOne("user.emailCheck", u_uemail);
	}
	
	//등록
	public int insert(UserVo vo) {
		return sst.insert("user.insert", vo);
	}
	
	//마이페이지 회원정보 수정
	public int updateTemp(UserVo vo) {
		return sst.update("user.updateTemp",vo);
	}
	
	public List<UserVo> getPrivacylist(UserVo vo){
		return sst.selectList("user.getPrivacylist",vo);
	}
	
}
