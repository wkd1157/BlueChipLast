package idol.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IdolLoginoutController {

	
	@RequestMapping("/loginout/logintable.do")
	public String test4()
	{
		return "/1/loginout/logintable";
	}
	
}
