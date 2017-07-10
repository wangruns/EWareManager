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
</head>
<body>
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
		                    content: PathSimplifier.Render.Canvas.getImageContent('../images/plane.png', null, null),
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