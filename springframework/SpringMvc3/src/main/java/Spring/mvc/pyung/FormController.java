package Spring.mvc.pyung;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Spring.data.dto.FormDto;

@Controller
public class FormController {

	// "/data/myform" 경로에 대한 매핑
    @GetMapping("/data/myform")
    public String myform() {
        // "myforms" JSP 파일을 보여줄 것입니다.
        return "myforms";
    }
	
    
    @GetMapping("/data/read1")
	public ModelAndView read1(String myname,int myage,
			@RequestParam(value="msg",defaultValue = "행복하세요 ㅋㅋ") String msg) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name", myname);
		mview.addObject("age", myage);
		mview.addObject("msg", msg);
		
		mview.setViewName("process1");
		
		return mview;
	}
    
    @PostMapping("/data/read2")
    public ModelAndView read2(@ModelAttribute FormDto dto) {
    	
    	ModelAndView model=new ModelAndView();
    	
    	model.addObject("dto", dto);
    	model.setViewName("process2");
    	
    	return model;
    }
    
    @PostMapping("/data/read3")
    public ModelAndView read3(@RequestParam Map<String, String> map)
    {
    	ModelAndView model=new ModelAndView();
    	
    	String sang=map.get("sang");
    	String price=map.get("price");
    	
    	String data=sang+"의 가격은"+price+"입니다";
    	
    	model.addObject("data", data);
    	model.setViewName("process3");
    	
    	return model;
    }
}
