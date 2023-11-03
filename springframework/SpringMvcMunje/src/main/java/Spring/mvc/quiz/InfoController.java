package Spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import Spring.mvc.dto.InfoDto;


@Controller
public class InfoController {

	/*
	@GetMapping("/info/form")
	public String process1() {
		
		return "info/infoForm";
	}
	*/
	
	@GetMapping("/info/form")
	public ModelAndView process1() {
		
		ModelAndView model=new ModelAndView();
		
		model.setViewName("info/infoForm");
		
		return model;
	}
	
	@PostMapping("/info/result")
	public String process2(@ModelAttribute InfoDto dto) {
		
		return "info/infoWrite";
	}
}
