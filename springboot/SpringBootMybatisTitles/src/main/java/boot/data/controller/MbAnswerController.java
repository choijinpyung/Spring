package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MbAnswerDto;
import boot.data.mapper.MbAnswerMapperInter;
import boot.data.mapper.MemBoardMapperInter;
import boot.data.mapper.MemberMapperInter;

@RestController
@RequestMapping("/mbanswer")
public class MbAnswerController {
	
	@Autowired
	MbAnswerMapperInter mapper;
	
	@Autowired
	MemBoardMapperInter mmapper;
	@Autowired
	MemberMapperInter mmmapper;
	
	@PostMapping("/ainsert")
	public void ainsert(@ModelAttribute MbAnswerDto dto,HttpSession session)
	{
		// 세션에서 아이디 가져오기
		String myid = (String)session.getAttribute("myid");
		String myname=mmmapper.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(myname);
	
		mapper.insert(dto);
	}
	
	@GetMapping("/alist")
	public List<MbAnswerDto> alist(@RequestParam String num)
	{

		
		return mapper.getAllAnswers(num);
	}
	
	@GetMapping("/adelete")
	public void adelete(@RequestParam String idx)
	{
		mapper.delete(idx);	
	}
	
	
	//수정창 content 띄우기
	@GetMapping("/updateform")
	public MbAnswerDto getData(String idx)
	{
		return mapper.getAnswer(idx);
	}
	
	//수정
	@PostMapping("/aupdate")
	public void aupdate(@ModelAttribute MbAnswerDto dto)
	{
		mapper.update(dto);
	}
}
