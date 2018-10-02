package idol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import idol.dao.IdolListDao;
import idol.dto.IdolMainDto;
import idol.dto.ProfilePhotoURLDto;

@Controller
public class IdolListController {
	
	@Autowired
	IdolListDao IdolListDao;
	
	@RequestMapping("/idolList.idol")
	public ModelAndView IdolList()
	{
		ModelAndView model=new ModelAndView();
		List<IdolMainDto> IMList= IdolListDao.getIMList();
		List<ProfilePhotoURLDto> PPList = IdolListDao.getPPList();
		
		model.addObject("IMList",IMList);
		model.addObject("PPList",PPList);
		
		model.setViewName("idollist");
		return model;
	}

}
