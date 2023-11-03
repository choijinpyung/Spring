package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Controller
public class MemberController {

	@Autowired
	MemberMapperInter mapper;
	
	@GetMapping("/member/form")
	public String from()
	{
		return "/member/addform";
	}
	
	@GetMapping("/member/list")
	public ModelAndView form()
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount = mapper.MembergetTotalCount();
		List<MemberDto> list=mapper.MembergetAllData();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		model.setViewName("/member/memberlist");
		
		return model;
	}
	
	@PostMapping("/member/memberinsert")
	public String insert(@ModelAttribute MemberDto dto, MultipartFile photoname, HttpSession session) {
		// save 위치
		String path = session.getServletContext().getRealPath("/membersave");

		if (photoname.getOriginalFilename().equals("")) {
			dto.setPhoto("no");
		} else {
			// 업로드한 파일 dto 얻기
			String originalFilename = photoname.getOriginalFilename();
			// 파일 이름에 날짜 및 시간 추가
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String timestamp = sdf.format(new Date());
			String newFilename = timestamp + "_" + originalFilename;
			dto.setPhoto(newFilename);

			try {
				photoname.transferTo(new File(path + "/" + newFilename));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMember(dto);

		return "redirect:list";
	}
	
	@GetMapping("/member/memberdelete")
	public String delete(String num,HttpSession session)
	{
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		mapper.deleteMember(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/updateform")
	public String updateform(@RequestParam int num,
			Model model) {
		
		MemberDto dto=mapper.MembergetOneData(num);
		
		model.addAttribute("dto", dto);
		
		return "/member/updateform";
	}
	
	@PostMapping("/member/memberupdate")
	public String update(@ModelAttribute MemberDto dto, MultipartFile photoname, HttpSession session) {
		
		// save 위치
		String path = session.getServletContext().getRealPath("/membersave");

		if (photoname.getOriginalFilename().equals("")) {
			dto.setPhoto("no");
		} else {
			// 업로드한 파일 dto 얻기
			String originalFilename = photoname.getOriginalFilename();
			// 파일 이름에 날짜 및 시간 추가
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String timestamp = sdf.format(new Date());
			String newFilename = timestamp + "_" + originalFilename;
			dto.setPhoto(newFilename);

			try {
				photoname.transferTo(new File(path + "/" + newFilename));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mapper.updateMember(dto);

		return "redirect:list";
	}
	
	@GetMapping("/member/myinfo")
	public ModelAndView myinfo()
	{
		ModelAndView model=new ModelAndView();
		
		List<MemberDto> list=mapper.MembergetAllData();
		
		model.addObject("list", list);
		
		model.setViewName("/member/myinfo");
		
		return model;
	}
	
	@GetMapping("/member/myinfodelete")
	public String myinfodelete(String num,HttpSession session)
	{
		
		//파일 지우기
		
		String path = session.getServletContext().getRealPath("/membersave");
		String photo = mapper.getDataByNum(num).getPhoto();
		File file=new File(path+"/"+photo);
		file.delete();
		
		mapper.deleteMember(num);
		
		//세션 삭제
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("saveok");
		
		return "redirect:list";
	}
	
	@GetMapping("/member/myinfomodal")
	@ResponseBody
	public MemberDto myinfomodal(String num)
	{
		return mapper.getDataByNum(num);
	}
	
	@PostMapping("/member/myinfoupdate")
	@ResponseBody
	public void myinfoupdate(MemberDto dto,HttpSession session)
	{	
		session.setAttribute("myname", dto.getName());
		mapper.updateMyInfo(dto);
	}
	
}
