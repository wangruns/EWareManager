<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>

</head>
<body style="background:#f0f9fd;">
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span></span><span></span>基本信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="${pageContext.request.contextPath}/productType.do" target="rightFrame">商品分类</a><i></i></li>
        <li class="active"><cite></cite><a href="${pageContext.request.contextPath}/productBrand.do" target="rightFrame">商品品牌</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/shelf.do" target="rightFrame">货架管理</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/qrcode.do" target="rightFrame">条码管理</a><i></i></li>
        </ul>    
    </dd>
    
    </dl>
    
</body>

</html> --%>










<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Responsive Mail UI - CodePen</title>
<link rel="stylesheet" type="text/css" href="css/leftStyle.css"/>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" />

<script language="javascript" src="js/jquery.js"></script>
<script src="js/prefixfree.min.js"></script>

<script type="text/javascript">

$(function(){	
	//导航切换
	$(".menu-segment li").click(function(){
		$(".menu-segment li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>

</head>

<body>

  <aside id="sidebar" class="nano">
  <div class="nano-content">
    <div class="logo-container"><span class="logo glyphicon glyphicon-envelope"></span>${userName}</div>
    <menu class="menu-segment">
      <ul>
        <li class="active"><a href="${pageContext.request.contextPath}/productType.do" target="rightFrame">商品分类</a></li>
        <li><a href="${pageContext.request.contextPath}/productBrand.do" target="rightFrame">商品品牌</a></li>
        <li><a href="${pageContext.request.contextPath}/shelf.do" target="rightFrame">货架管理</a></li>
        <li><a href="${pageContext.request.contextPath}/qrcode.do" target="rightFrame">条码管理</a></li>
      </ul>
    </menu>
  </div>
</aside>

<script src="js/index.js"></script>
</body>

</html>