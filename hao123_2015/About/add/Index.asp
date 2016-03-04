<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../../p_inc/openconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>新站收录 - <%=G_WEBNAME%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../css/qingtian_base.css" type=text/css rel=stylesheet>
<LINK href="../css/qingtian_style.css" type=text/css rel=stylesheet>
<style>
<!--


.record
{
	width:670px;
	border:solid #ACE;
	border-width:1px 1px 0 0;
	overflow: hidden;
	float: left;
}
.record th
{
	width:120px;
	line-height:18px;
	padding:3px 8px;
	background:#FFFFFF;
	border:solid #ACE;
	border-width:0 0 1px 1px;
	font-weight:normal;
	text-align:left;
}
.record td
{
  line-height:18px;
  padding:3px 8px;
  border:solid #ACE;
  border-width:0 0 1px 1px;
}
td.bot
{
  text-align:center;
  background:#EDF6FF;
}
td.bot1
{
  background:#EDF6FF;
}
.record em
{
  margin-left:8px;
  font-style:normal;
  color:#E00;
}
.record .txt
{
  border:1px solid #ACE;
  font:12px Verdana;
  color:#07519A;
  width:180px;
  padding:2px 3px;
}
.record textarea
{
	border:1px solid #ACE;
	width:300px;
	height:60px;
	font:12px/18px Verdana;
	color:#07519A;
}
.record .btn
{
	border:1px solid #ACE;
	font:12px Verdana;
	height:22px;
	line-height:19px;
	background:#DAECFE;
	color:#07519A;
	padding-right: 5px;
	padding-left: 5px;
	margin-top: 5px;
	margin-bottom: 5px;
}

-->
</style>
</HEAD>
<BODY>
<script type="text/javascript" src="1/common.js"></script>
<DIV id=header>
	<DIV id=logo></DIV>
	<UL id=menu>
	  <LI><A href="../../">返回首页</A> </LI>
	  <LI class=on><A href="../add">新站收录</A> </LI>
	  <LI><A href="../sk">挑错有礼</A> </LI>
	  <LI><A href="../about">关于我们</A> </LI>
	  <LI><A href="../map">网站地图</A> </LI>
	  <LI><A href="../links">友情链接</A> </LI>
	</UL>
