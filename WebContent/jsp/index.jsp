<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>供应商分布式信息显示</title>
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css" />
<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.3&key=cb0e4b1936ee17c27cdf93a26bb08bfa"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<style type="text/css">
        .info {
            border: solid 1px silver;
        }
        div.info-top {
            position: relative;
            background: none repeat scroll 0 0 #F9F9F9;
            border-bottom: 1px solid #CCC;
            border-radius: 5px 5px 0 0;
        }
        div.info-top div {
            display: inline-block;
            color: #333333;
            font-size: 14px;
            font-weight: bold;
            line-height: 31px;
            padding: 0 10px;
        }
        div.info-top img {
            position: absolute;
            top: 10px;
            right: 10px;
            transition-duration: 0.25s;
        }
        div.info-top img:hover {
            box-shadow: 0px 0px 5px #000;
        }
        div.info-middle {
            font-size: 12px;
            padding: 6px;
            line-height: 20px;
        }
        div.info-bottom {
            height: 0px;
            width: 100%;
            clear: both;
            text-align: center;
        }
        div.info-bottom img {
            position: relative;
            z-index: 104;
        }
        span {
            margin-left: 5px;
            font-size: 11px;
        }
        .info-middle img {
            float: left;
            margin-right: 6px;
        }
    </style>
