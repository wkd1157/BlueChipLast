package idol.controller;

import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import idol.crawling.DaumNewsCrawling;
import idol.dao.IdolHomeDao;
import idol.dto.IdolLinkDto;
import idol.dto.IdolMainDto;
import idol.dto.IdolYouTubeDto;
import idol.dto.ProfilePhotoURLDto;

@Controller
public class IdolHomeController {
	
	@Autowired
	IdolHomeDao IdolHomeDao;
	
	@Autowired
	DaumNewsCrawling news;

	@RequestMapping("/idolHome.idol")
	public ModelAndView IdolHome(@RequestParam String koreanname)
	{
		ModelAndView model=new ModelAndView();
		IdolMainDto IMDto= IdolHomeDao.getIMDto(koreanname);
		ProfilePhotoURLDto PPDto = IdolHomeDao.getPPDto(koreanname);
		List<IdolYouTubeDto> IYList = IdolHomeDao.getIYList(koreanname);
		IdolLinkDto ILDto = IdolHomeDao.getILDto(koreanname);
		
		Vector<String> list=news.getNaverNews(koreanname);
		
		model.addObject("list",list);
		model.addObject("IMDto",IMDto);
		model.addObject("PPDto",PPDto);
		model.addObject("IYList",IYList);
		model.addObject("ILDto",ILDto);
		
		model.setViewName("idolhome");
		return model;
	}
	
}
