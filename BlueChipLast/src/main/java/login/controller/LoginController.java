package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
			
	@RequestMapping("/bbs/bbslist.idol")
	public String kakaologin() throws Exception
	{
		ModelAndView mav=new ModelAndView("/v1/user/me");
		mav.addObject("mav","로그인후 이용");
		return "/1/bbs/bbslist";
	}
		
}


