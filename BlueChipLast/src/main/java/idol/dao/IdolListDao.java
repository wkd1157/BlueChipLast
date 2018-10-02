package idol.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import idol.dto.IdolMainDto;
import idol.dto.ProfilePhotoURLDto;

@Repository
public class IdolListDao extends SqlSessionDaoSupport {

	public List<IdolMainDto> getIMList()
	{
		return getSqlSession().selectList("idollist.selectAllOfIdolMain");
	}
	
	public List<ProfilePhotoURLDto> getPPList()
	{
		return getSqlSession().selectList("idollist.selectAllOfProfilePhotoURL");
	}
	
	
}
