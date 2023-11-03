package spring.mvc.friday;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	
	@Autowired
	InfoInter inter;
	
	@GetMapping("/info/list")
	public ModelAndView info1(@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false)String search) {
		
		ModelAndView mv = new ModelAndView();
		
		int totalcount = inter.getTotalCount();
		//List<InfoDto> list = inter.getAllInfos();
		
		System.out.println(title+","+search);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("title", title);
		
		List<InfoDto> list=inter.getAllInfos(map);
		
		mv.addObject("totalcount",totalcount);
		mv.addObject("list",list);
		//mv.addObject("search",search);
		//mv.addObject("title",title);
		
		mv.setViewName("info/infoList");
		
		return mv;
	}
	
	@GetMapping("/info/addform")
	public String form() {
		return "info/addForm";
	}
	
	
	@PostMapping("/info/insert")
	public String insert(
			@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) { //session�� realpath ������ �ִ� �� �̴�.
		
		String path = session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		
		SimpleDateFormat sdf=  new SimpleDateFormat("yyyyMMdd HHmmss");

		String photo = "";
		
		if(upload.getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			String fName = upload.getOriginalFilename();
			fName = sdf.format(new Date()) + "_" + fName;
			photo=fName;
			
			//���ε�
			try {
				upload.transferTo(new File(path+"/"+photo));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//dto�� photo�� �ֱ�
		dto.setPhoto(photo);
		
		//insert
		inter.insertMyInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/delete")
	public String delete (@RequestParam int num) {
		
		inter.delectMyInfo(num);
		return "redirect:list";
	}
	
	@GetMapping("/info/uform")
	public String uform(@RequestParam String num,Model model) {
		
		InfoDto dto=inter.getOneInfo(num);
		
		model.addAttribute("dto", dto);
		
		return "info/updateForm";
	}
	
	@PostMapping("/info/update")
	public String update(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/resources/image/");
		
		String photoname; //dto에 담을 변수
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd HHmmss");
		
		//사진 선택 안할경우 null
		if(upload.getOriginalFilename().equals(""))
			photoname=null;
		
		else {
			
			photoname=upload.getOriginalFilename();
			photoname=sdf.format(new Date()) + "_" + photoname;
			
			//업로드
			try {
				upload.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto의 photo에 업로드한 photoname 넣어주기
		dto.setPhoto(photoname);
		
		//update
		inter.updateMyInfo(dto);
		
		return "redirect:list";
	}
	
}
