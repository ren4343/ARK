package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.domain.ARK_ReplyVO;
import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.GoodsVO;
import kr.icia.domain.OrderVO;
import kr.icia.mapper.adminMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class adminServiceImpl implements adminService {
	
	@Setter(onMethod_=@Autowired)
	private adminMapper mapper;
	
	@Override
	public void register(GoodsVO vo) {
		mapper.register(vo);
		
	}

	@Override
	public List<CategoryVO> Category(){
	
		
		return mapper.Category();
	}

	@Override
	public List<GoodsVO> goodsList() {
	
		return mapper.goodsList();
	}

	@Override
	public GoodsVO goodsView(int gdsNum) {
		
		return mapper.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) {
		mapper.goodsModify(vo);
		
	}

	@Override
	public void goodsDelete(int gdsNum) {
		mapper.goodsDelete(gdsNum);
		
	}

	@Override
	public List<OrderVO> orderList() {
		
		return mapper.orderList();
	}

	@Override
	public List<OrderVO> orderView(OrderVO order) {
		
		return mapper.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) {
	
		mapper.delivery(order);
		
	}

	@Override
	public void changeStock(GoodsVO goods) {
	
		mapper.changeStock(goods);
		
	}

	@Override
	public List<ARK_ReplyVO> allReply() {
		
		return mapper.allReply();
	}

	@Override
	public void deleteReply(int repNum) {
	
		mapper.deleteReply(repNum);
		
	}

	@Override
	public List<GoodsVO> goodsListr(Criteria cri) {
		
		return mapper.goodsListr(cri);
		
	}

	@Override
	public int total() {
		
		return mapper.total();
	}

}
