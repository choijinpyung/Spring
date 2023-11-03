package data.model.movie;

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

import data.model.dto.MovieDto;
import data.model.mapper.MovieMapperInter;

@Controller
public class MovieController {

	@Autowired
	MovieMapperInter mapper;

	@GetMapping("/movie/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
	    List<MovieDto> list = mapper.getAlldata();
	    
	    model.addObject("list", list);
	    
	    model.setViewName("movie/movielist");
	    
	    return model;
	}

	@GetMapping("/movie/writeform")
	public String add() {
		return "/movie/addform";
	}

	@PostMapping("/movie/insert")
	public String insert(@ModelAttribute MovieDto dto,
			MultipartFile photo,
			HttpSession session) {
		String path = session.getServletContext().getRealPath("/moviephoto");

		if (photo.isEmpty()) {
			dto.setMv_poster("no");
		}

		else {
			String originalFilename = photo.getOriginalFilename();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String timestamp = sdf.format(new Date());
			String newFilename = timestamp + "_" + originalFilename;

			// 파일 이름을 mv_poster에 저장
			dto.setMv_poster(newFilename);

			try {
				photo.transferTo(new File(path + "/" + newFilename));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		mapper.insertmovie(dto);

		return "redirect:list";
	}
	
	@GetMapping("/movie/detail")
	public String detail(@RequestParam int num,
			Model model)
	{
		MovieDto dto=mapper.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "movie/detail";
	}
}
