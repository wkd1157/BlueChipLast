package idol.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import idol.dto.IdolMainDto;
import idol.dto.ProfilePhotoURLDto;

@Repository
public class IdolListDao extends SqlSessionDaoSupport {
	
	public int getTotalCount()
	{
		int cnt = getSqlSession().selectOne("idollist.selectGetTotalCount");
		return cnt;
	}

	public List<IdolMainDto> getIMList(int start, int end)
	{
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("idollist.selectAllOfIdolMain", map);
	}
	

	public List<ProfilePhotoURLDto> getPPList(int start, int end)
	{
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("idollist.selectAllOfProfilePhotoURL",map);
	}
	
	
}
