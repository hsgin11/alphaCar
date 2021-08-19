package com.study.board.infoboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.study.board.infoboard.dao.IinfoBoardDao;
import com.study.board.infoboard.vo.InfoBoardSearchVO;
import com.study.board.infoboard.vo.InfoBoardVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;

@Service
public class InfoBoardServiceImpl implements IinfoBoardService{

	@Inject
	IinfoBoardDao infoDao;
	
	@Override
	public List<InfoBoardVO> getInfoBoardList(InfoBoardSearchVO searchVO) {
		
		//int totalRowCount = infoDao.getBoardCount();
		// search 추가해야함
		int totalRowCount = infoDao.getBoardCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return infoDao.getBoardList(searchVO);
	}

	@Override
	public InfoBoardVO getInfoBoard(String infoBoardNo) {
		InfoBoardVO boardVO = infoDao.getInfoBoard(infoBoardNo);
		
		
		return infoDao.getInfoBoard(infoBoardNo);
	}

	@Override
	public void modifyBoard(InfoBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException{
		InfoBoardVO vo = infoDao.getInfoBoard(boardVO.getInfoBoardNo());
		if (vo == null)
			throw new BizNotFoundException();
		if (vo.getInfoBoardWriter().equals(boardVO.getInfoBoardWriter())) {
			int cnt = infoDao.updateBoard(boardVO);
			if (cnt < 1)
				throw new BizNotEffectedException();
		} else {
			throw new BizPasswordNotMatchedException();
		}
		infoDao.updateBoard(boardVO);
		
	}

	@Override
	public void removeBoard(InfoBoardVO boardVO) {
		infoDao.deleteBoard(boardVO);
	}

	@Override
	public void registBoard(InfoBoardVO boardVO) {
		int cnt = infoDao.insertBoard(boardVO);
		
	}

	@Override
	public void hitBoard(String infoBoardNo) {
		infoDao.hitBoard(infoBoardNo);
		
	}

	
	@Override
	public List<InfoBoardVO> getBestList() {
		System.out.println("service");
			
		return infoDao.getBestList();
	}

	@Override
	public List<InfoBoardVO> getNoticeList() {
		// TODO Auto-generated method stub
		return infoDao.getNoticeList();
	}
	

	
	// 페이징사이즈처리
	
	
	
}
