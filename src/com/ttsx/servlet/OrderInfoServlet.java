package com.ttsx.servlet;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttsx.bean.AdminInfo;
import com.ttsx.bean.MemberInfo;
import com.ttsx.bean.OrderInfo;
import com.ttsx.biz.IAdminInfoBiz;
import com.ttsx.biz.IOrderInfoBiz;
import com.ttsx.biz.impl.AdminInfoBizImpl;
import com.ttsx.biz.impl.OrderInfoBizImpl;
import com.ttsx.util.RequestParamUtil;
import com.ttsx.util.SessionKeyConstant;

/**
 *  company 逸恒科技
 * 
 * @author 胡66
 * @data 2020年10月26日 Email 906430016@qq.com
 */
@WebServlet("/order")
public class OrderInfoServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");// 取出请求的操作标识符

		switch (op) {
		
		case "add": add(request,response); break;
		case "findByPage": findByPage(request,response); break;
		case "update": update(request,response); break;
		case "updates": updates(request,response); break;
		case "findByPagem": findByPagem(request,response); break;
		default:this.error(request, response);break;
		}

	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String status=request.getParameter("status");
		String oid=(String) request.getSession().getAttribute(SessionKeyConstant.UUIDOID);
		System.out.println(oid+"-------"+status);
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		int result=orderInfoBiz.update(status,oid);
		if(result > 0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
		
	}
	private void updates(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String status=request.getParameter("status");
		String oid=request.getParameter("oid");
		System.out.println(oid+"-------"+status);
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		int result=orderInfoBiz.update(status,oid);
		if(result > 0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
		
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//将信息变为一个OrderInfo对象
		//OrderInfo of=RequestParamUtil.getParams(OrderInfo.class, request);
		//System.out.println(of);
		String uuid=UUID.randomUUID().toString().replace("-", "");
		String mid=request.getParameter("mid");
		String sid=request.getParameter("sid");
		String sname=request.getParameter("sname");
		//System.out.println(sname);
		String pid=request.getParameter("pid");
		String total=request.getParameter("total");
		
		request.getSession().setAttribute(SessionKeyConstant.UUIDOID, uuid);
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		if(orderInfoBiz.add(uuid, mid, sid, pid, total,sname) > 0) {
			this.send(response, 200,"成功");
			return;
		}
		this.send(response, 500,"失败");
	}

	private void findByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		MemberInfo mf=(MemberInfo) request.getSession().getAttribute(SessionKeyConstant.INFOLOGIN);
		String mid = mf.getMid()+"";
		
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		this.send(response, orderInfoBiz.findByPage(mid, page, rows));
	}
	private void findByPagem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		MemberInfo mf=(MemberInfo) request.getSession().getAttribute(SessionKeyConstant.INFOLOGIN);
		String smid = mf.getMid()+"";
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		this.send(response, orderInfoBiz.findByPagem(smid, page, rows));
	}
	private void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		this.send(response, orderInfoBiz.findAll());	
	}
}
