package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.UserVO;

public interface MemberdaoMapper {

	public void imgupdate(UserVO vo);
	
	public void update(NewMemberVO vo);
	
	public List<NewMemberVO> memberList();
	
	public NewMemberVO list(@Param("id")String id);
	
	public void withdrawal(NewMemberVO vo);
	
	public NewMemberVO passCK(String id);
	
	public void deleteAuth(String id);
}
