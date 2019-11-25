package kr.icia.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.NewMemberVO;
import kr.icia.service.NewMemberService;
import lombok.Setter;

@Controller
@RequestMapping("/signup/*")
public class SignupController {

	@Inject
	private NewMemberService service;
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pass;
	
	
	@RequestMapping(value = "/signup.do",method = RequestMethod.POST)
	public String signupPost(NewMemberVO vo, RedirectAttributes rttr) {
		
		String Pass = pass.encode(vo.getPass());
		vo.setPass(Pass);
		
		service.insert(vo);
		service.insert2(vo);
		service.img(vo);
		
		rttr.addAttribute("OK","sign");
		return "redirect:/customLogin";
	}
	
	
	
}
