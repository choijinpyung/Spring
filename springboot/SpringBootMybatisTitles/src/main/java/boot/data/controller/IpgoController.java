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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {

	@Autowired
	IpgoMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "/layout/main";
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();

		int totalCount = mapper.IpgogetTotalCount();
		List<IpgoDto> list= mapper.IpgogetAllData();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//model.setViewName("ipgolist"); //jsp
		model.setViewName("/ipgo/ipgolist"); //tiles

		return model;
	}

	@GetMapping("/ipgo/ipgoform")
	public String add() {
		return "/ipgo/ipgoform";
	}

	@PostMapping("/ipgo/ipgoinsert")
	public String insert(@ModelAttribute IpgoDto dto, MultipartFile photo, HttpSession session) {
		// save 위치
		String path = session.getServletContext().getRealPath("/upload");

		if (photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			// 업로드한 파일 dto 얻기
			String originalFilename = photo.getOriginalFilename();
			// 파일 이름에 날짜 및 시간 추가
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String timestamp = sdf.format(new Date());
			String newFilename = timestamp + "_" + originalFilename;
			dto.setPhotoname(newFilename);

			try {
				photo.transferTo(new File(path + "/" + newFilename));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mapper.insertIpgo(dto);

		return "redirect:list";
	}
	
	@GetMapping("/ipgo/ipgodelete")
	public String delete(String num)
	{
		
		mapper.deleteIpgo(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/ipgo/ipgoupdateform")
	public String updateform(@RequestParam int num,
			Model model) {
		
		IpgoDto dto=mapper.IpgogetOneData(num);
		
		model.addAttribute("dto", dto);
		
		return "/ipgo/updateform";
	}
	
	@PostMapping("/ipgo/ipgoupdate")
	public String update(@ModelAttribute IpgoDto dto, MultipartFile photo, HttpSession session) {
		
		// save 위치
		String path = session.getServletContext().getRealPath("/upload");

		if (photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			// 업로드한 파일 dto 얻기
			String originalFilename = photo.getOriginalFilename();
			// 파일 이름에 날짜 및 시간 추가
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String timestamp = sdf.format(new Date());
			String newFilename = timestamp + "_" + originalFilename;
			dto.setPhotoname(newFilename);

			try {
				photo.transferTo(new File(path + "/" + newFilename));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mapper.updateIpgo(dto);

		return "redirect:list";
	}

}
