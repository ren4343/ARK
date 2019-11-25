package kr.icia.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.icia.domain.NewpassVO;

public interface IdPwMapper {

	public String id(String email);
	
	
	public void update(@Param("id")String id,@Param("pw")String pw);
}
