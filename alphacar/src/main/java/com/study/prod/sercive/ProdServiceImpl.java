package com.study.prod.sercive;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.prod.dao.IProdDao;
import com.study.prod.vo.CommentSearchVO;
import com.study.prod.vo.OptionVO;
import com.study.prod.vo.ProdSearchVO;
import com.study.prod.vo.ProdVO;
import com.study.prod.vo.RatingVO;
@Service
public class ProdServiceImpl implements IProdSercive {

	@Autowired
	private IProdDao prodDao;
	
	
	@Override
	public List<ProdVO> getProdList(ProdSearchVO searchVO) {
		searchVO.setTotalRowCount(prodDao.getProdCount(searchVO));
		searchVO.pageSetting();
		return prodDao.getProdList(searchVO);
	}

	@Override
	public List<ProdVO> getProdListByCategory(String prodCategory) {
		return prodDao.getProdListByCategory(prodCategory);
	}


	@Override
	public ProdVO getProd(int prodNo) {
		// TODO : 상품 rank목록 처리(paging, )
		
		return prodDao.getProd(prodNo);
	}




	@Override
	public List<OptionVO> getOptions(int prodNo) {
	
		return prodDao.getOptions(prodNo);
	}




	@Override
	public void prodRegist(ProdVO vo) {
		prodDao.sellerRegist(vo);
		List<OptionVO> opts = vo.getOptions();
		for(OptionVO op : opts) {
			op.setProdNo(vo.getProdNo());
			prodDao.insertOption(op);
		}
		
		
	}




	@Override
	public List<ProdVO> getSellerList(ProdSearchVO searchVO) {
		searchVO.setTotalRowCount(prodDao.getSellerCount(searchVO));
		searchVO.pageSetting2();
		return prodDao.getSellerList(searchVO);
	}




	@Override
	public void ratingRegist(RatingVO vo) {
		prodDao.getRating(vo);
		
	}




	@Override
	public void prodModify(ProdVO vo) {
		// TODO Auto-generated method stub
		
	}




	@Override
	public void prodDelete(ProdVO vo) {
		prodDao.deleteOption(vo);
		prodDao.sellerDelete(vo);
		
	}
	

	@Override
	public double getStar(int prodNo) {
		
		return prodDao.getStar(prodNo);
	}




	@Override
	public List<RatingVO> getRatingComment(CommentSearchVO searchVO) {
		int cnt = prodDao.getCommentCount(searchVO);
		searchVO.setRowSizePerPage(5);
		searchVO.setTotalRowCount(cnt);
		searchVO.pageSetting();
		return prodDao.getCommentList(searchVO);
	}

}
