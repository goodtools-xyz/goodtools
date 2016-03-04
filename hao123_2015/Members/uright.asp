		<style type="text/css">
		.explain-btn {
			border-bottom: 1px dotted black;
			font-size: 11px;
			font-weight:normal;
			cursor: pointer;
		}
		.explain-content {
			position: absolute;
			z-index: 100;
			padding: 5px;
			border: 1px solid #AAA;
			background-color: #FFFFDC;
			font-size: 13px;
			font-weight: normal;
			width: 220px;
			text-indent: 2em;
			top: 25px;
			display:none;
		}
		.explain-content .close-btn {
			float: right;
			color: blue;
			cursor: pointer;
			font-size: 12px;
		}
		
		.task-btn {
			border-bottom: 1px dotted black;
			font-size: 11px;
			font-weight:normal;
			cursor: pointer;
		}
		.task-content {
			position: absolute;
			z-index: 100;
			padding: 10px;
			border: 1px solid #AAA;
			background-color: #FFFFDC;
			font-size: 13px;
			font-weight: normal;
			width: 160px;
			left: 78px;
			top: 0px;
			display:none;
		}
		.task-content .close-btn {
			float: right;
			color: blue;
			cursor: pointer;
			font-size: 12px;
		}
				
		.li_new{ background:url(Uimg/new.gif) 50px no-repeat;}
		</style>
		<script type="text/javascript" src="Ujs/jquery.js"></script>
        <div class="rightbar">
			<div class="box-gray p10">	
				<%IF G_xxiaoxi_1="1" Then
					ppkstr=""
					IF zCount_xxiao_numb>0 Then 
						ppkstr="<a href=""./xx_list2.asp""><font color=red>"&zCount_xxiao_numb&"条未读消息</font></a>"
					Else
						IF Instr(zsoojs_u_xiaoxi_y,"{")>0 Then
							ppkstr="<a href=""./xx_list3.asp""><font color=red>您有未读消息</font></a>"
						Else
							ppkstr="<a href=""./xx_list2.asp"">收到的消息</a>"
						End IF
					End IF
					Response.Write Replace(qtcmsdh.qTcmsConstStr("31","",G_xxiaoxi_1),"{#1}",ppkstr)
				End IF%>	
				<h4 class="font-14">收藏分类</h4>
				<ul class="p10">
                <li><a href="./c_t_add.asp">添加新分类</a></li>
				<li><a href="./c_t_list.asp">我的分类列表</a></li>
                </ul>
				<h4 class="font-14">收藏列表</h4>
				<ul class="p10">
                <li><a href="./c_l_add.asp">添加新收藏</a></li>
				<li><a href="./c_l_list.asp">我的收藏列表</a></li>
                </ul>
				<h4 class="font-14">我的<%=G_jifen_jifen_name%></h4>
				<ul class="p10">
				<%IF Request.Cookies(Sky_Admin_Cookies_1)("admin_u")<>"" Then%>
                <li><a href="./j_list.asp"><%=G_jifen_jifen_name%>明细</a></li>
				<%End IF%>
				<li><a href="./j_getcode.asp">获取<%=G_jifen_jifen_name%>推广代码</a></li>
				<li><a href="./j_glist.asp"><%=G_jifen_jifen_name%>兑换奖品</a></li>
				<li><a href="./j_glist_list.asp"><%=G_jifen_jifen_name%>兑换奖品明细</a></li>
                </ul>	

				
				
			
				<h4 class="font-14">支付宝提款</h4>
				<ul class="p10">	
				<li class="li_new"><a href="./j_tikuan.asp"><font color="#FF0000">我要提款</font></a></li>
				<li><a href="./j_list_1.asp">提款明细</a></li>
				<li><a href="./ueditalipay.asp">支付宝修改</a></li>
				</ul>	


				<hr />				
                <h4 class="font-14" style="position:relative;">站长功能 &nbsp; <span class="explain-btn" onclick="$(this).next().slideToggle()">什么是站长功能？</span><div class="explain-content">站长功能需要站长通过身份认证和域名认证方可开通，通过认证的站长可以为自己的域名申请开通 我们 为站长用户提供的网站功能拓展服务（如：流量反馈功能），给自己的网站带来更多的流量。<br/><span class="close-btn" onclick="$(this).parent().slideUp();">关闭</span></div></h4>
                <ul class="p10">
					<%IF zsoojs_u_Webf="0" Then%>
					<li><a href="./webAdd.asp">开通站长功能</a></li>	
					<%Else%>
                    <li><a href="./w_add.asp">添加网站</a></li>
                    <li><a href="./w_list.asp">我的网站</a></li>
					<li><a href="./w_getcode.asp">获取推广代码</a></li>
                    <li><a href="./webadd.asp">修改站长资料</a></li>					
					<%End IF%>
                </ul>
			</div>
		</div>