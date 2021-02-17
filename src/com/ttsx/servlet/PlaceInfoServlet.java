package com.ttsx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttsx.bean.MemberInfo;
import com.ttsx.bean.PlaceInfo;
import com.ttsx.biz.IPlaceInfoBiz;
import com.ttsx.biz.impl.PlaceInfoBizImpl;
import com.ttsx.util.RequestParamUtil;
import com.ttsx.util.SessionKeyConstant;


@WebServlet("/place")
public class PlaceInfoServlet extends BaseServlet{

	private static final long serialVersionUID = -7687707650321589847L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String op = request.getParameter("op");
		switch (op) {
		case "add": add(request,response);break;
		case "update": update(request,response);break;
		case "updateStatus": updateStatus(request,response);break;
		case "findAll": findAll(request,response);break;
		case "findPid": findPid(request,response);break;
		case "del": del(request,response);break;
		default:this.error(request, response);break;
		}
	}

	private void updateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberInfo mf = (MemberInfo) request.getSession().getAttribute(SessionKeyConstant.INFOLOGIN);
		String pid= request.getParameter("pid");
		;
		IPlaceInfoBiz placeInfoBiz = new PlaceInfoBizImpl();
		int str =placeInfoBiz.updateStatus(mf.getMid()+"", pid,"2");
		if(str>0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
	}

	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid= request.getParameter("pid");
		IPlaceInfoBiz placeInfoBiz = new PlaceInfoBizImpl();
		if(placeInfoBiz.del(pid)> 0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
		
	}

	private void findPid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid= request.getParameter("pid");
		IPlaceInfoBiz placeInfoBiz = new PlaceInfoBizImpl();
		this.send(response, placeInfoBiz.findPid(pid));	
		
	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberInfo mf = (MemberInfo) request.getSession().getAttribute(SessionKeyConstant.INFOLOGIN);
		IPlaceInfoBiz placeInfoBiz = new PlaceInfoBizImpl();
		
		this.send(response, placeInfoBiz.findAll(mf.getMid()+""));	
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		IPlaceInfoBiz placeInfoBiz = new PlaceInfoBizImpl();
		//将信息变为一个PlaceInfo对象
		PlaceInfo pf=RequestParamUtil.getParams(PlaceInfo.class, request);
		if(placeInfoBiz.update(pf)> 0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
		
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		IPlaceInfoBiz placeInfoBiz = new PlaceInfoBizImpl();
		//将信息变为一个PlaceInfo对象
		PlaceInfo pf=RequestParamUtil.getParams(PlaceInfo.class, request);
		if(placeInfoBiz.add(pf)> 0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
	}
	
	

}
