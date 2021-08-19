package com.study.board.questionboard.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.board.questionboard.service.IQuestionBoardService;
import com.study.board.questionboard.vo.QuestionBoardSearchVO;
import com.study.board.questionboard.vo.QuestionBoardVO;
import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;

@Controller
public class QuestionBoardController {

	
	
	
	@Inject 
	IQuestionBoardService boardService;
	
	@RequestMapping("questionboard")
	public String questionBoard(Model model, @ModelAttribute("searchVO")QuestionBoardSearchVO searchVO) {
		
		List<QuestionBoardVO> list = boardService.getQBoardList(searchVO);
		model.addAttribute("questionList" , list);
		return "question/questionlist";
	}
	
	@RequestMapping("questionview")
	public String questionView(Model model, @RequestParam("boNo")String boNo,  HttpServletRequest req, HttpSession session) {
		
		
		QuestionBoardVO vo = boardService.getQBoard(boNo);
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		if(vo.getQuestionBoardWriterId().equals(user.getUserId())) {
			UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
			userCountVO.setBoardHitCount(userCountVO.getBoardHitCount() + 1);
			session.setAttribute("COUNT_INFO", userCountVO);
		}
		
		
		
		model.addAttribute("board" , vo);
		return "question/questionview";
	}
	@RequestMapping("questionform")
	public String questionForm(@RequestParam(value="boNo", required= false)String boNo, Model model) {
		QuestionBoardVO boardVO = boardService.getQBoard(boNo);
		if(boardVO != null) {
			model.addAttribute("board", boardVO);
		}
		
		return "question/questionform";
	}
	@RequestMapping("questionregist")
	public String questionRegist(Model model, QuestionBoardVO board,HttpServletRequest req, HttpSession session) {		
		UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
		userCountVO.setBoardCount(userCountVO.getBoardCount() + 1);
		session.setAttribute("COUNT_INFO", userCountVO);
		boardService.registBoard(board);
		return "redirect:/questionboard";
	}
	
	@RequestMapping("questionmodify")
	public String questionModify(@ModelAttribute("questionBoard")QuestionBoardVO board) {
		boardService.modifyBoard(board);
		
		return "redirect:/questionboard";
	}
	
	
	@RequestMapping("questionremove")
	public String questionRemove(@RequestParam("boNo")String boNo,HttpServletRequest req, HttpSession session) {
		UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
		userCountVO.setBoardCount(userCountVO.getBoardCount() - 1);
		session.setAttribute("COUNT_INFO", userCountVO);
		boardService.removeBoard(boNo);
		
		return "redirect:/questionboard";
	}
}
