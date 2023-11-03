package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@RestController
public class RestLoginController {

	@Autowired
	MemberMapperInter mapper;
	
	@GetMapping("/member/login")
	public Map<String, String> loginprocess(String id,String pass,HttpSession session)
	{
		Map<String, String> map=new HashMap<>();
		
		map.put("id", id);
		map.put("pass", pass);
		
		int result=mapper.loginPassCheck(map);
		
		if(result==1)
		{
			session.setMaxInactiveInterval(60*60*4);
			
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			MemberDto mdto=mapper.getDataById(id);
			session.setAttribute("myname", mdto.getName());

		}
		
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	
	@GetMapping("/member/logout")
	public void logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("myname");
	}
}
