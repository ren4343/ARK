package kr.icia.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.UserVO;

import kr.icia.service.MemberdaoService;
import kr.icia.service.UploadFileUtils1;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

@Setter(onMethod_=@Autowired)
private MemberdaoService service;
	
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

	
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder capass;
	
	
	@RequestMapping(value = "/member/mypage",method = RequestMethod.GET)
	public void mypage(String id, Model mo) throws Exception{
	log.info("id는 "+id);
	
	log.info("image : "+service.list(id));
	
	mo.addAttribute("list",service.list(id));
	
	}
	@RequestMapping(value = "/member/mypage",method = RequestMethod.POST)
	public String myPage(NewMemberVO vo,UserVO uvo,MultipartFile file) throws Exception{
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils1.calcPath(imgUploadPath);
		String RimgUploadPath=imgUploadPath.replace("\\", "/");
		
		log.info("파일은 "+file);
		log.info("저장된 이미지 경로는"+imgUploadPath);
		log.info("병경된 저장된 이미지 경로는"+RimgUploadPath);
		log.info("날짜 "+ymdPath);
		String fileName = null;

		if(file !=null) {
		 fileName = UploadFileUtils1.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
	
		} else {
	
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		uvo.setGdsimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		uvo.setGdsthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	String Rdsthumbimg =	uvo.getGdsthumbimg().replace("\\", "/");
	uvo.setGdsthumbimg(Rdsthumbimg);
	
		uvo.setId(vo.getId());
		
		service.imgupdate(uvo);
		
		vo.setUserimg(uvo.getGdsthumbimg());
		
	String pass =	capass.encode(vo.getPass());
		vo.setPass(pass);
		
		service.update(vo);
		
		
		
		return "/home";
	}
	
	// 회원 탈퇴 get
		@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
		public void getWithdrawal() throws Exception {
		
		 
		}
		
		
		@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
		public String die(NewMemberVO vo,Model mo ,HttpSession session) throws Exception {
			vo.getPass();

	 String id = vo.getId();
	 NewMemberVO rogin = service.passCK(id);
	 
	  boolean OKpass = capass.matches(vo.getPass(), rogin.getPass());
	 
			if(OKpass) {
			vo.setPass(rogin.getPass());
			service.withdrawal(vo);
			session.invalidate();
			
			return "redirect:/";
			}
			
			mo.addAttribute("ko" , 1);
		 
			return "/withdrawal";
		}
		
}
