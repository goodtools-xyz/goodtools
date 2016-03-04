<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<script>
 var sett;
 var i=1;
function $(id){return document.getElementById(id)}
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){
if (i%2==1)
	clearTimeout(sett)
else
	scrollWindow();
	i++;
}
document.ondblclick=scrollWindow2;
</script>
<%
response.Buffer=true
Server.ScriptTimeOut=9999999


Set oRs=conn.Execute("Select Top 1 * From qingtiandh_drive Where id=1")
IF oRs.Eof Then
	Response.Write "<script>window.location='../qingtiancms.com.main.asp'</script>"
	Response.End() 
Else
	oDataVer1=oRs("DataVer1")
	oDataVer2=oRs("DataVer2")		
End IF


IF Request("Id2")="" Then
	ID2 = oDataVer1
Else
	ID2 = Request("Id2")
End IF
If Clng(ID2)<=Clng(oDataVer2) Then
	str=N_Fso.ReadAllTextFile(Add_Root_Dir("/backup/Data/"&ID2&".txt"))
	IF Instr(str,"<qingtiandy_url>")>0 Then
		qingtiandy_url=GetContent(str,"<qingtiandy_url>","</qingtiandy_url>",0)
	ElseIF 	Instr(str,"<qingtiandh_type2>")>0 Then
		qingtiandy_url=GetContent(str,"<qingtiandh_type2>","</qingtiandh_type2>",0)
	ElseIF 	Instr(str,"<qingtiandh_type3>")>0 Then
		qingtiandy_url=GetContent(str,"<qingtiandh_type3>","</qingtiandh_type3>",0)		
	End IF
	
	IF qingtiandy_url="" Then
		Response.Write "<font color=red>数据库文件("&Add_Root_Dir("/backup/Data/"&ID2&".txt")&")不存在</font><br>"
		Response.End()
	Else
		N_Fso.CopyFiles Add_Root_Dir(G_CONN_STR),Add_Root_Dir("backup/db/Data_"&(ID2-1)&".txt")
		IF Instr(str,"<qingtiandy_url>")>0 Then
			In_qingtiandh_list qingtiandy_url,ID2,oDataVer2
		ElseIF 	Instr(str,"<qingtiandh_type2>")>0 Then
			In_qingtiandh_type2 qingtiandy_url,ID2,oDataVer2	
		ElseIF 	Instr(str,"<qingtiandh_type3>")>0 Then
			In_qingtiandh_type3 qingtiandy_url,ID2,oDataVer2			
		End IF
	End IF
	conn.Execute("Update qingtiandh_drive Set DataVer1="&ID2&" Where Id=1")
	Response.Write "<script language=javascript>location.href='./DataIn.asp?id2="&Clng(Id2)+1&"&DataVer1="&oDataVer1&"&DataVer2="&oDataVer2&"';</script>"
Else
	Response.Write "<script language=javascript>location.href='../qingtiancms.com.main.asp';</script>"
End IF

'表qingtiandh_List
Function In_qingtiandh_list(qingtiandy_url,start1,start2)
	'str,开始ID，结束ID
	IF start1="1001" Then
		conn.Execute("Delete From qingtiandh_List")	
	ElseiF start1="1015" Then
		IF G_IS_SQL_User_DB="1" Then
			'Delete From qingtiandh_List where datediff(day,m_time,'2010-09-27 18:00:00')>=0
			conn.Execute("Delete From qingtiandh_List")
		Else
			conn.Execute("Delete From qingtiandh_List")
		End IF
	End IF
	
	Dim qingtiandy_url_a,ii
	Dim s1,s1_a,sid,sm_type1,sm_type2,sm_type3,sm_name,sm_color,sm_look,sm_url,sm_content,sm_time,sm_no
	Dim oRss
	qingtiandy_url_a=Split(qingtiandy_url,"####")
	For ii=0 To Ubound(qingtiandy_url_a)-1
		s1=qingtiandy_url_a(ii)
		s1_a=Split(s1,"|||")
		sid=s1_a(0)
		sm_type1=s1_a(1)
		sm_type2=s1_a(2)
		sm_type3=s1_a(3)
		sm_name=s1_a(4)
		sm_color=s1_a(5)
		sm_look=s1_a(6)
		sm_url=s1_a(7)
		sm_content=s1_a(8)
		sm_time=s1_a(9)
		sm_no=s1_a(10)
		
		Set oRss=Server.CreateObject(G_RS)
		oRss.open "Select * From qingtiandh_List Where m_name='"&sm_name&"' And m_type1="&sm_type1&" And m_type2="&sm_type2&"And m_type3="&sm_type3,conn,1,3
		IF oRss.Eof Then
			oRss.Addnew()
			oRss("m_type1")=sm_type1
			oRss("m_type2")=sm_type2
			oRss("m_type3")=sm_type3
			oRss("m_name")=sm_name
			oRss("m_color")=sm_color
			oRss("m_look")=sm_look
			oRss("m_url")=sm_url
			oRss("m_content")=sm_content
			oRss("m_time")="2011-05-01 00:00:00"
			oRss("m_no")=sm_no
			oRss.Update()
			Response.Write sm_name&"---"&sm_url&"---<font color=blue>导入成功</font><br>"
			Response.Flush()
		Else
			oRss("m_url")=sm_url
			oRss("m_no")=sm_no
			oRss("m_time")="2011-05-01 00:00:00"
			oRss.Update()
			Response.Write sm_name&"---"&sm_url&"---<font color=red>修改成功</font><br>"
			Response.Flush()			
		End IF
	Next
