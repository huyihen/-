package com.ttsx.biz.impl;

import java.util.List;

import com.ttsx.bean.Detailinfo;
import com.ttsx.bean.OrderInfo;
import com.ttsx.bean.PlaceInfo;
import com.ttsx.biz.IOrderInfoBiz;
import com.ttsx.dao.IDetailInfoDao;
import com.ttsx.dao.IOrderInfoDao;
import com.ttsx.dao.IPlaceInfoDao;
import com.ttsx.dao.impl.DetailInfoDaoImpl;
import com.ttsx.dao.impl.OrderInfoDaoImpl;
import com.ttsx.dao.impl.PlaceInfoDaoImpl;
import com.ttsx.dto.JsonObject;
import com.ttsx.util.StringUtil;

public class OrderInfoBizImpl implements IOrderInfoBiz{
	@Override
	public JsonObject findByPagem(String smid, int page, int rows) {
		if (StringUtil.checkNull(smid,page+"",rows+"")) {
			return null;
		}
		IOrderInfoDao orderInfoDao = new OrderInfoDaoImpl();
		IDetailInfoDao detailInfoDao=new DetailInfoDaoImpl();
		IPlaceInfoDao placeInfoDao = new PlaceInfoDaoImpl();
		//System.out.println(orderInfoDao.total(mid));
		//System.out.println(orderInfoDao.findByPage(mid, page, rows));
		List<OrderInfo> orders=orderInfoDao.findByPagem(smid, page, rows);
		for(OrderInfo order:orders) {
			List<Detailinfo> details=detailInfoDao.findAll(order.getOid());
			PlaceInfo pinfo=placeInfoDao.findPid(order.getPid());
			order.setDetails(details);
			order.setPlace(pinfo);
		
		}
		
		return new JsonObject(orderInfoDao.totalm(smid),orders);
	}
	@Override
	public JsonObject findByPage(String mid, int page, int rows) {
		if (StringUtil.checkNull(mid,page+"",rows+"")) {
			return null;
		}
			IOrderInfoDao orderInfoDao = new OrderInfoDaoImpl();
			IDetailInfoDao detailInfoDao=new DetailInfoDaoImpl();
			IPlaceInfoDao placeInfoDao = new PlaceInfoDaoImpl();
			//System.out.println(orderInfoDao.total(mid));
			//System.out.println(orderInfoDao.findByPage(mid, page, rows));
			List<OrderInfo> orders=orderInfoDao.findByPage(mid, page, rows);
			for(OrderInfo order:orders) {
				List<Detailinfo> details=detailInfoDao.findAll(order.getOid());
				PlaceInfo pinfo=placeInfoDao.findPid(order.getPid());
				order.setDetails(details);
				order.setPlace(pinfo);
			
			}
			
			return new JsonObject(orderInfoDao.total(mid),orders);
	}

	@Override
	public int update(String status,String oid) {
		if (StringUtil.checkNull(status,oid)) {
			return -1;
		}
		IOrderInfoDao orderInfoDao = new OrderInfoDaoImpl();
		return orderInfoDao.update(status,oid);
	}

	@Override
	public List<OrderInfo> findAll() {
			IOrderInfoDao orderInfoDao = new OrderInfoDaoImpl();
		return orderInfoDao.findAll();
	}

	@Override
	public int add(String oid, String mid, String sid, String pid, String total,String sname) {
			IOrderInfoDao orderInfoDao = new OrderInfoDaoImpl();
	
		return orderInfoDao.add(oid, mid, sid, pid, total, sname);
	}

	

	
}
