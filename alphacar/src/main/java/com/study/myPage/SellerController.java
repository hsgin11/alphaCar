package com.study.myPage;

import java.io.File;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.study.order.service.IOrderService;
import com.study.order.vo.OrderVO;
import com.study.prod.sercive.IProdSercive;
import com.study.prod.vo.ProdSearchVO;
import com.study.prod.vo.ProdVO;
import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import com.study.util.UploadFileUtils;

@Controller
public class SellerController {

	@Inject
	private IOrderService orderService;
	
	@Inject	
	private  IProdSercive prodService;
	
	@Inject
	private UploadFileUtils fileUtils;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/seller")
	public String sellerpage( @ModelAttribute("searchVO")ProdSearchVO searchVO
			                     , HttpSession session
			                     , Model model ) {
			logger.debug("searchVO={}",searchVO);
			UserVO user = (UserVO)session.getAttribute("USER_INFO");
			searchVO.setProdSeller(user.getUserId());
			List<ProdVO> prodSellerList = prodService.getSellerList(searchVO); 
			model.addAttribute("prodSellerList", prodSellerList);
		
		
		return "seller/seller";
	}
	

	@RequestMapping("/seller/file")
    public String uploadFile(@RequestParam(name="file", required=false) MultipartFile file, ProdVO vo, HttpSession session )throws Exception {
		logger.debug("ProdVO={}",vo);
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		vo.setProdSeller(user.getUserId());
		String subPath = vo.getProdCategory();
		// String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = fileUtils.fileUpload(subPath, file.getOriginalFilename(), file.getInputStream() ); 
		} else {
		 fileName = subPath + File.separator + "logo" + File.separator + "img_dummy6.jpg";
		}

		System.out.println("fileName=" + fileName);
		logger.debug("fileName={}",fileName);
		vo.setProdFileName(fileName);
		logger.debug("ProdVO={}",vo);
		prodService.prodRegist(vo);

        return "redirect:/";
    }

	
	
	
	@RequestMapping("seller/regist")
	public String regist() {
		return "seller/sellerRegist";
	}
	
	@RequestMapping("seller/form")
	public String edit(@ModelAttribute("prodList")ProdVO prodVO, Model model) {
		
		int prodNo = prodVO.getProdNo();
		if(prodVO.getProdNo() != 0) {
			ProdVO prod = prodService.getProd(prodNo);
			model.addAttribute("prod",prod);
		}
					
		
		return "seller/sellerForm";
	}
	
	@RequestMapping("seller/delete")
	public String delete(@ModelAttribute("prodList")ProdVO prodVO, Model model, HttpSession session) {
		
		prodService.prodDelete(prodVO);
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		String id = user.getUserId();
		return "redirect:/seller?userId="+ id;
	}
	@RequestMapping("seller/orderlist")
	public String sellerOrderList(Model model, @RequestParam("sellerId")String sellerId) {
		List<OrderVO> orderList = orderService.getOrderListBySellerId(sellerId);
		model.addAttribute("orderList", orderList);
		return "seller/sellerorderlist";
	}
	@RequestMapping("seller/orderdetail")
	public String sellerOrderDetail(Model model, @RequestParam("orderNo")int orderNo) {
		
		OrderVO order = orderService.getOrder(orderNo);
		model.addAttribute("order", order);
		return "seller/sellerorderdetail";
	}
}
