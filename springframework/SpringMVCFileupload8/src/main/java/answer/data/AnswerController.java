package answer.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AnswerController {

	@Autowired
	AnswerDao adao;

	@PostMapping("/board/ainsert")
	public String answerinsert(@ModelAttribute AnswerDto dto, @RequestParam String currentPage) {

		adao.insertAnswer(dto);

		return "redirect:content?num=" + dto.getNum() + "&currentPage=" + currentPage;
	}
	
}
