package Spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {

	@GetMapping("/happy")
	public String quiz1() {
		
		return "quiz1";
	}
	/*
	@GetMapping
	public ModelAndView quiz2() {
			
			ModelAndView mav=new ModelAndView();
			
			mav.addObject("quiz2", "퀴즈2");
			return mav;
		}
	
	@GetMapping
	public ModelAndView quiz3() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("quiz3", "퀴즈3");
		return mav;
	}
	
	@GetMapping
	public ModelAndView quiz4() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("quiz4", "퀴즈4");
		mav.addObject("name", "최진평");
		mav.addObject("age", "27");
		mav.addObject("addr", "경기도 부천시");
		return mav;
	}
	*/
}
