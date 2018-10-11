package bbs.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import bbs.dto.AnswerDto;
import bbs.dto.BBSDto;

@Repository
public class BBSDao extends SqlSessionDaoSupport implements BBSDaoInter{

	public void insertBBS(BBSDto dto) {
		getSqlSession().insert("bbs.insertbbs",dto);
	}

	public List<BBSDto> getList(int start, int end) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);
		
		return getSqlSession().selectList("bbs.selectpagingofbbs",map);
	}

	public int getTotalCount() {
		int n=getSqlSession().selectOne("bbs.totalcountofbbs");
		return n;
	}
	
	public BBSDto getData(int num) {
		return getSqlSession().selectOne("selectOneofbbs",num);
	}
	
	public void updateReadcount(int num) {
		getSqlSession().update("updateByNumofbbs",num);
	}
	
	public void insertAnswer(AnswerDto adto) {
		getSqlSession().insert("insertanswer",adto);
	}
	
	public List<AnswerDto> getAnswer(int num) {
		return getSqlSession().selectList("answerlistByNum",num);
	}

	public void updateChu(int num) {
		// TODO Auto-generated method stub
		

	}
	
}
