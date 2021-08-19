package com.study.board.infoboard.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.board.infoboard.service.IinfoBoardService;
import com.study.board.infoboard.vo.InfoBoardSearchVO;
import com.study.board.infoboard.vo.InfoBoardVO;
import com.study.board.reply.vo.ReplySearchVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;

@Controller
public class InfoBoardController {

	@Inject
	IinfoBoardService boardService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@RequestMapping("infoBoardList")
	public String infoBoardList(Model model, @ModelAttribute("searchVO") InfoBoardSearchVO replySearchVO) {
		
		model.addAttribute("searchVO", replySearchVO);
		List<InfoBoardVO> infoBoardList = boardService.getInfoBoardList(replySearchVO);
		model.addAttribute("infoBoardList", infoBoardList);
		
		return "/info/list";
	}
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String infoBoardView(@RequestParam(value="infoBoardNo", required= true)String infoBoardNo,Model model,  HttpServletRequest req, HttpSession session) {
		
		
		
		InfoBoardVO boardVO = boardService.getInfoBoard(infoBoardNo);
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		if(boardVO.getInfoBoardWriterId().equals(user.getUserId())) {			
			UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
			userCountVO.setBoardHitCount(userCountVO.getBoardHitCount() + 1);
			session.setAttribute("COUNT_INFO", userCountVO);
		}
		boardService.hitBoard(infoBoardNo);
		model.addAttribute("infoBoardView", boardVO);
		
		return "/info/view";
	}
	@RequestMapping("infoBoardForm")
	public String infoBoardForm(@ModelAttribute("infoBoard")InfoBoardVO boardVO, Model model) {
		String boNo = boardVO.getInfoBoardNo();
		if(boardVO.getInfoBoardNo() != null) {
			InfoBoardVO board = boardService.getInfoBoard(boNo);
			model.addAttribute("board", board);
		}
		return "/info/form";
	}
	@RequestMapping(value="infoBoardModify", method = RequestMethod.POST)
	public String infoBoardModify(@ModelAttribute("infoBoard")InfoBoardVO boardVO, Model model) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		logger.debug("boardVO={}", boardVO);
		
		boardService.modifyBoard(boardVO);

		return "redirect:/infoBoardList";
	}
	@RequestMapping("infoBoardRegist")
	public String infoBoardRegist(@ModelAttribute("infoBoard")InfoBoardVO boardVO, Model model, HttpServletRequest req, HttpSession session) throws BizNotEffectedException {
		UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
		userCountVO.setBoardCount(userCountVO.getBoardCount() + 1);
		session.setAttribute("COUNT_INFO", userCountVO);
		boardService.registBoard(boardVO);
		
		return "redirect:/infoBoardList";
			
	}
	@RequestMapping("infoBoardRemove")
	public String infoBoardRemove(@ModelAttribute("infoBoard")InfoBoardVO boardVO, Model model, HttpServletRequest req, HttpSession session) 
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		boardService.removeBoard(boardVO);
		UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
		userCountVO.setBoardCount(userCountVO.getBoardCount() - 1);
		session.setAttribute("COUNT_INFO", userCountVO);
		return "redirect:/infoBoardList";
	}
	
}
