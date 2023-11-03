package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.service.MarketService;

@Controller
public class MarketController {

	/*
	@Autowired
	MarketMapperInter mapper;
	*/
	
	@Autowired
	MarketService service;
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list()
	{
		//값을 담기위해 ModelAndView 생성
		ModelAndView model=new ModelAndView();
		
		List<MarketDto> list = service.getAllData();
		
		//db로부터 총 갯수 얻기
		int totalCount=service.getTotalCount();
		
		//model에 저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//포워드
		model.setViewName("market/marketlist");
		
		return model;
	}
	
	@GetMapping("/market/writeform")
	public String writeform() 
	{
		return "market/addform";
	}
	
	@PostMapping("/market/add")
	public String add(@ModelAttribute MarketDto dto,
	                  MultipartFile photoupload,
	                  HttpSession session) {
		
	    // 업로드할 save 위치 구하기
	    String path = session.getServletContext().getRealPath("/save");

	    if (photoupload.isEmpty()) {
	        // 업로드된 파일이 없을 경우 "no" 값을 설정
	        dto.setPhotoname("no");
	    } else {
	        // 업로드한 파일 dto 얻기
	        String originalFilename = photoupload.getOriginalFilename();
	        
	        // 파일 이름에 날짜 및 시간 추가
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	        String timestamp = sdf.format(new Date());
	        String newFilename = timestamp + "_" + originalFilename;
	        dto.setPhotoname(newFilename);

	        // 실제 업로드
	        try {
	            photoupload.transferTo(new File(path + "/" + newFilename));
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	        }
	    }

	    service.insertMarket(dto);

	    return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,
			HttpServletRequest request)
	{
		
		String photo=service.getData(num).getPhotoname();
		
		if(!photo.equals(null))
		{
			String path=request.getServletContext().getRealPath("/save");
			
			File file=new File(path+"/"+photo);
			
			file.delete();
		}
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}
}
