<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>系统帮助</title>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<style type="text/css">
		.demo{padding: 10% 0;background: #fff;}
		a:hover,a:focus{
		    outline: none;
		    text-decoration: none;
		}
		.tab .nav-tabs{
		    border-bottom: none;
		    position: relative;
		}
		.tab .nav-tabs li{
		    margin-right: 60px;
		    z-index: 1;
		}
		.tab .nav-tabs li:after{
		    content: "";
		    width: 100%;
		    border: 1px solid #ccc6c6;
		    position: absolute;
		    top: 50%;
		    right: -60%;
		    z-index: -1;
		}
		.tab .nav-tabs li:last-child:after{
		    border: none;
		}
		.tab .nav-tabs li a{
		    display: block;
		    padding: 15px 20px;
		    background: #fff;
		    font-size: 15px;
		    font-weight: 600;
		    color: #956cae;
		    text-transform: uppercase;
		    border-radius: 0;
		    margin-right: 0;
		    border: 2px solid #956cae;
		    position: relative;
		    overflow: hidden;
		    z-index: 1;
		    transition: all 0.3s ease 0s;
		}
		.tab .nav-tabs li.active a,
		.tab .nav-tabs li a:hover{
		    color: #fff;
		    border: 2px solid #956cae;
		}
		.tab .nav-tabs li a:after{
		    content: "";
		    display: block;
		    width: 100%;
		    height: 0;
		    position: absolute;
		    top: 0;
		    left: 0;
		    z-index: -1;
		    transition: all 0.3s ease 0s;
		}
		.tab .nav-tabs li.active a:after,
		.tab .nav-tabs li a:hover:after{
		    height: 100%;
		    background: #956cae;
		}
		.tab .tab-content{
		    padding: 20px 10px;
		    margin-top: 0;
		    font-size: 14px;
		    color: #999;
		    line-height: 26px;
		}
		.tab .tab-content h3{
		    font-size: 24px;
		    margin-top: 0;
		}
		@media only screen and (max-width: 767px){
		    .tab .nav-tabs li{ margin: 0 25px 0 0; }
		}
		@media only screen and (max-width: 479px){
		    .tab .nav-tabs li{
		        width: 100%;
		        text-align: center;
		        margin: 0 0 10px 0;
		    }
		    .tab .nav-tabs li:after{
		        width: 0;
		        height: 100%;
		        top: auto;
		        bottom: -60%;
		        right: 50%;
		    }
		}
	</style>
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>系统帮助</h1>
		</header>
		<div class="demo">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-offset-3 col-md-6">
		                    <div class="tab" role="tabpanel">
		                        <ul class="nav nav-tabs" role="tablist">
		                            <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">问题1</a></li>
		                           <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">问题2</a></li>
		                           <li role="presentation"><a href="#Section3" aria-controls="messages" role="tab" data-toggle="tab">问题3</a></li>
		                        </ul>
		                        <div class="tab-content tabs">
		                            <div role="tabpanel" class="tab-pane fade in active" id="Section1">
		                                <h3>系统里面里面的电子表单可以打印到本地成为excel或其他类型的表格吗？</h3>
										<p>可以的，本系统支持在线的电子表格打印输出到本地，转化为excel或其他类型的表格。</p>
		                            </div>
		                            <div role="tabpanel" class="tab-pane fade" id="Section2">
		                                <h3>系统里面那个地图是怎么回事？</h3>
										<p>系统里面的地图的作用就是分布显示仓库供应商的信息，给仓储管理人员一个直观的仓库管理分布图，为仓储管理人员提供一个清晰的仓储配置决策依据。</p>
		                            </div>
		                            <div role="tabpanel" class="tab-pane fade" id="Section3">
		                                <h3>系统帮助界面里面的捐助模块是干什么的？</h3>
										<p>哈哈！这个功能就是希望广大的仓储管理人员为辛苦的系统开发人员捐助那么一丢丢money，在经济上面激励系统开发人员能更好的维护系统和优化整个系统的逻辑结构，提高系统的运行效率。</p>
		                            </div>
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
	</div>
	<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>