package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.UserVO;
import kr.icia.mapper.MemberdaoMapper;
import kr.icia.mapper.ShopMapper;


@Service
public class MemberdaoServiceImpl implements MemberdaoService {

	@Inject
	private MemberdaoMapper mapper;
	
	@Inject
	private ShopMapper ma;
	
	@Override
	public void imgupdate(UserVO vo) {
		
		mapper.imgupdate(vo);
	}

	@Override
	public void update(NewMemberVO vo) {
		mapper.update(vo);

	}

	@Override
	public List<NewMemberVO> memberList() {
	
		return mapper.memberList();
	}

	@Override
	public NewMemberVO list(@Param("id")String id) {
	
		return mapper.list(id);
		
	}
	@Override
	public void withdrawal(NewMemberVO vo) {
		mapper.withdrawal(vo);
		
	}

	@Override
	public NewMemberVO passCK(String id) {
		mapper.deleteAuth(id);
		ma.cartAllDelete(id);
		
		
	return	mapper.passCK(id);
		
	}


}
