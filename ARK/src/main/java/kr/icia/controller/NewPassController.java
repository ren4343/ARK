package kr.icia.controller;
import javax.inject.Inject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import kr.icia.domain.NewpassVO;
import kr.icia.mapper.IdPwMapper;
import kr.icia.service.FindUtil;
import kr.icia.service.MailUtilService;
import kr.icia.service.NewMemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class NewPassController {
	@Inject
	IdPwMapper idpw;
	
//	MemberController mem;
	
	
	@Inject
	NewMemberService service;
	
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pass;

	@RequestMapping(value ="/id" ,method = RequestMethod.GET)
	public void id() {
		
		
	}
	
	@RequestMapping(value ="/id" ,method = RequestMethod.POST)
	public String idPOST(@Param("email")String email,Model model)  {
		
		log.info("email= "+email);
	
		String id	= idpw.id(email);
		
		log.info("id= "+id);
		model.addAttribute("id",id);

		
		return "/id";
	}
	
	
	
	@RequestMapping(value="/newPass" , method = RequestMethod.GET)
	  public void pass() {
		
	  }
	
	@RequestMapping(value ="/newPass" , method = RequestMethod.POST)
	public String findPwd(@RequestParam("id")String id,@Param("email")String email)
			throws Exception{
		
		String newPwd = FindUtil.getNewPwd();
		
		String pw= pass.encode(newPwd);
		log.info(newPwd);
		log.info(pw);
		log.info(id);
	
		
		service.update(id,pw);
		
		String subject="[MIN-HA!]임시 비밀번호 발급 안내";
		
		String msg=""; 
		
		msg+="<div align='center' style='border:1px solid black; font-family:verdana'>";
		  
		msg+="<h3 style='color: blue;'><strong>"+id;
		msg+="님</strong>의 임시 비밀번호 입니다 로그인후 비밀번호를 변경하세요</h3>";
		msg+="<p>임시 비밀번호 :<strong>"+newPwd+"</strong></div><br/>";
		
		MailUtilService.sendMail(email,subject,msg); 
		
		return "/home";
		
	}
	
	 /*
	 * @RequestMapping(value = "/newPass" ,method = RequestMethod.POST) public void
	 * pass(Model model,String mem_email) throws Exception {
	 * 
	 * String keyCode = FindUtil.createKey(); model.addAttribute("ketCode",keyCode);
	 * 
	 * String sub = "[MIN-HA!] 비밀번호 찾기 인증코드 안내";
	 * 
	 * String msgi=""; msgi+
	 * ="<div align='center' style='border:1px solid black; font-family:verdana'>";
	 * 
	 * msgi+="<h3 style='color: blue;'>비밀번호 찾기 인증코드입니다 </h3>";
	 * msgi+="<div style='font-size:130%'>"; msgi+="비밀번호 찾기 페이지로 돌아가 인증코드<strong>";
	 * msgi+=keyCode+"</strong> 를 입력해주세요</div><br/>";
	 * mem.sendMail(mem_email,sub,msgi); }
	 */
}
