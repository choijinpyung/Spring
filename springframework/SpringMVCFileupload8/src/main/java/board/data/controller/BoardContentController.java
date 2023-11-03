package board.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import answer.data.AnswerDao;
import answer.data.AnswerDto;
import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardContentController {

		@Autowired
		BoardDao dao;
		
		@Autowired
		AnswerDao adao;
		
		@GetMapping("/board/content")
		public ModelAndView content(@RequestParam int num,
				@RequestParam int currentPage) {
			
			ModelAndView model=new ModelAndView();
			
			//조회수증가
			dao.updateReadcount(num);
			
			BoardDto dto=dao.getData(num);
			
			//num에 해당하는 댓글
			List<AnswerDto> alist=adao.getAnswerList(num);
			
			//값이 있을때만 넘겨야하므로
			model.addObject("acount", alist.size());
			model.addObject("alist", alist);
			
			model.addObject("dto", dto);
			model.addObject("currentPage", currentPage);
			
			model.setViewName("reboard/content");
			
			return model;
		}
}
