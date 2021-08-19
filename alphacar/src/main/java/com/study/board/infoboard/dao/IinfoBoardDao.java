package com.study.board.infoboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.board.infoboard.vo.InfoBoardSearchVO;
import com.study.board.infoboard.vo.InfoBoardVO;

@Mapper
public interface IinfoBoardDao {
	
	public int getBoardCount(InfoBoardSearchVO searchVO);
	public List<InfoBoardVO> getBoardList(InfoBoardSearchVO searchVO);
	public InfoBoardVO getInfoBoard(String infoBoardNo);
	public int updateBoard(InfoBoardVO boardVO);	
	public int deleteBoard(InfoBoardVO boardVO);
	public int insertBoard(InfoBoardVO boardVO);
	// 조회수
	public void hitBoard(String infoBoardNo);
	// bestBoard
	public List<InfoBoardVO>getBestList();
	public List<InfoBoardVO>getNoticeList();
	
	
}
