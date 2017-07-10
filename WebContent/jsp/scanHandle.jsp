<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/people.css" media="screen" type="text/css" />
    <style type="text/css">
    .ani {
        position: fixed;
        top: 44%;   
        width: 230px;
        height: 160px;        
    }
    .anima {
        animation: move 1s infinite linear;
    }
    .hidden {
        display: none;
    }
    @keyframes move{
        from {
            transform:translateX(0px);
        }
        to {
            transform:translateX(-600px);
        }
    }
    .right {
        position: fixed;
        top: 25%;     
        width: 350px;
        height: 350px;
    }
    #con{
        margin:240px auto;
        text-align: center;
    }
    #top{
        position: fixed;
        top: 0;
        background: #6B6BFA;
        width:100%;
        height:130px;
    }
    #bottom{
        position: fixed;
        bottom: 0;
        background: #6B6BFA;
        width:100%;
        height:130px;
    }
    .butters{
        position: fixed;
        top: 1;
        margin-left: 75%;  
    }
    h1{ text-align:center;} 
    </style>
    <script type="text/javascript">
    function start(){
        var con = document.getElementById("con");
        var ani = document.getElementById("ani");
		ani.className="ani anima";
		setTimeout("jump()",3000);
    }
    function jump(){
        //这里动画播放完毕进行页面的跳转
        window.open("${pageContext.request.contextPath}/intbListOuttb.do","_self");
    }
    
    window.onresize = function()
    {
        var w = window.innerWidth;
        var img = document.getElementById("store");
        if(w >= 1200)
        {
            img.setAttribute("margin-left","1000px");
        }
        else if( w < 1200 && w >= 992)
        {
            img.setAttribute("margin-left","900px");
        }
        else if( w < 992 && w >= 768)
        {
            img.setAttribute("margin-left","800px");
        }
        else
        {
            img.setAttribute("margin-left","20px");
        }
    }
    </script>
</head>
<body onload="start()">
    <div id="top"> <h1>Operation Success</h1></div>
    <div id="con">
        <img id="ani" class="ani" src="${pageContext.request.contextPath}/images/carout.png" alt="货物的图标"/>
        <img class="right" src="${pageContext.request.contextPath}/images/thingout.png" alt="仓库的图标" id="store"  style="margin-right:100"/>
    </div>
    <section class="butters">
        <div class="hair"></div> 
        <div class="head">
                <div class="eyebrow"></div>
                <div class="eye">
                    <div class="iris"></div>
                    <div class="iris-up"></div>
                </div>
                <div class="closed_eye">
                    <div class="closed_eyelid"></div>
                </div> 
                <div class="mouth"></div>  
                <div class="opened_mouth"></div>       
        </div>
        <div class="body">
            <div class="armpits"></div>
            <div class="ziper"></div>  
            <div class="arm">
            <div class="hand">
                <div class="thumb"></div>
            </div>
            </div>
        </div>
        <div class="leg">
            <div class="feet"></div>  
        </div> 
    </section>
    <div id="bottom"></div>
</body>
</html>