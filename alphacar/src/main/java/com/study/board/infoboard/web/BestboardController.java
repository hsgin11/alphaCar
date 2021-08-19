package com.study.board.infoboard.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.board.infoboard.service.IinfoBoardService;
import com.study.board.infoboard.vo.InfoBoardVO;
import com.study.board.questionboard.service.IQuestionBoardService;
import com.study.board.questionboard.vo.QuestionBoardVO;

@RestController
public class BestboardController {
	@Inject
	IinfoBoardService boardService;
	@Inject
	IQuestionBoardService questionBoardService;
	@RequestMapping(value = "/best", produces = "application/json; charset=UTF-8")	
	public Map<String, Object> bestList(String a)throws Exception {
		
		List list = new ArrayList();
		if(a.equals("info")) {
			list =boardService.getBestList();
		}else {
			list =questionBoardService.getQuestionList();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		map.put("count", list.size());
		map.put("board", a);
		return map;
	}
	@RequestMapping(value = "/notice", produces = "application/json; charset=UTF-8")	
	public Map<String, Object> noticeList(String a)throws Exception {
		
		List list = new ArrayList();
		if(a.equals("info")) {
			list =boardService.getNoticeList();
	 	}else {
			list =questionBoardService.getNoticeList();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		map.put("count", list.size());
		map.put("board", a);
		return map;
	}
}