</DIV>
<DIV id=box>
	<DIV id=left><IMG src="../images/img_about.jpg"> </DIV><!--left end-->
	<DIV id=right>
		<DIV class=content>
		<DIV class=title_h1><SPAN>01</SPAN> <STRONG><%=G_WEBURL_2%></STRONG>&nbsp;网站收录提交</DIV>
		  1. 不收录有反动、色情、赌博等不良内容或提供不良内容链接的网站，以及网站名称或内容违反国家有关政策法规的网站；<br>
		  2. 不收录含有病毒、木马，弹出插件或恶意更改他人电脑设置的网站、及有多个弹窗广告的网站；<br>
		  3. 不收录网站名称和实际内容不符的网站，如贵站正在建设中，或尚未明确主题的网站，请不必现在申请收录，欢迎您在贵站建设完毕后再申请； <br>
		  4. 不收入非顶级域名、挂靠其他站点、无实际内容，只提供域名指向的网站或仅有单页内容的网站； 
		  <br>
		  5. 公益性网站，或内容确实有独特之处的网站将优先收录 <br>
		  6. 本站保留收录决定权以及贵站在本站网址数据库中相关内容的编辑决定权 <br>
		<strong>特别强调：<br>1、本站仅收录PR值大于等于3，Alexa排名100W以内，BAIDU、GOOGLE均有收录，健康有内容并每日更新，且具有真实的信息产业部ICP/IP备案信息的各类网站。<br>
		2、申请收录的网站请先在贵站的首页做好“<%=G_WEBNAME%>”的友情链接将会优先考虑收录。</strong> <br> <br>
		    <form action="../../members/shoulusave.asp" method="post" name='formAdd' onSubmit="return checkFormaddurl(this);">
			<input name="mmore" type="hidden" value="1" />
			<input name="m_turnurl" type="hidden" value="<%=Add_Root_Dir("/")%>" />		
			<table border="0" cellpadding="0" cellspacing="0" class="record">
					<td colspan="2" class="bot1">申请收录<em>所有选项均为必填项</em></td>
			  <tr>
				<th>网站名称：</th>
				<td>
				  <input name="m_name" type="text" class="txt" id="m_name" value="" maxlength="40"  /> <font color="#FF0000">*</font>
				</td>
			  </tr>
			  <tr>
				<th>网站网址：</th>
				<td>
				  <input name="m_url" type="text" class="txt" id="m_url" value="http://" maxlength="255"/> <font color="#FF0000">*</font>
				</td>
			  </tr>
			  <tr>
				<th>网站简介：</th>
				<td>
				  <textarea name="m_content" cols="" rows="5" id="m_content"></textarea>
          请将您的描述控制在200字以内</td>
			  </tr>
			  <tr>
				<th>网站访问量：</th>
				<td>
				  <input name="ips" type="text" class="txt" id="ips" value="" maxlength="10"/>
          日独立IP</td>
			  </tr>
			  <tr>
				<th>网站分类：</th>
				<td>
					<Select name="m_type1" onChange="Get_type1(this.value,'div_m_type2')" id="m_type1">
						<Option value="0">一级类别</Option>
					<%
						Set oRs_t=Server.CreateObject(G_RS)
						oRs_t.open "Select * from qingtiandh_type1 order by typehide asc,typeno asc,typeid asc",conn,1,1
						Do While Not oRs_t.Eof 
							kTypeid=oRs_t("typeid")
							kTypename=oRs_t("typename")
							IF Cstr(am_type1)=Cstr(kTypeid) Then
								kS1=" Selected"
							Else
								kS1=""
							End IF
							
					%>
							<Option value="<%=kTypeid%>"<%=kS1%>><%=kTypename%></Option>
					<%		
							oRs_t.MoveNext
						Loop
						oRs_t.close:Set oRs_t=Nothing
					%>
					</Select>				
		
				<span id="div_m_type2">			 
					<Select name="m_type2" id="m_type2" onChange="Get_type2(this.value,'div_m_type3')">
						<Option value="0">二级类别</Option>
					</Select>	
				</span>				
		
				<span id="div_m_type3">			 
				<Select name="m_type3" id="m_type3">
					<Option value="0">三级类别</Option>					
				</Select>	
				</span>			
					
				<font color="#FF0000">*</font>
				  
				  </td>
			  </tr>
			  <tr>
				<th>建站时间：</th>
				<td>
				  <input name="m_jtime" type="text" class="txt" id="m_jtime" value="" maxlength="20" />
				</td>
			  </tr>
			  <tr>
				<th>联 系 人：</th>
				<td>
				  <input name="m_contactname" type="text" class="txt" id="m_contactname" value="" maxlength="20"/>
				</td>
			  </tr>
			  <tr>
				<th>联系电话：</th>
				<td>
				  <input name="m_tel" type="text" class="txt" id="m_tel" value="" maxlength="50"/>
				</td>
			  </tr>
			  <tr>
				<th>联系ＱＱ：</th>
				<td>
				  <input name="m_qq" type="text" class="txt" id="m_qq" value="" maxlength="11"/>
				</td>
			  </tr>
			  <tr>
				<th>友情链接：</th>
				<td>
				  <input name="m_youqing" type="radio" value="1" />
				  是
				  <input name="m_youqing" type="radio" value="0" checked="checked" />
				  否<em>可选,如已做链接将优先收录</em></td>
			  </tr>
			  <tr>
				<th>验证码：</th>
				<td>
				  <input name="authCode" type="text" class="txt" id="authCode" value="" maxlength="10"/>
				  <IMG id=verifypic src="1/code.asp" border=0 >
				  <a href="javascript:newverifypic();" title="看不清左边的字符">看不清？</a>
				  </td>
			  </tr>
			  <tr>
				<td colspan="2" class="bot">
				  <input type="submit" value="提交申请" class="btn" />
				  &nbsp;
				  <input type="button" value="返回网站首页" class="btn" onclick="window.location='../../'" />
				</td>
			  </tr>
			</table>
		  </form>
			<DIV class=clear></DIV></DIV>
	</DIV>
</DIV>
<DIV id=bottom >
	<P><%=G_WEBNAME%> 版权所有 Copyright&copy; 2012-2015 <%=G_BEIAN%> </P>
</DIV>

</BODY></HTML>
