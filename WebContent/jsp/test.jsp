<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="./favicon.ico">
    <title>库存盘点</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor/kindeditor.js"></script>
	
	//图表
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/assets/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/assets/demo.css">
    <script src="${pageContext.request.contextPath}/js/assets/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/js/assets/g.raphael.js"></script>
    <script src="${pageContext.request.contextPath}/js/assets/g.pie.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript"> 
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
$(function() {
    $("#check_all").click(function() {
         $('input[name="check_button"]').attr("checked",this.checked); 
     });
     var $subBox = $("input[name='check_button']");
     $subBox.click(function(){
         $("#check_all").attr("checked",$check_button.length == $("input[name='check_button']:checked").length ? true : false);
     });
 });
function outtable(){
	var i = new Array();
	var j = new Array();
	var  k=0;
	<c:forEach items="${resQueryintbList}" var="p">  
	 j[k]=${p.inNumber};
	 i[k]=${p.productId};
     k=k+1;
	</c:forEach>   
         var r = Raphael("holder"),
             pie = r.piechart(300, 250, 100,j, { legend: i, legendpos: "east"});
         r.text(320, 60, "Interactive Pie Chart").attr({ font: "20px sans-serif" });
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
     
}

</script>
    
</head>
<body>
</br>
</br>
</br>
<!-- 导出按键组件-->
<div id="holder"></div>
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
                    <!--<li>-->
                    <!--<a href="#" class="export-powerpoint">-->
                    <!--Save as PPT-->
                    <!--</a>-->
                    <!--</li>-->
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
        
        <input id="numb" type="hidden" value="${resQueryintbList}"/> 
    </div>
</div>
		<input type="button" value="图表分析" onclick="outtable()"/>
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
</body>
</html>
