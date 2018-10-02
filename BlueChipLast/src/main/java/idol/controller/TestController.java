package idol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@RequestMapping("/main.idol")
	public String test1()
	{
		return "main";
	}
	
	@RequestMapping("/board/test1.do")
	public ModelAndView test2()
	{
		ModelAndView model=new ModelAndView();
		model.addObject("data","Resolver-tiles");
		model.setViewName("/1/view/result1");
		return model;
	}
	
	@RequestMapping("/board/test4.do")
	public ModelAndView test5()
	{
		ModelAndView model=new ModelAndView();
		model.addObject("data1","Have a Good Time!!!!");
		model.addObject("data2","안녕하세요<br> 오늘은 즐거운 금욜입니다");
		model.setViewName("/2/view/body1/body2");
		return model;
	}
	
	@RequestMapping("/board/test2.pop")
	public ModelAndView test3()
	{
		ModelAndView model=new ModelAndView();
		model.addObject("data","Resolver-jsp 전체화면");
		model.setViewName("view/result2");
		return model;
	}
	
	@RequestMapping("/board/test3.action")
	public String test4()
	{
		return "view/result3";
	}
	
}
