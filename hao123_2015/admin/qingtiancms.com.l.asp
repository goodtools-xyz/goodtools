<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->

<HTML><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=G_WEBNAME%>--后台管理</title>
<LINK href="css/style1.css" rel=stylesheet type=text/css>
<META content="MSHTML 6.00.3790.218" name=GENERATOR></HEAD>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY>	
        <TR>
          <TD vAlign=bottom height=42><IMG height=38 src="images/left_image/title.gif" width=158> </TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title onMouseOver="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/title_bg_quit.gif height=25><SPAN><A 
            href="index.asp" 
            target=_parent><B>后台管理首页</B></A> | <A 
            href="qingtiancms.com.ex.asp" 
            target=_top><B>注销</B></A></SPAN> </TD>
        </TR></TBODY></TABLE>


	<%=N_Fso.ReadAllTextFile("../admincms.Come/admin/left.html")%>

	<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(1002) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>常规管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu1002>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiancms.com.setting.asp" 
                  target=main>网站基本参数(可视模式)</A></TD>
              </TR>		
	  			  
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="tool/index.asp" 
                  target=main><font color="#FF0000">新功能列表</font></A></TD>
              </TR>		
			  <%IF G_soojs_yz_str="1" Then%>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_email/index.asp" 
                  target=main>邮件基本参数设置</A></TD>
              </TR>		
			  <%End IF%>			  	  				  		  			  		  
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>	


      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 onMouseOver="this.className='menu_title2';" onclick=showsubmenu(68379) onMouseOut="this.className='menu_title';" background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>19模板功能管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu68379>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR><TD height=5></TD></TR>
              <TR>
                <TD height=20><IMG height=20 alt="" src="images/left_image/bullet.gif" width=15 border=0><A href="qTcms_Com_19/setting.asp" target=main>基本设置</A></TD>
              </TR>	
              <TR>
                <TD height=20><IMG height=20 alt="" src="images/left_image/bullet.gif" width=15 border=0><A href="qTcms_Com_19/ad.asp" target=main>模块分布图</A></TD>
              </TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" src="images/left_image/bullet.gif" width=15 border=0><A href="qingtiandy_gonggao/index.asp" target=main>公告列表管理</A> <A href="qingtiandy_gonggao/edit.asp" target=main>添加</A></TD>
              </TR>			  		  			  
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE>
			</DIV>
		  </TD>
		</TR>
		</TBODY>
    </TABLE>
	<%=qtcmsdh.qTcmsConstStr("1001","",1)%>
  	<%=qtcmsdh.qTcmsConstStr("1001","",2)%>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(379) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>全部网址管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu379>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandh_type1/type.asp" 
                  target=main>网址类别管理 </A><a href="qingtiandh_type1/class_ok.asp?action=add_class_1" target="main">添加</a></TD>
              </TR>					
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandh_List/index.asp" 
                  target=main>网址列表管理 </A><a href="qingtiandh_List/edit.asp" target="main">添加</a></TD>
              </TR>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandh_List/UrlJianche.asp" 
                  target=main>网址有效性检测 </A></TD>
              </TR>				  
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandh_List/pIn.asp" 
                  target=main>HTML网址批量入库 </A></TD>
              </TR>			  
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_shouluurl/index.asp" 
                  target=main>收录申请管理</A></TD>
              </TR>				  		  			  	  
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>

      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(303079) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>酷站网址管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu303079>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
				
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandh_ltype1/type.asp" 
                  target=main>网址类别管理 </A><a href="qingtiandh_ltype1/class_ok.asp?action=add_class_1" target="main">添加</a></TD>
              </TR>					
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandh_List2/index.asp" 
                  target=main>酷站网址管理 </A><a href="qingtiandh_List2/edit.asp" target="main">添加</a></TD>
              </TR>			  		  			  	  
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>