</head>
<body>
	<input type="hidden" value="${resProviderAddress}" id ="test_num">
	<input type="hidden" value="${resProviderName}" id ="test_Name">
	<input type="hidden" value="${resProviderPhone}" id ="test_pho">
	<input type="hidden" value="${resProviderEmail}" id ="test_email">
	<div id="container"></div>
	<script>
		var map = new AMap.Map('container', {
			resizeEnable : true,
			zoom : 5,
			center : [106.287134,29.586175]
		});
		map.setMapStyle('amap://styles/'+'light');
		var icon = new AMap.Icon({
			image : "${pageContext.request.contextPath}/images/warehouse.png",
			size : new AMap.Size(64, 64)
		});
		var marker = new AMap.Marker({
			icon : icon,
			map : map
		});
		var address=[];
		var nameArray=[];
		var phoArray=[];
		var emailArray=[];
		var nu =document.getElementById("test_num").value;
		var Name =document.getElementById("test_Name").value;
		var Pho =document.getElementById("test_pho").value;
		var Email =document.getElementById("test_email").value;
		//获取地址
		var arrayObj = new Array();
		var arrayObj=nu.split(",");
 		for(var i=0;i<arrayObj.length;i++){
 			if(i==0){
 				var y=arrayObj[i].indexOf("=");
 				address[i]=arrayObj[i].substring(1,y);	
 				continue;
 			}
			var y=arrayObj[i].indexOf("=");
			address[i]=arrayObj[i].substring(0,y);
 		}
 		//获取名字
 		var arrayObj2 = new Array();
		var arrayObj2=Name.split(",");
 		for(var i=0;i<arrayObj2.length;i++){
 			if(i==0){
 				var y=arrayObj2[i].indexOf("=");
 				nameArray[i]=arrayObj2[i].substring(1,y);	
 				continue;
 			}
			var y=arrayObj2[i].indexOf("=");
			nameArray[i]=arrayObj2[i].substring(0,y);
 		}
 		//获取电话
 		var arrayObj3 = new Array();
		var arrayObj3=Pho.split(",");
 		for(var i=0;i<arrayObj3.length;i++){
 			if(i==0){
 				var y=arrayObj3[i].indexOf("=");
 				phoArray[i]=arrayObj3[i].substring(1,y);	
 				continue;
 			}
			var y=arrayObj3[i].indexOf("=");
			phoArray[i]=arrayObj3[i].substring(0,y);
 		}
 		//获取邮箱
 		var arrayObj4 = new Array();
		var arrayObj4=Email.split(",");
 		for(var i=0;i<arrayObj4.length;i++){
 			if(i==0){
 				var y=arrayObj4[i].indexOf("=");
 				emailArray[i]=arrayObj4[i].substring(1,y);	
 				continue;
 			}
			var y=arrayObj4[i].indexOf("=");
			emailArray[i]=arrayObj4[i].substring(0,y);
 		}
		var Latitude_and_longitude=[];
		var len=address.length;
		var marks=[];
		//这个变量用于解决异步的问题
		var flags=false;
		var count=0;
		AMap.service('AMap.Geocoder', function() {//回调函数
			//实例化Geocoder
			geocoder = new AMap.Geocoder({});
			//地理编码
			for(var i=0;i<len;i++){
				geocoder.getLocation(address[i], function(status, result) {
					if (status === 'complete' && result.info === 'OK') {
						Latitude_and_longitude.push(result.geocodes[0].location);
						marks[count]=new AMap.Marker({
							position: Latitude_and_longitude[count],
							map: map
					    });
					    //给Marker绑定单击事件
					    marks[count].on('click', markerClick);
						count++;
						if(count==len-1){
							myfun();
						}
					} else {
						//获取经纬度失败
						alert("获取经纬度失败");
					}
				});
			}
		})
		
		//这里运用数组记录信息
		var title_name=[];
		//这里运用数组记录信息
		for(var i=0;i<len;i++){
			title_name.push(i+1+"号供应商");
		}
	    var content_value=[];
	    for(var i=0;i<len;i++){
	    	content_value[i]=new Array();
	    	//在这地方添加数据
	    	content_value[i].push("<img src='${pageContext.request.contextPath}/images/W.png'/>");
	    	content_value[i].push("联系人："+nameArray[i]);
	    	content_value[i].push("电话："+phoArray[i]);
	    	content_value[i].push("邮件："+emailArray[i]);
	    }
	    var infoWindow_value=[];
	    for(var i=0;i<len;i++){
	    	infoWindow_value[i]= new AMap.InfoWindow({
	    	     isCustom: true,  //使用自定义窗体
	    	     content: createInfoWindow(title_name[i], content_value[i].join("<br/>")),
	    	     offset: new AMap.Pixel(16, -45)
	    	});
	    }
		
		//这里表示自定义的信息窗口
		//构建自定义信息窗体
    	function createInfoWindow(title, content) {
        	var info = document.createElement("div");
        	info.className = "info";
        	//可以通过下面的方式修改自定义窗体的宽高
        	info.style.width = "250px";
        	// 定义顶部标题
        	var top = document.createElement("div");
        	var titleD = document.createElement("div");
        	var closeX = document.createElement("img");
        	top.className = "info-top";
        	titleD.innerHTML = title;
        	closeX.src = "http://webapi.amap.com/images/close2.gif";
        	closeX.onclick = closeInfoWindow;
        	top.appendChild(titleD);
        	top.appendChild(closeX);
        	info.appendChild(top);
        	// 定义中部内容
        	var middle = document.createElement("div");
        	middle.className = "info-middle";
        	middle.style.backgroundColor = 'white';
        	middle.innerHTML = content;
        	info.appendChild(middle);
        	// 定义底部内容
        	var bottom = document.createElement("div");
        	bottom.className = "info-bottom";
        	bottom.style.position = 'relative';
        	bottom.style.top = '0px';
        	bottom.style.margin = '0 auto';
        	var sharp = document.createElement("img");
        	sharp.src = "http://webapi.amap.com/images/sharp.png";
        	bottom.appendChild(sharp);
        	info.appendChild(bottom);
        	return info;
    	}
    	//关闭信息窗体
        function closeInfoWindow() {
            map.clearInfoWindow();
        }
		//这里点击事件的函数
		function markerClick(e){
			//这里的for循环用于提取位置信息
			var target;
			for(var i=0;i<len;i++){
				if(Latitude_and_longitude[i]==e.target.getPosition()){
					target=i;
					break;
				}
			}
			infoWindow_value[target].open(map, e.target.getPosition());
		}
		//这里表示巡航器道路二等函数
		function myfun(){
			AMapUI.load(['ui/misc/PathSimplifier'], function(PathSimplifier) {
		        if (!PathSimplifier.supportCanvas) {
		            alert('当前环境不支持 Canvas！');
		            return;
		        }
		        //just some colors
		        var colors = [
		            "#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00",
		            "#b82e2e", "#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc", "#e67300", "#8b0707",
		            "#651067", "#329262", "#5574a6", "#3b3eac"
		        ];
		        var pathSimplifierIns = new PathSimplifier({
		            zIndex: 100,
		            //autoSetFitView:false,
		            map: map, //所属的地图实例
		            getPath: function(pathData, pathIndex) {
		                return pathData.path;
		            },
		            getHoverTitle: function(pathData, pathIndex, pointIndex) {
		                if (pointIndex >= 0) {
		                    //point 
		                    return pathData.name + '，点：' + pointIndex + '/' + pathData.path.length;
		                }
		                return pathData.name + '，点数量' + pathData.path.length;
		            },
		            renderOptions: {
		                pathLineStyle: {
		                    dirArrowStyle: true
		                },
		                getPathStyle: function(pathItem, zoom) {
		                    var color = colors[pathItem.pathIndex % colors.length],
		                        lineWidth = Math.round(4 * Math.pow(1.1, zoom - 3));
		                    return {
		                        pathLineStyle: {
		                            strokeStyle: color,
		                            lineWidth: lineWidth
		                        },
		                        pathLineSelectedStyle: {
		                            lineWidth: lineWidth + 2
		                        },
		                        pathNavigatorStyle: {
		                            fillStyle: color
		                        }
		                    };
		                }
		            }
		        });
		        window.pathSimplifierIns = pathSimplifierIns;
		        //这里表示加载数据
	            var data=[];
	            for(var i=0;i<len;i++){
	            	data[i]={
	            			name: address[i]+"-重庆",
	                        path: PathSimplifier.getGeodesicPath(Latitude_and_longitude[i],[106.287134,29.586175],300)
	            	}
	            }
	            pathSimplifierIns.setData(data);
	            //这里创建所有的巡航器
	            var navg=[];
	            for(var i=0;i<len;i++){
	            	navg[i] = pathSimplifierIns.createPathNavigator(i, {
		                loop: true,
		                speed: 1000000,
		                pathNavigatorStyle: {
		                    width: 32,
		                    height: 32,
		                    //使用图片
		                    content: PathSimplifier.Render.Canvas.getImageContent('${pageContext.request.contextPath}/images/plane.png', null, null),
		                    strokeStyle: null,
		                    fillStyle: null,
		                    //经过路径的样式
		                    pathLinePassedStyle: {
		                        lineWidth: 6,
		                        strokeStyle: 'black',
		                        dirArrowStyle: {
		                            stepSpace: 15,
		                            strokeStyle: 'red'
		                        }
		                    }
		                }
		            });
	            	navg[i].start();
	            }
		    });
		}
	</script>
</body>
</html>