package kr.icia.service;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.NewpassVO;

public interface NewMemberService {

	public void insert(NewMemberVO member);
	
	public void insert2(NewMemberVO member);
	
	public int  userIdCheck(@Param("id")String id);
	
	public void update(String id,String pw);
	
	public void img(NewMemberVO member);
}
