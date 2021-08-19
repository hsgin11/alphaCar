package com.study.board.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.study.board.reply.service.IReplyService;
import com.study.board.reply.vo.ReplySearchVO;
import com.study.board.reply.vo.ReplyVO;
import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;

@RestController
public class ReplyControllerTest {
	@Inject
	IReplyService replyService;
	
	@RequestMapping(value = "/reply/replyList", produces = "application/json;charset=UTF-8")
	public Map<String, Object> replyList(ReplySearchVO searchVO) throws Exception {
		
		
		int count = replyService.getReplyCountByParent(searchVO);
		List<ReplyVO> list = replyService.getReplyList(searchVO);
		System.out.println(list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		map.put("count", count);
		map.put("searchVO", searchVO);
		return map;
	}
	@RequestMapping(value = "/reply/replyRegist", method = RequestMethod.POST)
	public Map<String, Object> replyRegist(ReplyVO reply, HttpServletRequest req, HttpSession session)
			throws Exception {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
		userCountVO.setBoardReplyCount(userCountVO.getBoardReplyCount() + 1);
		session.setAttribute("COUNT_INFO", userCountVO);
		reply.setReMemId(user.getUserId());
		System.out.println(reply);
		replyService.registReply(reply);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("msg", "정상 등록 되었습니다.");
		return map;
	}
	@RequestMapping(value = "/reply/replyDelete")
	public Map<String, Object> replyDelete(ReplyVO reply, HttpSession session) throws Exception{
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		UserCountVO userCountVO = (UserCountVO)session.getAttribute("COUNT_INFO");
		userCountVO.setBoardReplyCount(userCountVO.getBoardReplyCount() - 1);
		session.setAttribute("COUNT_INFO", userCountVO);
		reply.setReMemId(user.getUserId());
		Map<String, Object> map = new HashMap<String, Object>();
		replyService.removeReply(reply);
		map.put("result", true);
		map.put("msg", "삭제 되었습니다.");
		return map;
	}
	@RequestMapping(value = "/reply/replyModify")
	public Map<String, Object> replyModify(ReplyVO reply, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		reply.setReMemId(user.getUserId());
		System.out.println(reply);
		Map<String, Object> map = new HashMap<String, Object>();
		
			replyService.modifyReply(reply);
			map.put("result", true);
			map.put("msg", "수정 되었습니다.");
			return map;
		
	}
}
