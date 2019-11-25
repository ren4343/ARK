package kr.icia.service;

import java.util.List;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.OrderVO;

public interface adminService {

	
	public void register(GoodsVO vo);
	
	
	public List<CategoryVO> Category() ;
	
	public List<GoodsVO> goodsList();
	
	public GoodsVO goodsView(int gdsNum);
	
	public void goodsModify(GoodsVO vo);
	
	public void goodsDelete(int gdsNum);
	
	public List<OrderVO> orderList();
	
	public List<OrderVO> orderView(OrderVO order);
	
	public void delivery(OrderVO order);
	
	public void changeStock(GoodsVO goods);
	
	public List<ARK_ReplyVO> allReply();
	
	public void deleteReply(int repNum);
	
	public List<GoodsVO> goodsListr(Criteria cri);
	
	public int total();
	
}
