package spring.mysql.mycar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;

	@GetMapping("/kakao/list")
	public String list(Model model) {

		int totalCount = dao.getTotalCount();

		List<MyCarDto> list = dao.getAllcars();

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);

		return "car/carlist";
	}


	@GetMapping("/kakao/writeform")
	public String carform() {

		return "car/writeform";
	}

	@PostMapping("/kakao/write")
	public String insert(@ModelAttribute("dto") MyCarDto dto) {
		
		dao.insertcar(dto);

		return "redirect:/kakao/list";
	}

	@GetMapping("/kakao/delete")
	public String delete(@RequestParam int num) {

		dao.deletecar(num);

		return "redirect:/kakao/list";
	}
	
	//model을 준건 저장하기 위해
	@GetMapping("/kakao/updateform")
	public String uform(@RequestParam String num,Model model) {
		
		MyCarDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "car/updateform";
	}
	
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute MyCarDto dto) {
		
		dao.updatecar(dto);
		
		return "redirect:/kakao/list";
	}
}
