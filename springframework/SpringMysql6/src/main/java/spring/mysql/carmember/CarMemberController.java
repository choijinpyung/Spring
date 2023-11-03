package spring.mysql.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberInter inter;
	
	@GetMapping("/member/list")
	public String carlistread(Model model) {
		
		//개수가져오기
		int count=inter.getTotalCount();
		
		//전체 목록 가져오기
		List<CarMemberDto> list=inter.getAllMembers();
		
		//requst에 저장
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	@GetMapping("/member/addform")
	public String memberaddform() {
		
		return "carmember/addform";
	}
	
	@PostMapping("/member/addmember")
	public String memberadd(@ModelAttribute CarMemberDto dto) {
		
		inter.insertMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/member/delete")
	public String memberremove(@RequestParam int num) {
		
		inter.deleteMember(num);
		return "redirect:list";
	}
	
	@GetMapping("/member/update")
	public String membergetdata(@RequestParam String num,Model model) {
		
		CarMemberDto dto=inter.getdata(num);
		
		model.addAttribute("dto", dto);
		
		return "carmember/updateform";
	}
	
	@PostMapping("/member/updatemember")
	public String memberupdate(@ModelAttribute CarMemberDto dto) {
		
		inter.updateMember(dto);
		
		return "redirect:list";
	}
	
}
