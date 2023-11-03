package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoadController {

	@GetMapping("/road/map")
	public String map()
	{
		return "/road/map";
	}
}
