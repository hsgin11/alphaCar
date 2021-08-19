package com.study.board.questionboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.board.questionboard.dao.IQuestionBoardDao;
import com.study.board.questionboard.vo.QuestionBoardSearchVO;
import com.study.board.questionboard.vo.QuestionBoardVO;
@Service
public class QuestionBoardServiceImpl implements IQuestionBoardService{
	@Inject
	IQuestionBoardDao boardDao;
	
	@Override
	public List<QuestionBoardVO> getQBoardList(QuestionBoardSearchVO searchVO) {
		int totalRowCount = boardDao.getQBoardCount();
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		return boardDao.getQBoardList(searchVO);
	}

	@Override
	public QuestionBoardVO getQBoard(String boNo) {
		boardDao.increseHit(boNo);
		return boardDao.getQBoard(boNo);
	}

	@Override
	public void registBoard(QuestionBoardVO board) {
		boardDao.insertBoard(board);
	}

	@Override
	public List<QuestionBoardVO> getQuestionList() {
		return boardDao.getQuestList();
	}

	@Override
	public void removeBoard(String boNo) {
		boardDao.deleteBoard(boNo);
		
	}

	@Override
	public void modifyBoard(QuestionBoardVO board) {
		boardDao.updateBoard(board);
		
	}

	@Override
	public List<QuestionBoardVO> getNoticeList() {
		
		return boardDao.getNoticeList();
	}
	

}
