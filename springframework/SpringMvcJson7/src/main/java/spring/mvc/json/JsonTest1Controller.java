package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTest1Controller {

	@GetMapping("/list1")
	@ResponseBody //json 처리 후 브라우저로 출력(일반 컨트롤러일경우)
	public Map<String, String> list1() {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "최진평");
		map.put("hp", "010-1234-5678");
		map.put("addr", "경기도 부천시");
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3() {
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("샌드위치", "1.jpg"));
		list.add(new PhotoDto("꼬치", "2.jpg"));
		list.add(new PhotoDto("육개장", "3.jpg"));
		list.add(new PhotoDto("하이라이스", "4.jpg"));
		list.add(new PhotoDto("콘치즈", "5.jpg"));
		
		return list;
	}
}
