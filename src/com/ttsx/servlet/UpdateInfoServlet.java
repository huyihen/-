package com.ttsx.servlet;

import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.ttsx.bean.TypeInfo;
import com.ttsx.biz.IOrderInfoBiz;
import com.ttsx.biz.ITypeInfoBiz;
import com.ttsx.biz.impl.OrderInfoBizImpl;
import com.ttsx.biz.impl.TypeInfoBizImpl;
import com.ttsx.util.RequestParamUtil;
import com.ttsx.util.SessionKeyConstant;

/**
 * 商品类型控制 company 逸恒科技
 * 
 * @author 胡66
 * @data 2020年10月26日 Email 906430016@qq.com
 */
@WebServlet("/orderupdate")
public class UpdateInfoServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	public void doPost (HttpServletRequest httpRequest,HttpServletResponse httpResponse)   throws  ServletException, IOException  {
		String status="1";
		String oid=(String) httpRequest.getSession().getAttribute(SessionKeyConstant.UUIDOID);
		System.out.println(oid+"-------"+status);
		IOrderInfoBiz orderInfoBiz = new OrderInfoBizImpl();
		int result=orderInfoBiz.update(status,oid);
	      
		}
	
	

}
