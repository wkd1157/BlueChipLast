package idol.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import idol.dto.IdolMainDto;
import idol.dto.ProfilePhotoURLDto;

@Repository
public class IdolSearchDao extends SqlSessionDaoSupport {
	
	public List<IdolMainDto> getNameIMList(String name)
	{
		return getSqlSession().selectList("idolsearch.selectNameSearchIdolMain", name);
	}
	

	public List<ProfilePhotoURLDto> getNamePPList(String name)
	{
		return getSqlSession().selectList("idolsearch.selectNameSearchProfilePhotoURL", name);
	}
	
	public List<IdolMainDto> getEntIMList(String name)
	{
		return getSqlSession().selectList("idolsearch.selectEntSearchIdolMain", name);
	}
	

	public List<ProfilePhotoURLDto> getEntPPList(String name)
	{
		return getSqlSession().selectList("idolsearch.selectEntSearchProfilePhotoURL", name);
	}
	
	public List<IdolMainDto> getDebutYearIMList(String name)
	{
		return getSqlSession().selectList("idolsearch.selectDebutYearSearchIdolMain", name);
	}
	

	public List<ProfilePhotoURLDto> getDebutYearPPList(String name)
	{
		return getSqlSession().selectList("idolsearch.selectDebutYearSearchProfilePhotoURL", name);
	}
	
}
