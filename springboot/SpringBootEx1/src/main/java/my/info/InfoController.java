package my.info;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InfoController {

	@GetMapping("/my/info")
	public @ResponseBody Map<String, String> read() {
		
		Map<String, String> map=new HashMap<>();
		
		map.put("name", "최진평");
		map.put("age", "27");
		map.put("addr", "경기도 부천시");
		
		return map;
	}
}