End Function

'表In_qingtiandh_type2
Function In_qingtiandh_type2(qingtiandy_url,start1,start2)
	'str,开始ID，结束ID	
	Dim qingtiandy_url_a,ii
	Dim s1,s1_a,sid,sm_type1,sm_type2,sm_type3,sm_name,sm_color,sm_look,sm_url,sm_content,sm_time,sm_no
	Dim oRss
	qingtiandy_url_a=Split(qingtiandy_url,"####")
	For ii=0 To Ubound(qingtiandy_url_a)-1
		s1=qingtiandy_url_a(ii)
		s1_a=Split(s1,"|||")
		stypeid=s1_a(0)
		stypeid1=s1_a(1)
		stypename=s1_a(2)
		stypename2=s1_a(3)
		stypeno=s1_a(4)
		IF Ubound(s1_a)=5 Then
			stypehide=s1_a(5)
			IF stypehide="" Then
				stypehide=1
			End IF
		Else
			stypehide=1
		End IF
		
		Set oRss=Server.CreateObject(G_RS)
		oRss.open "Select * From qingtiandh_type2 Where  typeid="&stypeid,conn,1,3
		IF oRss.Eof Then
			oRss.Addnew()
			oRss("typeid1")=stypeid1
			oRss("typename")=stypename
			oRss("typename2")=stypename2
			oRss("typeno")=stypeno
			oRss("typehide")=stypehide
			oRss.Update()
			Response.Write stypeid1&"---"&stypename&"---<font color=blue>导入成功</font><br>"
			Response.Flush()
		Else
			oRss("typeid1")=stypeid1
			oRss("typename")=stypename
			oRss("typename2")=stypename2
			oRss("typeno")=stypeno
			oRss("typehide")=stypehide
			oRss.Update()
			Response.Write stypeid1&"---"&stypename&"---<font color=red>修改成功</font><br>"
			Response.Flush()			
		End IF
	Next
End Function

'表In_qingtiandh_type3
Function In_qingtiandh_type3(qingtiandy_url,start1,start2)
	'str,开始ID，结束ID	
	Dim qingtiandy_url_a,ii
	Dim s1,s1_a,sid,sm_type1,sm_type2,sm_type3,sm_name,sm_color,sm_look,sm_url,sm_content,sm_time,sm_no
	Dim oRss
	qingtiandy_url_a=Split(qingtiandy_url,"####")
	For ii=0 To Ubound(qingtiandy_url_a)-1
		s1=qingtiandy_url_a(ii)
		s1_a=Split(s1,"|||")
		stypeid=s1_a(0)
		stypeid1=s1_a(1)
		stypename=s1_a(2)
		stypename2=s1_a(3)
		stypeno=s1_a(4)
		
		Set oRss=Server.CreateObject(G_RS)
		oRss.open "Select * From qingtiandh_type3 Where  typeid="&stypeid,conn,1,3
		IF oRss.Eof Then
			oRss.Addnew()
			oRss("typeid1")=stypeid1
			oRss("typename")=stypename
			oRss("typename2")=stypename2
			oRss("typeno")=stypeno
			oRss("typehide")=1
			oRss.Update()
			Response.Write stypeid1&"---"&stypename&"---<font color=blue>导入成功</font><br>"
			Response.Flush()
		Else
			oRss("typeid1")=stypeid1
			oRss("typename")=stypename
			oRss("typename2")=stypename2
			oRss("typeno")=stypeno
			oRss("typehide")=1
			oRss.Update()
			Response.Write stypeid1&"---"&stypename&"---<font color=red>修改成功</font><br>"
			Response.Flush()			
		End IF
	Next
End Function
%>
