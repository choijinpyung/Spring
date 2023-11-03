package Spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	
	//@GetMapping("/apple/list.do") //list뒤에 .do나 다른 확장자를 붙이던 다 호출됨
	@GetMapping("/apple/list")
	public String result1(Model model) {
		
		model.addAttribute("name", "최진평");
		model.addAttribute("age", "27");
		return "result1";
		
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		
		//ModelAndView는 request에 저장하기 위한 Model과
		//포워드 하기 위한 View를 합쳐놓은 클래스
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("java", 88);
		mview.addObject("spring", 99);
		
		//포워드 할 jsp 파일지정
		mview.setViewName("result2");
		
		return mview;
	}
	
	@GetMapping("/orange/delete")
	public ModelAndView orange() {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("sang", "후리스");
		mview.addObject("price", 30000);
		mview.addObject("color", "black");
		
		mview.setViewName("result3");
		
		return mview;
	}
	
	@GetMapping("/shop/detail")
	public String resImage() {
		
		return "result4";
	}
	
	@GetMapping("/board/insert/data")
	public String webinfImage() {
		
		return "result5";
	}
	
}