<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(57169) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>用户中心管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu57169>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_usersnew/index.asp" 
                  target=main>全部用户列表</A> <a href="qingtiandy_usersnew/edit.asp" target="main">添加</a></TD>
              </TR>	
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_usersshoucang/index.asp" 
                  target=main>全部收藏列表</A></TD>
              </TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_usersnew/zhifubao.asp" 
                  target=main>支付宝黑名单</A> <a href="qingtiandy_usersnew/zhifubaoedit.asp" target="main">添加</a></TD>
              </TR>		

			  <%IF G_jifen_pb="1" Then%>		  		  					  		  		  			  	          			  			  		      <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_paihang/index.asp" 
                  target=main>生成排行榜</A></TD>
              </TR>	  
			  <%End IF%>			  
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(500169) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>流量点入点出</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu500169>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_usersweb/index.asp" 
                  target=main>用户统计管理</A></TD>
              </TR>				  		  					  		  		  			  	          			  			  		               <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_usersjilu/index.asp" 
                  target=main>点入点出记录</A></TD>
              </TR>	 
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(540169) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>奖品列表</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu540169>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>	
				
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_jifen_product/index.asp" 
                  target=main>所有奖品列表</A> <A 
                  href="qingtiandy_jifen_product/edit.asp" 
                  target=main>添加</A></TD>
              </TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_jifen_product/uindex.asp" 
                  target=main>所有兑奖用户</A></TD>
              </TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_jifen_product/uindexzhifu.asp" 
                  target=main>所有提款记录</A></TD>
              </TR>				  		  			
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(55169) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><div style="display:none"><SCRIPT type="text/javascript" language="javascript" src="js/po_js.js"></SCRIPT></div><SPAN>网址报错/建议</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu55169>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_error/index.asp?g_type=1" 
                  target=main>网址异常举报</A></TD>
              </TR>					
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiandy_error/index.asp?g_type=3" 
                  target=main>给我们的建议</A></TD>
              </TR>				  		  		  			  	          			  			  		  
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(31288) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>模版管理</SPAN></TD>
        </TR>
        <TR>
          <TD id=submenu31288>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="moban/index.asp?t1=<%=GetTemplateUrlIndex()%>&t3=网站首页" 
                  target=main>首页模版管理</A></TD>
              </TR>		
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="moban/index.asp?t1=<%="/template/"&G_moban&"/"&G_moban_html&"/list.html"%>&t3=分类" 
                  target=main>分类模版管理</A></TD>
              </TR>					  		  
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="moban/index2.asp" 
                  target=main>其他文件快速编辑</A></TD>
              </TR>				  			  			  		    
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(1508) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>静态页面管理</SPAN> </TD>
        </TR>
        <TR>
          <TD id=submenu1508 >
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="makehtml/index.asp" 
                  target=main>静态页面生成</A></TD>
              </TR>	
              <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="makehtml/index2.asp" 
                  target=main>单个页面生成</A> <a href="moban/index.asp?t1=<%=Get_movie_type_12("/template/"&G_moban&"/js/jingtaiguize.txt")%>&t3=编辑<%=G_moban%>规则"  target="main">编辑规则</a></TD>
              </TR>				  			  	
			  	  	  
              <TBODY></TBODY></TABLE></DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>




<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(19) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>系统管理</SPAN>          </TD>
        </TR>
        <TR>
          <TD id=submenu19>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
							  			  				  <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="system/list.asp" 
                  target=main>管理员管理</A> | <A href="system/add.asp" target=main>添加</A></TD>
              </TR>	
				  <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="log/dispcont.asp" 
                  target=main>系统日志管理</A></TD>
              </TR>
				  <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="log/dat.asp" 
                  target=main>数据库管理</A></TD>
              </TR>
              <TR>
                <TD height=20></TD>
              </TR>
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(090304) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>辅助工具</SPAN>          </TD>
        </TR>
        <TR>
          <TD id=submenu090304>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=5></TD></TR>
				<TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="qingtiancms.com.1.asp" 
                  target=main>清理内存溢出问题 </A></TD>
              </TR>			  
              <TR>
                <TD height=20></TD>
              </TR>
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>

	  
<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(1189) 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25 style="CURSOR: hand"><SPAN>工具箱</SPAN>          </TD>
        </TR>
        <TR>
          <TD id=submenu1189>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=150 align=center>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
			  <TR>
                <TD height=20><IMG height=20 alt="" 
                  src="images/left_image/bullet.gif" width=15 border=0><A 
                  href="tool/tool_js_html.html" 
                  target=main>html和js互相转化</A></TD>
              </TR>		  
              <TR>
                <TD height=20></TD>
              </TR>
              <TBODY></TBODY></TABLE>
            </DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD 
      height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>	  
	  
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" 
          background=images/left_image/admin_left_9.gif height=25><SPAN>网站版权信息</SPAN>          </TD>
        </TR>
        <TR>
          <TD>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=145 align=center>
              <TBODY>
			  <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=20>
               &nbsp;&nbsp;<a href=http://www.go590.com target="_blank">官方博客</a> 
                  </TD></TR></TBODY></TABLE><DIV style="PADDING-TOP: 10px"></DIV></DIV></TD></TR></TBODY></TABLE> 
  </TR></TBODY></TABLE></BODY></HTML>
