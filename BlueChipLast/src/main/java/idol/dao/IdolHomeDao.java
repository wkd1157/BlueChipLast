package idol.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import idol.dto.IdolLinkDto;
import idol.dto.IdolMainDto;
import idol.dto.IdolYouTubeDto;
import idol.dto.ProfilePhotoURLDto;

@Repository
public class IdolHomeDao extends SqlSessionDaoSupport{

	public IdolMainDto getIMDto(String koreanname)
	{
		return getSqlSession().selectOne("idolhome.selectOneOfIdolMain",koreanname);
	}
	
	public ProfilePhotoURLDto getPPDto(String koreanname)
	{
		return getSqlSession().selectOne("idolhome.selectOneOfProfilePhotoURL",koreanname);
	}
	
	public IdolLinkDto getILDto(String koreanname)
	{
		return getSqlSession().selectOne("idolhome.selectOneOfIdolLink",koreanname);
	}
	
	public List<IdolYouTubeDto> getIYList(String koreanname)
	{
		return getSqlSession().selectList("idolhome.selectSomeOfIdolYouTube",koreanname);
	}
	
	public void updateYoutubeCount(String korname) {
		getSqlSession().update("idolhome.updateYoutubeCount",korname);
	}
	
	public void updateNewsCount(String korname) {
		getSqlSession().update("idolhome.updateNewsCount",korname);
	}
	
	public void updatePhotoCount(String korname) {
		getSqlSession().update("idolhome.updatePhotoCount",korname);
	}
	
}
