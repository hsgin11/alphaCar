package com.study.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.prod.vo.CommentSearchVO;
import com.study.prod.vo.OptionVO;
import com.study.prod.vo.ProdSearchVO;
import com.study.prod.vo.ProdVO;
import com.study.prod.vo.RatingVO;
@Mapper
public interface IProdDao {
	public int getProdCount(ProdSearchVO searchVO);
	public List<ProdVO> getProdList(ProdSearchVO searchVO);
	public List<ProdVO> getProdListByCategory(String prodCategory);
	public ProdVO getProd(int prodNo);
	public List<OptionVO> getOptions(int prodNo);
	
	
	
	//판매자 페이지
	public int updateProd(ProdVO prod); //물품 수정
	public int getSellerCount(ProdSearchVO searchVO);
	public List<ProdVO> getSellerList(ProdSearchVO searchVO);
	public int sellerRegist(ProdVO vo);
	public int sellerModify(ProdVO vo);
	public int sellerDelete(ProdVO vo);
	public int insertOption(OptionVO vo);
	public int updateOption(OptionVO vo);
	public int deleteOption(ProdVO vo);
	//별점
	public int getRating(RatingVO vo);
	public double getStar(int prodNo);
	public int getCommentCount(CommentSearchVO searchVO);
	public List<RatingVO> getCommentList(CommentSearchVO seachVO);
}
