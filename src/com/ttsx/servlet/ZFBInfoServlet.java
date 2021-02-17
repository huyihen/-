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
import com.ttsx.biz.ITypeInfoBiz;
import com.ttsx.biz.impl.TypeInfoBizImpl;
import com.ttsx.util.RequestParamUtil;
import com.ttsx.util.SessionKeyConstant;

/**
 * 商品类型控制 company 逸恒科技
 * 
 * @author 胡66
 * @data 2020年10月26日 Email 906430016@qq.com
 */
@WebServlet("/zfb")
public class ZFBInfoServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	public void doPost (HttpServletRequest httpRequest,HttpServletResponse httpResponse)   throws  ServletException, IOException  {
		
	        	
	        
		
	        AlipayClient alipayClient = new DefaultAlipayClient(SessionKeyConstant.GATEWAY_URL, SessionKeyConstant.APP_ID, SessionKeyConstant.APP_PRIVATE_KEY, SessionKeyConstant.FORMAT, SessionKeyConstant.CHARSET, SessionKeyConstant.ALIPAY_PUBLIC_KEY, SessionKeyConstant.SIGN_TYPE);
	        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
	        //在公共参数中设置回跳和通知地址
	        request.setReturnUrl(SessionKeyConstant.RETURN_URL);
	        request.setNotifyUrl(SessionKeyConstant.NOTIFY_URL);

	        //商户订单号，商户网站订单系统中唯一订单号，必填
	        //生成随机Id
	        String out_trade_no = httpRequest.getParameter("oid");
	        httpRequest.getSession().setAttribute(SessionKeyConstant.UUIDOID, out_trade_no);
	       // System.out.println(httpRequest.getSession().getAttribute(SessionKeyConstant.UUIDOID)+"你你你");
	        //付款金额，必填
	        String total_amount =httpRequest.getParameter("total");
	       // System.out.println(total_amount+out_trade_no);
	        //订单名称，必填
	        String subject ="天天生鲜网上支付";
	        //商品描述，可空
	        String body = "";
	        request.setBizContent("{\"out_trade_no\":\""+out_trade_no +"\"," 
    				+ "\"total_amount\":\""+ total_amount +"\"," 
    				+ "\"subject\":\""+ " 天天生鲜支付 " +"\"," 
    				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
 
	        String form = "";
	        
	        try {
	            form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
	        } catch (AlipayApiException e) {
	            e.printStackTrace();
	        }
	        System.out.println(form);
	        httpResponse.setContentType("text/html;charset=" + SessionKeyConstant.CHARSET);
	        httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
	      
	        httpResponse.getWriter().flush();
	        httpResponse.getWriter().close();
		}
	
	

}
