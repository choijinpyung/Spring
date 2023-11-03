package boot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.dto.PersonDto;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1() {
		
		return "form/form1";
	}
	
	//각각
	@PostMapping("/sist/read1")
	public ModelAndView read1(@RequestParam String irum,
			@RequestParam int java,
			@RequestParam int spring){
		
		ModelAndView model=new ModelAndView();
		
		model.addObject("irum", irum);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		model.setViewName("result/result1");
		
		return model;
	}
	
	@GetMapping("/sist/form2")
	public String form2() {
		
		return "form/form2";
	}
	
	//dto
	@PostMapping("/sist/write2")
	public ModelAndView read2(PersonDto dto) {
		
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", dto.getName());
		model.addObject("addr", dto.getAddr());
		model.addObject("hp", dto.getHp());
		
		model.setViewName("result/result2");
		
		return model;
	}
	
	@GetMapping("/sist/form3")
	public String form3() {
		
		return "form/form3";
	}
	
	//map으로 읽을 경우 폼의 name이 key값으로 입력값은 value
	@PostMapping("/sist/myread")
	public ModelAndView read3(@RequestParam Map<String, String> map) {
				
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", map.get("name"));
		model.addObject("blood", map.get("blood"));
		model.addObject("age", map.get("age"));
		
		model.setViewName("result/result3");
		
		return model;
	}
	
}
