package com.study.board.questionboard.service;

import java.util.List;

import com.study.board.questionboard.vo.QuestionBoardSearchVO;
import com.study.board.questionboard.vo.QuestionBoardVO;

public interface IQuestionBoardService {
	public List<QuestionBoardVO> getQBoardList(QuestionBoardSearchVO searchVO);
	public QuestionBoardVO getQBoard(String boNo);
	public void registBoard(QuestionBoardVO board);
	public void modifyBoard(QuestionBoardVO board);
	public void removeBoard(String boNo);
	public List<QuestionBoardVO>getQuestionList();
	public List<QuestionBoardVO>getNoticeList();
}
