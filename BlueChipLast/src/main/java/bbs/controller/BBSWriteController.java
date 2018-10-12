package bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bbs.dao.BBSDao;
import bbs.dto.BBSDto;


@Controller
public class BBSWriteController {

	@Autowired
	BBSDao dao;

		@RequestMapping("writeform.idol")
		public String form()
		{
			return "/1/bbs/writeform";
		}
		
		@RequestMapping(value="/write.idol", method=RequestMethod.POST)
	    public String write(@ModelAttribute BBSDto dto) {
		/*	System.out.println("writer:"+dto.getWriter());
			System.out.println("s:"+dto.getSubject());*/
			
			dao.insertBBS(dto);
		        return "redirect:bbslist.idol";
		}
}
	





