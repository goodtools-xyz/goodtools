
<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<SCRIPT language=JavaScript>
function test()
{
	
		if(form1.str_username.value.length == 0)
	{
		alert("用户登陆帐号不可为空!") ;
		form1.str_username.focus() ;
		return false;
	}
	
	if(form1.str_pass.value.length == 0)
	{
		alert("用户密码不可为空!") ;
		form1.str_pass.focus() ;
		return false;
	}
	
		if(form1.str_pass2.value.length == 0)
	{
		alert("密码重复不可为空!") ;
		form1.str_pass2.focus() ;
		return false;
	}
		if(form1.str_pass.value!=form1.str_pass2.value)
	{
		alert("密码和密码重复不同!") ;
		form1.str_pass2.focus() ;
		return false;
	}
	return true;
};
function check()
{if (document.form1.all_check.checked)
for(i=0;i<document.form1.str_manage.length;i++)
  document.form1.str_manage[i].checked=true;
else
for(i=0;i<document.form1.str_manage.length;i++)
  document.form1.str_manage[i].checked=false;

}

</SCRIPT>

<html>
<head>
<title>后台管理—添加管理员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/style.css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="24%"><img src="../images/admin.gif" width="200" height="66"></td>
    <td width="76%" valign="bottom"><div align="right"><%=Copyright%></div></td>
  </tr>
  <tr> 
    <th height="22" colspan="2" class="tableHeaderText">&nbsp;&nbsp;::: 管理员控制面板 
      --&gt; 添加用户</th>
  </tr>
  <tr> 
    <td height="1" colspan="2"></td>
  </tr>
</table>
<br>
<table width="98%" border="1"  align=center cellpadding="0" cellspacing="1" class="tableBorder">
  <form action="add_save.asp" method="POST" name="form1" id="form1"  onSubmit="return test();">
    <tr> 
      <td height=25 class=forumRow><div align="right">用户登陆帐号：</div></td>
      <td class=forumRow >&nbsp; <input name="str_username" type="text" id="zt2" size="20"> 
        <font color="#FF6600">*（可用中文，英文，数字进行注册[3-12位，汉字2-6个]）</font></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">用户登陆密码：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow >&nbsp; <input name="str_pass" type="password" id="zt" value="888888" size="20"> 
        <font color="#FF6600">*（请用6-20位英文或数字，初始化为888888）</font></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow ><div align="right">重复密码：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_pass2" type="password" id="str_pass2" value="888888" size="20"> 
        <font color="#FF6600">*（初始化为888888）</font></td>
    </tr>
    <tr> 
      <th height=25 colspan="2" class="tableHeaderText"><div align="center">- 用户个人信息 -</div></th>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">用户姓名：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_name" type="text" id="str_name" size="20"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">性 别：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_sex" type="radio" value="男" checked>
        男<strong> </strong> &nbsp;&nbsp;&nbsp; <input type="radio" name="str_sex" value="女">
        女</td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">职 务：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_job" type="text" id="str_job" size="20"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">电 话：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_tel" type="text" id="str_tel" size="20"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">Email：</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_mail" type="text" id="str_mail" size="20"></td>
    </tr>
    <tr> 
      <td height=90 class=forumRow><div align="right">用户备注：</div></td>
      <td  class=forumRow>&nbsp; <textarea name="remark" cols="50" rows="5" id="remark"></textarea></td>
    </tr><!--
    <tr> 
      <th height=25 class="tableHeaderText"><div align="right">管理员级别：</div></th>
      <td height="25" class=forumRow>&nbsp;
	   <input name="str_level" type="radio" value="1" checked>
      低级管理员 
          <input name="str_level" type="radio" value="2" checked="checked">管理员
		  <input name="str_level" type="radio" value="3">
        <font color="#FF0000">超级管理员</font>（只有超级管理员才有添加/修改/删除权限）</td>
    </tr>-->

    <tr> 
      <td width="16%" height=39 class=forumRow><div align="center">&nbsp; </div></td>
      <td width="84%"class=forumRow> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="Submit" type="submit" value=" 添加 "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="Submit2" type="reset" value=" 清空 "></td>
    </tr>
  </form>
</table>
<br>
<div align="center"><br>
</div>
</body>
</html>
