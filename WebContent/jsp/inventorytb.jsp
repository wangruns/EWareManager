<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="./favicon.ico">
    <title>库存盘点</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor/kindeditor.js"></script>

	<!-- 图表 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/assets/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/assets/demo.css">
    <script src="${pageContext.request.contextPath}/js/assets/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/js/assets/g.raphael.js"></script>
    <script src="${pageContext.request.contextPath}/js/assets/g.pie.js"></script>
    
    <!-- table -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datatable/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datatable/dataTables.bootstrap.css  "/>
	<script src="${pageContext.request.contextPath}/js/datatable/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/datatable/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/js/datatable/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/datatable/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.combo.select.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tableselect.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript"> 
$(function(){
	var m = new Array();
	var j = new Array();
	var  k=0;
	var name= document.getElementById("check_name").value;
	var arrayObj = new Array();
	var arrayObj=name.split(",");
		for(var i=0;i<arrayObj.length;i++){
			if(i==0){
				m[i]=arrayObj[i].substring(1);
				continue;
			}
			if(i>0&&i==arrayObj.length-1){
				m[i]=arrayObj[i].substring(0,arrayObj[i].length-1);
				continue;
			}
		m[i]=arrayObj[i];
		}
	
	<c:forEach items="${resQuerychecktbList}" var="p">  
	 j[k]=${p.checkNumber};
     k=k+1;
	</c:forEach>   
         var r = Raphael("holder"),
             pie = r.piechart(300, 250, 160,j, { legend: m, legendpos: "east"});
         r.text(290, 40, "盘点饼状分析图").attr({ font: "20px sans-serif" });
         pie.hover(function () {
             this.sector.stop();
             this.sector.scale(1.1, 1.1, this.cx, this.cy);
             if (this.label) {
                 this.label[0].stop();
                 this.label[0].attr({ r: 7.5 });
                 this.label[1].attr({ "font-weight": 800 });
             }
         }, function () {
             this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

             if (this.label) {
                 this.label[0].animate({ r: 5 }, 500, "bounce");
                 this.label[1].attr({ "font-weight": 400 });
             }
         });
     
});
</script>
    
</head>
<body style="background-color:rgb(255,255,255);">
</br>
</br>
</br>
<!-- 导出按键组件-->
<div class="container ">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-9 text-center">
            <div class="btn-group pull-right">
                <button data-toggle="dropdown" class="btn btn-success dropdown-toggle">
                    导出
                </button>
                <ul class="dropdown-menu dropdown-light pull-right">
                    <li>
                        <a href="#" class="export-csv">
                            Save as CSV
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-tsv">
                            Save as TSV
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-pdf">
                            Save as PDF
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-png">
                            Save as PNG
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-excel">
                            Save as XLS
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-xlsx">
                            Save as XLSX
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-doc">
                            Save as DOC
                        </a>
                    </li>

                    <li>
                        <a href="#" class="export-txt">
                            Save as TXT
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-xml">
                            Save as XML
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-sql">
                            Export to SQL
                        </a>
                    </li>
                    <li>
                        <a href="#" class="export-json">
                            Export to JSON
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover table-condensed " id="testInfo">
            <thead>
            <tr>
        <th>盘点ID</th>
        <th>货架ID</th>
        <th>用户ID</th>
        <th>产品ID</th>
        <th>盘点数量</th>
        <th>盘点日期</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${resQuerychecktbList}" var="p">
        <tr >        
        <td>${p.checkId}</td>
        <td>${p.shelfId}</td>
        <td>${p.userId}</td>
        <td>${p.productId}</td>
        <td>${p.checkNumber}</td>
        <td>${p.checkDate}</td>       
        </tr> 
		</c:forEach>
            </tbody>
        </table>
    </div>
</div>
<input id="check_name" value="${resChecktbProductName}" type="hidden">
<!-- 图表模式 -->
<div id="holder"></div>


<script src="./js/js/table.js"></script>
<script src="./js/tableExport/libs/pdfMake/pdfmake.min.js"></script>
<script src="./js/tableExport/libs/pdfMake/vfs_fonts.js"></script>

<script type="text/javascript" src="./js/tableExport/libs/FileSaver/FileSaver.min.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/js-xlsx/xlsx.core.min.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/jsPDF/jspdf.min.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/jsPDF-AutoTable/jspdf.plugin.autotable.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/html2canvas/html2canvas.min.js"></script>
<script type="text/javascript" src="./js/tableExport/tableExport.js"></script>
<script src="./js/js/table-export.js"></script>

<script>
    jQuery(document).ready(function () {
        TableExport.init();
    });
    
</script>
<style type="text-css">
th{
	text-align: center;
}
</style>
</body>
</html>
