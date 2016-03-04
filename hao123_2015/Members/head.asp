	
	<script type="text/javascript" src="../p_inc/public.js"></script>
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> 用户中心</a></h1>
		<p class="gray text-right pv10">
			<%IF zCount_xxiao_numb>0 Then%>
			<a href="./xx_list2.asp"><img src="Uimg/xiaoxi/notice_newpm.gif" border="0" /></a>
			<%Else%>
				<%IF Instr(zsoojs_u_xiaoxi_y,"{")>0 Then%>
					<a href="./xx_list3.asp"><img src="Uimg/xiaoxi/notice_newpm.gif" border="0" /></a>
				<%End IF%>
			<%End IF%>		
			<%IF Instr(zsoojs_u_email,"qq.com")=0 Then%>
			<span class="blue"><strong><%=zsoojs_u_email%></strong></span> | 
			<%End IF%>
			<a href="../">网站首页</a> | 
			<a href="./">我的帐户</a>  |  
			<a href="regok.asp?action=out">退出</a>
		</p>
		<div class="guide">				
			<span class="head_left_1">
			<%=zsoojs_u%>的账号<font color="#FF0000">(我的积分<%=zsoojs_jifen%>) </font>
			</span>
			<%IF G_jinbi_kaifang="1" Then%>
			<%IF Request.Cookies("soojsjj")<>"1" Then%>
			<span class="head_left_2" id="head_left_2"><a href="./regok.asp?action=ifipin"><font style='color:blue;cursor:pointer'>绑定本机<%=G_jifen_jifen_name%></font></a></span>
			<%Else%>
			<span class="head_left_2" id="head_left_2"><font color=#009a00><%=G_jifen_jifen_name%>已绑定本机</font></a></span>
			<%End IF%>
			<%End IF%>
		</div>
	</div>
	<script language="javascript">
	<!--	
//	//绑定本机<%=G_jifen_jifen_name%>
//	var pif="a";
//	var soojs_jj=qTcms.Cookie.get("soojsjj");
//	if(soojs_jj==null) 
//		soojs_jj=0;
//	else
//		if(soojs_jj=="")
//			soojs_jj=0
//	//soojs_jj 0:未认证 1：已认证
//	
//	qTcms.Ajax("Ujs/check.asp?tag=ifip&m="+new Date().getTime(),function(d){
//		var c=d.responseText;
//			
//		if(c=="0"){
//			qTcms.Dom.get("head_left_2").innerHTML="<span onclick='cipin()' style='color:blue;cursor:pointer'>绑定本机<%=G_jifen_jifen_name%></span>"
//		}else{
//			qTcms.Dom.get("head_left_2").innerHTML="<font color=#009a00><%=G_jifen_jifen_name%>已绑定本机.</font>"
//		}
//	})
//	
//	function cipin(){
//		qTcms.Ajax("Ujs/check.asp?tag=ifipin&m="+new Date().getTime(),function(d){
//			var c=d.responseText;	
//			if(c=="1"){
//				alert("绑定成功!将<%=G_WEBURL_2%>设为主页,此电脑每次打开IE访问,您的<%=G_jifen_jifen_name%>立即增加")
//				qTcms.Dom.get("head_left_2").innerHTML="<font color=#009a00><%=G_jifen_jifen_name%>已绑定本机</font>"
//			}
//		})			
//	}
	-->
	</script>	
	
