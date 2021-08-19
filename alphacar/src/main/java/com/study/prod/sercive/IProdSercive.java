package com.study.prod.sercive;

import java.util.List;

import com.study.prod.vo.CommentSearchVO;
import com.study.prod.vo.OptionVO;
import com.study.prod.vo.ProdSearchVO;
import com.study.prod.vo.ProdVO;
import com.study.prod.vo.RatingVO;

public interface IProdSercive {
	public List<ProdVO> getProdList(ProdSearchVO searchVO);
	public List<ProdVO> getProdListByCategory(String prodCategory);
	public ProdVO getProd(int prodNo);
	public List<OptionVO> getOptions(int prodNo);
	public void prodRegist(ProdVO vo);
	public void prodModify(ProdVO vo);
	public void prodDelete(ProdVO vo);
	
	public List<ProdVO> getSellerList(ProdSearchVO searchVO);
	public void ratingRegist(RatingVO vo);
	public double getStar(int prodNo);
	public List<RatingVO> getRatingComment(CommentSearchVO searchVO);
}
