<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>在线支付</title>
  </head>
  <style type="text/css">
	.div_box_pay{
		position: relative;
		margin: 10% 20%;
		border-radius: 20px;
		height: 200px;
		background-color: rgb(64,128,128)!important;
	}
  </style>
  <body style="background-color:rgb(200,200,200);">
  		<div class="div_box_pay">
 <form action="${pageContext.request.contextPath }/servlet/PayRequestServlet" method="post">
      	<span style="position:relative;top:10px;margin:0px 32%;font-size:22px;color:#fff;">请您选择在线支付银行</span>
      	<table width="100%" style="position:relative;margin-left:23px;">
			<input type="hidden" name="orderid" value="${param.orderid }">
    		<input type="hidden" name="money" value="${param.money }">
			<tr><td><br/></td></tr>
			<tr>
			  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET"><span style="color:#fff;">招商银行</span> </td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET">工商银行</td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET">农业银行</td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET">建设银行 </td>
			</tr>
			<tr>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET">中国民生银行总行</td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET" >光大银行 </td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET">交通银行</td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET">深圳发展银行</td>
			</tr>
			<tr>
			  <td style="color:#fff;"> <INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET">北京银行</td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET">兴业银行 </td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET">上海浦东发展银行 </td>
			  <td style="color:#fff;"><INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET">中信银行</td>
			</tr>
			<tr><td><br/></td></tr>
     	</table>
     	<INPUT TYPE="submit" value="确 定 支 付" style="position:relative;margin-top:0%;margin-left: 38%;color:#fff;border-radius:15px;width:110px;height:35px;background-color:rgb(0,179,45);border:0px solid;font-size:15px;">
   		</form>
  		</div>
       
  </body>
</html>
