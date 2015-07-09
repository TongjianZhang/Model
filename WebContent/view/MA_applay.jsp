<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,net.gslab.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MA_applayed</title>
	  <link rel="stylesheet" type="text/css" href="../css/MA_applay.css">
    <script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
    <link  rel="stylesheet" type="text/css" href="../css/setpage.css">  
</head>

<body class="body">
 <div class="MA_applay">
<!--    <div class="buttonBlock">
  	<form class="buttonForm">
      <input type="button"  value="删除" />
    </form>
    <form class="buttonForm">
      <input type="button"  value="刷新" />
    </form >
    <form class="buttonForm1">
      <select class="list" name="conta" >
       <option value="volvo"selected="selected">每页显示</option>
       <option value="saab">Saab</option>
       <option value="fiat">Fiat</option>
       <option value="audi">Audi</option>
      </select>
    </form>
    <form class="buttonSearch">
         <fieldset>
           <input type="text" placeholder="搜索关键词" name="s" x-webkit-speech>
           <input type="button" value="搜索" />
         </fieldset>
    </form>
  </div>   闭合buttonBlock--> 
  <table class="tableA" border="1" >
   <tr>
 
    <th width="8%">年级</td>
    <th width="8%">姓名</td>
    <th width="10%">专业</td>
    <th width="8%">分组</td>
    <th width="10%">E-mail</td>
    <th width="10%">电话</td>
    <th width="12%">创建时间</td>
    <th width="8%">状态</td>
    <th width="8%">操作</td>
   </tr>
  </table>
  <HR style="FILTER:  progid:DXImageTransform.Microsoft.Shadow(color:#f6ae56,direction:145,strength:15)"  >


 
  <table class="tableB" border="1" >
    <%
 	List<User> users = new ArrayList<User>();
 	users =(List<User>)request.getAttribute("users");
 	if(users!=null){
 	for(int i=0;i<users.size();i++){
 		%>
   <tr class="tr">
  
    
    <td width="8%"><%=users.get(i).getGrade() %></td>
    <td width="8%"><%=users.get(i).getUserName() %></td>
    <td width="10%">软件工程</td>
    <td width="8%"><%=users.get(i).getCategory() %></td>
    <td width="10%"><%=users.get(i).getEmail() %></td>
    <td width="10%"><%=users.get(i).getMobilePhone() %></td>
    <td width="12%"><%=users.get(i).getSetUpTime() %></td>
    <td width="8%">未处理</td>
    <td width="8%"><a href="detail?userId=<%=users.get(i).getUserId() %>">查看</a></td>

   </tr>
<%  	}
 	}
 
 
 %>
  </table>
  

  <div class ="bottom" id="setpage">
<!--       <a class="aa" href="http://www.baidu.com/">首页</a>
      <a class="aa" href="http://www.baidu.com/">上一页</a>
      <a class="aa" href="http://www.baidu.com/">下一页</a>
      <a class="aa" href="http://www.baidu.com/">尾页</a>
      <a class="ab">页数：1/1</a>
      <a class="aa">转到</a>
      <select  name="conta" >
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
      </select> -->
   </div><!--闭合bottom-->
 </div><!--闭合MA_haveApplayed-->
 <script type="text/javascript"src="../js/setpage.js"></script>
<script type="text/javascript">
var applays;
    function reloadpage(target)//target第几页
   {
     loadXMLDoc("url?page="+target,function()
        {
          if (xmlhttp.readyState==4 && xmlhttp.status==200)
             {
                var item;
                var jsonStr=xmlhttp.responseText;
                applays=JSON.parse(jsonStr);
                for(var i=0;i<applays.length;i++){
                    item+="<tr class='tr'><td width='10%'><input type='checkbox' name='bike' /></td><td width='8%'>"+applays[i].grade+"</td><td width='8%'>"+applays[i].userName+"</td><td width='10%'>"+applays[i].major+"</td><td width='8%'>"+applays[i].groupName+"</td><td width='10%'>"+applays[i].email+"</td><td width='10%'>"+applays[i].mobilePhone+"</td><td width='12%'>"+applays[i].createDate+"</td><td width='8%'>未处理</td><td width='8%'><a href='http://www.baidu.com/'>"+applays[i].applayStatus+"</a></td></tr>"
                }
                $(".tableB").prepend(item);
             }
        });
   }

setpage(); 
</script>
</body>
</html>