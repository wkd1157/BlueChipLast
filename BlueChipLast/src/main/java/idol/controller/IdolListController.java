package idol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import idol.dao.IdolListDao;
import idol.dto.IdolMainDto;
import idol.dto.ProfilePhotoURLDto;

@Controller
public class IdolListController {

	@Autowired
	IdolListDao IdolListDao;

	@RequestMapping("/idolList.idol")
	public ModelAndView IdolList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum)
	{
		ModelAndView model=new ModelAndView();


		//페이징에 처리에 필요한 변수들
		int totalCount = IdolListDao.getTotalCount();//총 개시글의 개수
		int perPage = 9; // 한페이지당 보여지는 글의 갯수
		// int perBlock = 5; // 한블럭당 보여지는 페이지번호의 수
		int totalPage; // 총 페이지의 갯수
		int startNum; // 한페이지당 보여지는 시작번호
		int endNum; // 한페이지당 보여지는 끝번호
		int startPage; // 한 블럭당 보여지는 시작페이지번호
		int endPage; // 한 블럭당 보여지는 끝페이지번호
		int no; // 게시글에 붙일 시작번호

		List<IdolMainDto> IMList = null;
		List<ProfilePhotoURLDto> PPList = null;

		// 총 페이지수
		totalPage = (totalCount / perPage) + (totalCount % perPage > 0 ? 1 : 0);
		// 각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum = (pageNum - 1) * perPage + 1;
		endNum = startNum + perPage - 1;
		// 예를 들어 모두 45개의 글이 있을경우
		// 마지막 페이지는 endnum 이 45 가 되야함
		if (endNum > totalCount)
			endNum = totalCount;

		// 각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
		startPage = pageNum;
		endPage = pageNum;
		
			
		// 예를 들어 총 34페이지일경우
		// 마지막 블럭은 30-34 만 보여야함
		if (endPage > totalPage)
			endPage = totalPage;

		// 각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no = (pageNum - 1) * perPage + 1;
		//해당페이지에 보여줄 게시판 목록

		//request 에 담을 값들
		model.addObject("pageNum", pageNum);
		model.addObject("no", no);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);


		IMList = IdolListDao.getIMList(startNum,endNum);
		PPList = IdolListDao.getPPList(startNum,endNum);

		model.addObject("IMList",IMList);
		model.addObject("PPList",PPList);

		model.setViewName("/1/idollist/idollist");
		
		return model;
	}

}
