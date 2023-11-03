package Spring.mvc.pyung;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping("/")
	public String start() {
		
		return "start"; //return "form"
	}
	
	@GetMapping("/login/form")
	public String form() {
		
		return "form";
	}
	
	@GetMapping("/login/read")
	public String process(Model model, @RequestParam(value = "myid") String id,
			@RequestParam(value = "mypass") String pass) {
		
		model.addAttribute("id", id);
		String msg="";
		
		if(pass.equals("1234"))
			msg="로그인 성공";
		else
			msg="로그인 실패";
		
		model.addAttribute("msg", msg);
		
		return "result";
	}
}
