package com.study.board.infoboard.service;

import java.util.List;

import com.study.board.infoboard.vo.InfoBoardSearchVO;
import com.study.board.infoboard.vo.InfoBoardVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;

public interface IinfoBoardService {

	public List<InfoBoardVO> getInfoBoardList(InfoBoardSearchVO searchVO);
	public InfoBoardVO getInfoBoard(String infoBoardNo);
	public void modifyBoard(InfoBoardVO boardVO)throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;	
	public void removeBoard(InfoBoardVO boardVO)throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void registBoard(InfoBoardVO boardVO)throws BizNotEffectedException;
	
	public void hitBoard(String infoBoardNo);	//조회수
	public List<InfoBoardVO> getBestList();
	public List<InfoBoardVO> getNoticeList();
	
}
