package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JsonTest2Controller {

	@GetMapping("/list2")
	public Map<String, String> list2() {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("sang", "컴퓨터");
		map.put("price", "50000");
		map.put("su", "4");
		
		return map;
	}
	
	@GetMapping("/list4")
	public Map<String, Object> list4(@RequestParam String name) {
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("샌드위치", "1.jpg"));
		list.add(new PhotoDto("꼬치", "2.jpg"));
		list.add(new PhotoDto("육개장", "3.jpg"));
		list.add(new PhotoDto("하이라이스", "4.jpg"));
		list.add(new PhotoDto("콘치즈", "5.jpg"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("name", "없는메뉴");
		map.put("photo", "6.jpg");
		
		for(PhotoDto dto:list)
		{
			if(name.equals(dto.getName()))
			{
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		return map;
	}
}
