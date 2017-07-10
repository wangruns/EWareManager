package cn.it.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Intb;
import cn.it.model.Outtb;
import cn.it.model.Product;
import cn.it.service.OuttbService;
import cn.it.service.ProductInService;
import cn.it.service.ProductService;
import cn.it.service.UserService;
 
@Controller
public class AndroidServerServlet {
	@Autowired
	private ProductInService productInService ;
	@Autowired
	private OuttbService productOutService ;
 
    @RequestMapping(value="AndroidServerServlet.do")
    public void AndroidServerServlet(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //Android���͹���������Ʒ��ID,��Ҫ����ID�Ƿ�Ϸ�
        String strCodeId=request.getParameter("codeId");
        int codeId=-1;
        if(strCodeId!=null){
        	codeId=Integer.parseInt(strCodeId);
        }
        //��ȡ��Ӧ�Ķ���
        Intb productIn=productInService.findProductByProductId(codeId);
        if(productIn!=null){
        	int producIntNumber=productIn.getInNumber();
        	productIn.setInNumber(producIntNumber+1);
        	//���¶���
        	productInService.updateProductIn(productIn);
        	 //�������ͻ���200
        	  String data="Lucky";
              OutputStream outputStream = response.getOutputStream();//��ȡOutputStream�����
              response.setHeader("content-type", "text/plain;charset=UTF-8");
              byte[] dataByteArr = data.getBytes("UTF-8");
              outputStream.write(dataByteArr);
              response.setStatus(200);
        }else{
        	//�������ͻ���400
        	String data="Lucky";
            OutputStream outputStream = response.getOutputStream();//��ȡOutputStream�����
            response.setHeader("content-type", "text/plain;charset=UTF-8");
            byte[] dataByteArr = data.getBytes("UTF-8");
            outputStream.write(dataByteArr);
            response.setStatus(400);
        }
    }
    
    @RequestMapping(value="AndroidServerServletOut.do")
    public void AndroidServerServletOut(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //Android���͹���������Ʒ��ID,��Ҫ����ID�Ƿ�Ϸ�
        String strCodeId=request.getParameter("codeId");
        int outId=-1;
        if(strCodeId!=null){
        	outId=Integer.parseInt(strCodeId);
        }
        //��ȡ��Ӧ�Ķ���
        Outtb productOut=productOutService.findOutByOutId(outId);
        if(productOut!=null){
        	int producIntNumber=productOut.getOutNumber();
        	productOut.setOutNumber(producIntNumber+1);
        	//���¶���
        	productOutService.updateOut(productOut);
        	 //�������ͻ���200
        	  String data="Lucky";
              OutputStream outputStream = response.getOutputStream();//��ȡOutputStream�����
              response.setHeader("content-type", "text/plain;charset=UTF-8");
              byte[] dataByteArr = data.getBytes("UTF-8");
              outputStream.write(dataByteArr);
              response.setStatus(200);
        }else{
        	//�������ͻ���400
        	String data="Lucky";
            OutputStream outputStream = response.getOutputStream();//��ȡOutputStream�����
            response.setHeader("content-type", "text/plain;charset=UTF-8");
            byte[] dataByteArr = data.getBytes("UTF-8");
            outputStream.write(dataByteArr);
            response.setStatus(400);
        }
    }
    
}