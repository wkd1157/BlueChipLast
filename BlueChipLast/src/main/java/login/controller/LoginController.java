package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
			
	@RequestMapping("/login/kakaologin.idol")
	public String test4()
	{
		return "/1/login/kakaologin";
	}
		
}


