package com.study.board.questionboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.board.questionboard.vo.QuestionBoardSearchVO;
import com.study.board.questionboard.vo.QuestionBoardVO;
@Mapper
public interface IQuestionBoardDao {
	public int getQBoardCount();
	public int increseHit(String boNo);
	public List<QuestionBoardVO> getQBoardList(QuestionBoardSearchVO searchVO);
	public QuestionBoardVO getQBoard(String boNo);
	public int insertBoard(QuestionBoardVO board);
	public int updateBoard(QuestionBoardVO board);
	public int deleteBoard(String boNo);
	public List<QuestionBoardVO>getQuestList();
	public List<QuestionBoardVO>getNoticeList();
	
}
