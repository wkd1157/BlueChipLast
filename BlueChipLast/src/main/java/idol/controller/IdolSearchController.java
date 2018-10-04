package idol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import idol.dao.IdolSearchDao;
import idol.dto.IdolMainDto;
import idol.dto.ProfilePhotoURLDto;

@Controller
public class IdolSearchController {
	
	@Autowired
	IdolSearchDao IdolSearchDao;
	
	@RequestMapping("/idolNameSearch.idol")
	public ModelAndView IdolNameSearch(@RequestParam String name)
	{
	
		ModelAndView model=new ModelAndView();
		List<IdolMainDto> IMList= IdolSearchDao.getNameIMList(name);
		List<ProfilePhotoURLDto> PPList = IdolSearchDao.getNamePPList(name);
		
		model.addObject("IMList",IMList);
		model.addObject("PPList",PPList);
		
		model.setViewName("/1/idollist/idolsearch");
				
		return model;
		
	}
	
	@RequestMapping("/idolEntSearch.idol")
	public ModelAndView IdolEntSearch(@RequestParam String name)
	{
	
		ModelAndView model=new ModelAndView();
		List<IdolMainDto> IMList= IdolSearchDao.getEntIMList(name);
		List<ProfilePhotoURLDto> PPList = IdolSearchDao.getEntPPList(name);
		
		model.addObject("IMList",IMList);
		model.addObject("PPList",PPList);
		
		model.setViewName("/1/idollist/idolsearch");
				
		return model;
		
	}
	
	@RequestMapping("/idolDebutYearSearch.idol")
	public ModelAndView IdolDebutYearSearch(@RequestParam String name)
	{
	
		ModelAndView model=new ModelAndView();
		List<IdolMainDto> IMList= IdolSearchDao.getDebutYearIMList(name);
		List<ProfilePhotoURLDto> PPList = IdolSearchDao.getDebutYearPPList(name);
		
		model.addObject("IMList",IMList);
		model.addObject("PPList",PPList);
		
		model.setViewName("/1/idollist/idolsearch");
				
		return model;
		
	}
	
}
