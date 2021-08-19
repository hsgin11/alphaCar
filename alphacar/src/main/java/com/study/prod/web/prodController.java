package com.study.prod.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.car.service.ICarService;
import com.study.order.vo.OrderListVO;
import com.study.order.vo.OrderVO;
import com.study.prod.sercive.IProdSercive;
import com.study.prod.vo.CommentSearchVO;
import com.study.prod.vo.OptionVO;
import com.study.prod.vo.ProdSearchVO;
import com.study.prod.vo.ProdVO;
import com.study.prod.vo.RatingVO;
import com.study.user.vo.UserVO;

@Controller
public class prodController {

	@Autowired
	IProdSercive prodService;
	@Inject
	ICarService carService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/prodlist")
	public String test(Model model, @ModelAttribute("searchVO")ProdSearchVO searchVO) {
		
		logger.debug("searchVO={}",searchVO);
		
		List<ProdVO> prodList = prodService.getProdList(searchVO); 
		logger.debug("searchVO={}",searchVO);
		model.addAttribute("prodList", prodList);
		return "prod/prodlist";
	}

	@RequestMapping("prodview")
	public String boardViewTest(Model model, @RequestParam("prodNo")int prodNo, @ModelAttribute("searchVO")ProdSearchVO searchVO) {
		ProdVO prod = prodService.getProd(prodNo);
		List<ProdVO> categoryList = prodService.getProdListByCategory(prod.getProdCategory());
		double star = prodService.getStar(prodNo);
		model.addAttribute("star", star);
		model.addAttribute("prod", prod);
		model.addAttribute("categoryList", categoryList);
		List<OptionVO> options = prodService.getOptions(prodNo);
		prod.setOptions(options);
		return "prod/prodview";
	}
	@RequestMapping("prodorder")
	public String prodOrder(@ModelAttribute("orders")OrderListVO orders, Model model, HttpServletRequest req) {
		
		List<OrderVO> orderList = orders.getOrders();
		String refer = (String)req.getHeader("REFERER");
		if(refer.contains("mypage")) {
			model.addAttribute("basket", "basket");
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("firstOrder", orderList.get(0));
		return "prod/prodorder";
	}
	
	@RequestMapping("successpayment")
	public String payMent(Model model, @ModelAttribute("order")OrderVO order) {
		
		return "prod/successpayment";
	}
//	@RequestMapping("prodForm")
//	public String prodForm(@ModelAttribute("prod")ProdVO prod) {
//		
//		return "prod/prodForm";
//	}
	
	
//	
//	@RequestMapping("prodEdit")
//	public String prodEdit(@RequestParam("prodNo") int prodNo, Model model) {
//		ProdVO prod = prodService.getProd(prodNo);
//		model.addAttribute("prod",prod);
//		return "seller/sellerEdit";
//	}
//	
	@RequestMapping("prod/rating")
	public String prodRating(@RequestParam("prodNo") int prodNo, Model model) {
		ProdVO prod = prodService.getProd(prodNo);
		model.addAttribute("prod",prod);
		return "prod/ratingStar";
	}
	@RequestMapping("prod/prodSave")
	public String RatingSave(@ModelAttribute("ratingVO")RatingVO vo,
								HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		vo.setUserId(user.getUserId());
		prodService.ratingRegist(vo);
	
		return "prod/successcomment";
	}
	@RequestMapping("comment")
	@ResponseBody
	public Map<String, Object> getCommentList(CommentSearchVO searchVO){
		
		List<RatingVO> list = prodService.getRatingComment(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("searchVO", searchVO);
		return map;
		
	};
	
	
}
