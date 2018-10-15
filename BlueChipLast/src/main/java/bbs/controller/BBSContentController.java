package bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bbs.dao.BBSDao;
import bbs.dto.AnswerDto;
import bbs.dto.BBSDto;

@Controller
public class BBSContentController {

	@Autowired
	private BBSDao dao;
	
	@RequestMapping("content.idol")
	public ModelAndView content(@RequestParam int num,@RequestParam int pageNum) //같아서 생략
	{
		ModelAndView model=new ModelAndView();
		//readcount 증가후
		dao.updateReadcount(num);
		
		//출력할 데이터를 가져온다
		BBSDto dto=dao.getData(num);
		
	//해당 글에 대한 댓글을 보낸다
		List<AnswerDto> alist=dao.getAnswer(num);
		model.addObject("alist", alist); //댓글목록
		model.addObject("acount", alist.size()); //댓글수
			
		model.addObject("dto",dto);
		model.addObject("pageNum", pageNum);
		model.setViewName("/1/bbs/content");
		return model;
	}
	
	@RequestMapping("answer1.idol")
	public String answer3(
			@ModelAttribute AnswerDto adto,
			@RequestParam int pageNum)
	{
		System.out.println("num="+adto.getNum());
		dao.insertAnswer(adto);
		return "redirect:content.idol?num="+adto.getNum()+"&pageNum="+pageNum;		
	}
	
	@RequestMapping("delete.idol")
	public String delete(@ModelAttribute BBSDto dto)
	{
		dao.deletebbs(dto);
		return "redirect:bbslist.idol";
	}
	
	@RequestMapping("answerdelete.idol")
	public String answerdelete(@RequestParam int idx, @RequestParam int num,
			@RequestParam int pageNum)
	{
		dao.answerdelete(idx);
		return "redirect:content.idol?num="+num+"&pageNum="+pageNum;
	}
	
	@RequestMapping("updateform.idol")
	public ModelAndView updateform(@RequestParam int num ,@RequestParam int pageNum)
	{
		BBSDto bdto=dao.getData2(num);
		ModelAndView model=new ModelAndView();
		model.addObject("dto",bdto);
		model.setViewName("/1/bbs/updateform");
		model.addObject("pageNum",pageNum);
		return model;
	}
	
		
	@RequestMapping(value="/update.idol", method=RequestMethod.POST)
    public String update(@ModelAttribute BBSDto dto,@RequestParam int pageNum) {
		/*System.out.println("writer:"+dto.getWriter());
		System.out.println("s:"+dto.getSubject());*/
		
		dao.updatebbs(dto);
	    return "redirect:bbslist.idol?pageNum="+pageNum;
	}
}
