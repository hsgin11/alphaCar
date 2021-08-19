package com.study.board.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.board.reply.dao.IReplyDao;
import com.study.board.reply.vo.ReplySearchVO;
import com.study.board.reply.vo.ReplyVO;
@Service
public class IReplyServiceImpl implements IReplyService{

	@Inject
	IReplyDao replyDao;
	
	@Override
	public List<ReplyVO> getReplyList(ReplySearchVO serchVO) {
		int totalRowCount = getReplyCountByParent(serchVO);
		serchVO.setTotalRowCount(totalRowCount);
		serchVO.pageSetting();
		return replyDao.getReplyList(serchVO);
	}

	@Override
	public int getReplyCountByParent(ReplySearchVO searchVO) {
		
		return replyDao.getReplyCountByparent(searchVO);
	}
	@Override
	public void registReply(ReplyVO reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) {
		replyDao.updateReply(reply);
	}

	@Override
	public void removeReply(ReplyVO reply){
		
		replyDao.deleteReply(reply);
	}
}
