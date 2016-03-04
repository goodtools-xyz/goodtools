<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"兑奖产品管理" '标题
	GG_Table				=	"qingtiandy_jifen_goodsman"
	
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	f=Trim(request.QueryString("f"))
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	ref=IIf(f<>"",f,ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From qingtiandy_jifen_goodsman Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="l_look" And sID<>"" Then
		fId=FormatNumSerial(sID)
		l_look=StayNub(request("m_look"))
		IF l_look<>"" Then
			Conn.execute("update  "&GG_Table&" Set m_look="&l_look&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	'以下是提款操作
	IF Action="uDel" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From qingtiandy_zhifubao Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="uflag" And sID<>"" Then
		fId=Bint(sID)
		l_look=StayNub(request("uflag"))
		IF l_look<>"" Then
			Conn.execute("update  qingtiandy_zhifubao Set uflag="&l_look&" where id In("&fId&")")
			IF G_xiaxian_2="1" Then
				Set oRs3=Conn.Execute("Select uid,soojs_u_alipay_numb From qingtiandy_zhifubao Where id="&fId)
				IF Not oRs3.Eof Then
					k_soojs_u_alipay_numb=oRs3("soojs_u_alipay_numb")
					Set oRs4=Conn.Execute("Select soojs_u_xiaxian,soojs_jifen_G_jifen_xiaxian_tikuan From soojs_un Where id="&oRs3(0)&"")
					IF Not oRs4.Eof Then
						k_soojs_u_xiaxian=Bint(oRs4("soojs_u_xiaxian"))
						Set oRs5=Conn.Execute("Select soojs_jifen_G_jifen_xiaxian_tikuan From soojs_un Where id="&k_soojs_u_xiaxian)
						IF Not oRs5.Eof Then
							k_soojs_jifen_G_jifen_xiaxian_tikuan=Bint(oRs5("soojs_jifen_G_jifen_xiaxian_tikuan"))
						Else
							k_soojs_jifen_G_jifen_xiaxian_tikuan=0
						End IF
						
						IF k_soojs_jifen_G_jifen_xiaxian_tikuan<>0 Then 
							x_G_xiaxian_2_jiangli=k_soojs_jifen_G_jifen_xiaxian_tikuan/100
						Else
							x_G_xiaxian_2_jiangli=G_xiaxian_2_jiangli
						End IF							
						jifen=Bint(k_soojs_u_alipay_numb*x_G_xiaxian_2_jiangli)
						
						
						IF jifen<>0 And k_soojs_u_xiaxian<>0 Then
							Get_qingtiandy_jifen_ip oRs4(0),15,jifen
						End IF
					End IF
				End IF
				oRs3.close
			End IF
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF		

%>
