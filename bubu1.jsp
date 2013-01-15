<%@ page language="java" contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@ page import="java.util.*, java.net.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%  

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>BuBu</title>
<style type='text/css'>
#board  {position:relative;
         width:558px;
         height:600px;
         background:gray;
        }
#board .ball
        {position:absolute;
         width:45px;
         height:29px;
         color:red;
        }
</style>
<div id=board>
<%
for(int i=0; i<10; i++){
	out.println("<img src=\"map.jpg\"><div class=ball><img src=\"bus2.png\"></div>");
}
%>
</div>

<script type='text/javascript'>

var balls=[[4,0],[2,0],[5,0],[11,0],[7,0],[9,0],[3,0],[2.7,0],[7,0],[1.0,0]];
var terminal_name= new Array(10);
terminal_name[0] = "�i�s�x";
terminal_name[1] = "���";
terminal_name[2] = "�_��";
terminal_name[3] = "���ɦx";
terminal_name[4] = "�����s��";
terminal_name[5] = "�����_��";
terminal_name[6] = "��������";
terminal_name[7] = "�������";
terminal_name[8] = "���F��";
terminal_name[9] = "�ìK";
//{"�i�s�x","���","�_��","���ɦx","�����s��","�����_��","��������","��������]","���F��","�ìK"};
function moveBall(id)
{
  var o=document.getElementById(id);
  var tb = document.getElementById("tb_bus");
  var w=parseInt(o.clientWidth)-45;
  var h=parseInt(o.clientHeight)-29;
  var bs_from=document.getElementsByName('from');
  var bs_to=document.getElementsByName('to');
  var bs_position=document.getElementsByName('position');
  var bs_speed=document.getElementsByName('speed');
  var bs_oil_consumption=document.getElementsByName('oil_consumption');
  
  for(var i=0; i < balls.length; i++){
    var bo=balls[i][2];
    var px=parseInt(bo.left);
    var py=parseInt(bo.top);
    px+=balls[i][0];
    if(px > w || px < 0) 
      balls[i][0]=-balls[i][0];
    py+=balls[i][1];
    if(py > h || py < 0) 
      balls[i][1]=-balls[i][1];
    bo.top=py+'px';
    bo.left=px+'px';
    if(bs_position.length >0){
    	// t1 = 20-30
		// t2 = 80-100
		// t3 = 145-175
		// t4 = 210-220
		// t5 = 260-275
		// t6 = 310-335
		// t7 = 375-385
		// t8 = 425-435
		// t9 = 475-485
		// t10= 525-535
		if(px >20 & px <30)
 			bs_position[i].innerHTML =terminal_name[0]+" ( "+px+" , "+py+" )";
 		else if(px >80 && px <100)
 			bs_position[i].innerHTML =terminal_name[1]+" ( "+px+" , "+py+" )";
 		else if(px >145 && px <175)
 			bs_position[i].innerHTML =terminal_name[2]+" ( "+px+" , "+py+" )";
 		else if(px >210 && px <220)
 			bs_position[i].innerHTML =terminal_name[3]+" ( "+px+" , "+py+" )";
 		else if(px >269 && px <275)
 			bs_position[i].innerHTML =terminal_name[4]+" ( "+px+" , "+py+" )";
 		else if(px >310 && px <335)
 			bs_position[i].innerHTML =terminal_name[5]+" ( "+px+" , "+py+" )";
 		else if(px >375 && px <385)
 			bs_position[i].innerHTML =terminal_name[6]+" ( "+px+" , "+py+" )";
 		else if(px >425 && px <435)
 			bs_position[i].innerHTML =terminal_name[7]+" ( "+px+" , "+py+" )";
 		else if(px >475 && px <485)
 			bs_position[i].innerHTML =terminal_name[8]+" ( "+px+" , "+py+" )";
 		else if(px+20 >525)
 			bs_position[i].innerHTML =terminal_name[9]+" ( "+px+" , "+py+" )";
  	}
  	if(bs_speed.length >0){
  		if(balls[i][0] >0)
  			bs_speed[i].innerHTML =(balls[i][0]*10)+"km/hr";
  		if(balls[i][0] <0)
  			bs_speed[i].innerHTML =(balls[i][0]*-10)+"km/hr";
  	}
  	if(bs_from.length >0){
  		bs_from[i].innerHTML =terminal_name[1];
  	}
  	if(bs_to.length >0){
  		bs_to[i].innerHTML =terminal_name[9];
  	}
  }
  setTimeout('moveBall("'+id+'")', 200);
}
function setBall(id)
{
  var bs=document.getElementById(id).getElementsByTagName('div');
  var bo;
  var top_gap = 76;
  for(i=0; i<10; i++){
  	bo=bs[i].style;
	balls[i][2]=bo;
	bo.top=(top_gap*i+17)+'px';
	bo.left='80px';
  }
}
setBall("board");
moveBall("board");
</script>
</head>
<body>
<div style="position:absolute; left:600px; top:30px;">
<table border='1' id='tb_bus'>
	<tr>
		<td>�s��</td>
		<td>�_��</td>
		<td>����</td>
		<td>�ثe��m</td>
		<td>���t</td>
		<td>�o��</td>
	</tr>
	<%
	String[] bus_number= {"","","","","","","","","",""};
	for(int i=0; i<10; i++){
		out.println("<tr>");
		out.println("<td>"+(i+1)+"</td>");
		out.println("<td width='50'><p id='from' name='from'></p></td>");
		out.println("<td width='50'><p id='to' name='to'></p></td>");
		out.println("<td width='200'><p id='position' name='position'></p></td>");
		out.println("<td width='70'><p id='speed' name='speed'></p></td>");
		out.println("<td width='50'><p id='oil_consumption' name='oil_consumption'></p></td>");
		out.println("</tr>");
	}
	%>
</table>
</div>
</body>
</html>
