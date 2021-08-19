package com.study.board.reply.service;

import java.util.List;

import com.study.board.reply.vo.ReplySearchVO;
import com.study.board.reply.vo.ReplyVO;

public interface IReplyService {
	public int getReplyCountByParent(ReplySearchVO searchVO);
	public List<ReplyVO>getReplyList(ReplySearchVO searchVO);
	public void registReply(ReplyVO reply);
	public void modifyReply(ReplyVO reply);
	public void removeReply(ReplyVO reply);
}