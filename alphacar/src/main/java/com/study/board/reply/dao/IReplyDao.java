package com.study.board.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.board.reply.vo.ReplySearchVO;
import com.study.board.reply.vo.ReplyVO;
@Mapper
public interface IReplyDao {
	public int getReplyCountByparent(ReplySearchVO searchVO);
	public List<ReplyVO>getReplyList(ReplySearchVO searchVO);
	public ReplyVO getReply(int reNo);
	public int insertReply(ReplyVO reply);
	public int updateReply(ReplyVO reply);
	public int deleteReply(ReplyVO reply);
}
