package bbs.dao;

import java.util.List;

import bbs.dto.AnswerDto;
import bbs.dto.BBSDto;


public interface BBSDaoInter {
	public void insertBBS(BBSDto dto);
	public List<BBSDto> getList(int start,int end);
	public int getTotalCount();
	public BBSDto getData(int num);
	public void updateReadcount(int num);
	public void updateChu(int num);
	
	//댓글에 대한 메소드 추가
	public void insertAnswer(AnswerDto adto);
	public List<AnswerDto> getAnswer(int num);

}
