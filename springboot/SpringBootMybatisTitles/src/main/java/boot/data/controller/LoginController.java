package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Controller
public class LoginController {

	@Autowired
	MemberMapperInter mapper;
	
	// 로그인 페이지 호출
	@GetMapping("/login/form")
	public String loginform(HttpSession session, Model model)
	{
		
		// 세션에서 아이디 가져오기
		String myid = (String)session.getAttribute("myid");
		// 로그인 상태 확인
		String loginok = (String)session.getAttribute("loginok");
		
		// 로그인하지 않은 경우
		if(loginok == null)
			return "/login/loginform"; // 로그인 폼으로 이동
		
		// 로그인한 경우
		else
		{
			// ID를 사용하여 이름 가져오기
			String name = mapper.getName(myid);
			model.addAttribute("name", name); // 이름 모델에 추가
			return "/login/logoutform"; // 로그아웃 폼으로 이동
		}
	}
	
	// 로그인 처리
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session)
	{
		HashMap<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("pass", pass);
		
		// ID, Password 확인
		int check = mapper.loginPassCheck(map);
		
		if(check == 1) {
			session.setMaxInactiveInterval(60*60*8); // 세션 유지 시간 설정
			
			// 로그인 정보 세션에 저장
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
			// 회원 정보 가져오기
			MemberDto mdto = mapper.getDataById(id);
			session.setAttribute("loginphoto", mdto.getPhoto()); // 로그인 사진 저장
			session.setAttribute("myname", mdto.getName()); // 이름도 세션에 추가
			
			return "redirect:form"; // 로그인 성공 후 이동할 페이지
		}
		else {
			return "/member/passfail"; // 로그인 실패 시 처리
		}
	}
	
	// 로그아웃 처리
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok"); // 로그인 정보 삭제 (로그아웃)
		session.removeAttribute("myname");
		return "redirect:form"; // 로그아웃 후 이동할 페이지
	}
	
	
	// 사진만 수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoupload(String num,
			MultipartFile photo
			,HttpSession session)
	{
		//업로드할 경로
		String path=session.getServletContext().getRealPath("/membersave");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		
		String fileName=sdf.format(new Date())+photo.getOriginalFilename();
		
		//업로드
		try {
			photo.transferTo(new File(path+"/"+fileName));
			
			//db 파일 업데이트
			Map<String, String> map = new HashMap<>();
	        map.put("num", num);
	        map.put("photo", fileName);
	        mapper.updatePhoto(map);
	        
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
