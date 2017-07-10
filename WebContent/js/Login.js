

var variable_1 = ['top','left'];
var variable_2 = 0;
var variable_3;
var co="";
//窗口震动
function shock()
{
	Login_div.style[variable_1[variable_2 % 2]] = (variable_2++) % 4 < 2 ? "0px" : "4px";
    if (variable_2 > 15) 
     {
       clearInterval(variable_3);
       variable_2 = 0
     }
}
function shock_1()
{

	clearInterval(variable_3);
	variable_3 = setInterval(shock, 32)
}
function check_error()
{
	shock_1();
}

function check_error()
{
	//账号密码错误则震动
	
	var userID = $('#input_Log').val();
	var pasNub = $('#pas').val();
	if(userID == "")
	{
		$("#checkBox").css('display','block');
		$("#Login_div").css('height','400px');
		shock_1();
	}
	else
	document.getElementById("form_Login").submit();  
}
function loadimage() {
	document.getElementById("randImage").src = "jsp/verificationCodeLoad.jsp?"
			+ Math.random();
}