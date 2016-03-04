<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/classDbPager.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->
<html>
<head>
<meta http-euiv="Content-Type" content="text/html; charset=gb2312">
<title>网站信息设置</title>
<LINK href="css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.bg66{ color:#666666}

-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body>
<%

If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" then

	response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
	response.End()
End IF



response.Cookies("ingtiandy.cn")=""
If request("action")="" Then
	Function Basic_1()
		IF G_IS_SL_User_DB="1" Then
			Basic_1="(<font color=""#FF0000"">必改</font>)"
		Else
			Basic_1=""
		End IF
	End Function
	
	Function Basic_2()
		IF G_IS_SL_User_DB="1" Then
			Basic_2="style=""color:#FF0000"""
		Else
			Basic_2=""
		End IF
	End Function
	
	Function ReadAllTextFile(filespec)
		Dim fso, f
		Set fso = CreateObject(G_FSO)
		Set f = fso.OpenTextFile(server.MapPath(filespec), 1)	
		if Not f.AtEndOfStream then
			ReadAllTextFile = f.ReadAll
		else
			ReadAllTextFile = ""
		end if
		Set f=nothing
		Set fso=nothing
	End Function
	
	Function Ghelp(v)
		Ghelp="<a href='"&v&"' target=_blank><img src='images/help.gif' border=0 alt='查看帮助'></a>"
	End Function
	Function re(v)
		re=""""&request.Form(v)&""""
	End Function
%>
<script src="js/basicjs.js"></script>
<script language="javascript" runat="server">
function unescapeGet(str)
{
 return decodeURI(str);
}
//解码
function decodeURIs(strs)
{
 return String.fromCharCode(strs);
}


</script>
<%

function ssu(v)
   'ssu=v
   '大军修改 取消掉原先的编码
	ssu=server.URLEncode(v)
End FUnction

set file1=server.CreateObject(G_FSO)
set folder1=file1.GetFolder(""&server.mappath("../template")&"")
c15=""
for each thing in folder1.SubFolders
	dbname_2=thing.name
	IF G_moban=dbname_2 Then
		dbname_2_1=" selected"
	Else
		dbname_2_1=""
	End IF
	c15=c15&"<option value="""&dbname_2&""" "&dbname_2_1&">"&dbname_2&"</option>"
next




ingtiancms="aa1="&G_All_moshi&"&aa2="&ssu(hxCacheName)&"&aa3="&ssu(maxReBack)&"&aa4="&ssu(hxtime)&_
"&aa5="&ssu(hxLook)&_
"&aa6="&ssu(G_All_InAuto)&_
"&aa7="&ssu(G_all_InNumb)&_
"&aa8="&ssu(G_All_dhList_f)&_
"&aa9="&ssu(G_jifen_lailu)&_
"&aa10="&ssu(G_jifen_dianchu_a)&_
"&aa11="&ssu(G_jifen_lailu_out)&_
"&aa12="&ssu(G_jifen_timer_lailu)&_
"&aa13="&ssu(G_jifen_jifen_bili_lailu)&_
"&aa14="&ssu(G_jifen_jifen_numbs_lailu)&_
"&b1="&ssu(G_WEBTITLE)&_
"&b2="&ssu(G_WEBNAME)&_
"&b3="&ssu(G_WEBURL)&_
"&b4="&ssu(G_WEBURL_2)&_
"&b5="&ssu(G_QQ)&_
"&b6="&ssu(G_TEL)&_
"&b7="&ssu(G_EMAIL)&_
"&b8="&ssu(G_BEIAN)&_
"&b11="&ssu(G_union_my)&_
"&c1="&ssu(G_lm_baidu)&_
"&c2="&ssu(G_lm_baidu_ch)&_
"&c3="&ssu(G_lm_taobao)&_
"&c4="&ssu(G_lm_xunlei)&_
"&c5="&ssu(G_lm_google_s)&_
"&c6="&ssu(G_lm_sogou_s)&_
"&c7="&ssu(G_lm_dangdang_s)&_
"&c8="&ssu(G_lm_amazon_s)&_
"&c9="&ssu(G_lm_360buy)&_
"&c10="&ssu(G_lm_youdao)&_
"&c11="&ssu(G_lm_soso)&_
"&c12="&ssu(G_lm_500wan_s)&_
"&c13="&ssu(G_lm_gouwuke_s)&_
"&c14="&ssu(G_lm_sina_weibo)&_
"&c15="&ssu(c15)&_
"&c16="&ssu(G_JIN_TAI_IndexPage)&_
"&c17="&ssu(G_moban_html)&_
"&c18="&ssu(G_jingtai_wenjian_mulu)&_	
"&c19="&ssu(G_List_yemian)&_	
"&c20="&ssu(G_JIN_TAI_PageOne)&_	
"&c21="&ssu(G_HTML)&_	
"&c22="&ssu(G_FLAG)&_	
"&c23="&ssu(G_yzm)&_
"&c24="&ssu(G_ADMIN)&_
"&d1="&ssu(G_user_mem)&_
"&d2="&ssu(G_zhuce_j2)&_
"&d3="&ssu(G_jifen_denglu)&_
"&d4="&ssu(G_jifen_tuijian)&_
"&d5="&ssu(G_jifen_home)&_
"&d6="&ssu(G_jifen_home_time)&_
"&d7="&ssu(G_jifen_tuiguang_s)&_
"&d8="&ssu(G_jifen_s_f_1)&_
"&d9="&ssu(G_jifen_tuiguang_time)&_
"&d10="&ssu(G_jifen_timer)&_
"&d11="&ssu(G_jifen_jifen_bili)&_
"&d12="&ssu(G_jifen_jifen_name)&_
"&d13="&ssu(G_jifen_jifen_zhifubao_bili)&_
"&d14="&ssu(G_tikuan_smail)&_
"&d15="&ssu(G_xiaxian_zhuye_1a)&_
"&d16="&ssu(G_xiaxian_zhuye_2a)&_
"&d17="&ssu(G_xiaxian_zhuye_1_bili)&_
"&d18="&ssu(G_xiaxian_2_jiangli)&_
"&d19="&ssu(G_mingxi_look)&_
"&d20="&ssu(G_jinbi_kaifang)&_
"&e1="&ssu(G_u_Cookies)&_
"&e2="&ssu(G_email_f_1)&_
"&e3="&ssu(G_soojs_yz_str)&_
"&f1="&ssu(G_VIRTUAL_ROOT_DIR)&_
"&f2="&ssu(G_CONN_STR)&_
"&f3="&ssu(G_IS_SL_User_DB)&_
"&f4="&ssu(G_SL_IP)&_
"&f5="&ssu(G_SL_DATA)&_
"&f6="&ssu(G_SL_USER)&_
"&f7="&ssu(G_SL_PASS)&_
"&f8="&ssu(G_moshi)

ingtiandy=G_G_H&"tuser/2012yz_daohang_19.asp?tag=ingtiancms.com.setting.asp"&request.Cookies("t_url")&"&"&ingtiancms
'response.write ingtiandy
%>
<!-- 加入form 大军-->
<form action="?action=save" method="post" name="form">

<input name="G_u_Cookies" value="ingtiancmscom" size="45" type="hidden">
<input name="G_VIRTUAL_ROOT_DIR" value="" size="45" type="hidden">
<input name="G_CONN_STR" value="p_Data/##28887CHC7GH1FDB3H88C5A0JCBII86BA.mdb" size="45" type="hidden">
<input name="G_IS_SL_User_DB" value="0" size="45" type="hidden">
<input name="G_SL_IP" value="(local)" size="45" type="hidden">
<input name="G_SL_DATA" value="TcmsDaohang201413" size="45" type="hidden">
<input name="G_SL_USER" value="sa" size="45" type="hidden">
<input name="G_SL_PASS" value="" size="45" type="hidden">
<input name="G_moshi" value="1" size="45" type="hidden">	
<table class="tableBorder" cellpadding="3" cellspacing="1" align="center" border="0" width="98%">		<tbody>			<tr>				<th class="tableHeaderText" height="25" width="38%">网站整体定位模式</th>				<th class="tableHeaderText" height="25" width="62%"></th>			</tr>			<tr>				<td colspan="2" id="b_id_0">					<table cellpadding="0" cellspacing="0" border="0" width="100%">						<tbody><tr>							<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站整体定位</u></strong><br>								系统自带双用功能，纯导航模式和导航+流量交互模式</td>							<td class="forumRowHighlight" width="62%">								<input <%If (CStr(G_All_moshi) = CStr("")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="G_All_moshi" value="" onClick="$('G_All_moshi_table').style.display='none'" type="radio">
纯导航模式								<input <%If (CStr(G_All_moshi) = CStr("1")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="G_All_moshi" value="1"  onclick="$('G_All_moshi_table').style.display=''" type="radio">
流量交互+导航模式							</td>						</tr>					</tbody></table>					<table id="G_All_moshi_table" cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>用户Cookies名</u></strong><br>							只能是英文数字，不能为空，比如：tCacheName</td>						<td class="forumRowHighlight" width="62%">							<input name="hxCacheName" value="<%=hxCacheName%>" size="45">						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>流量返还比例</u></strong><br>比如1.1等</td>
<td class="forumRowHighlight" width="62%"><input name="maxReBack" value="<%=unescapeGet(ssu(maxReBack))%>" size="45"></td>
</tr>
<tr><td class="forumRowHighlight" height="23" width="38%"><strong><u>前台首页自动更新时间</u></strong><br>单位是秒，请不要设置的太小，比如300，即5分钟为合适</td>						<td class="forumRowHighlight" width="62%"><input name="hxtime" value="<%=unescapeGet(ssu(hxtime))%>" size="45">		</td>				</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>前台用户注册是否需要后台审核</u></strong><br>默认是不需要审核</td>						<td class="forumRowHighlight" width="62%">							<select name="hxLook"><option value="1"  <%If (Not isNull(unescapeGet(ssu(hxLook)))) Then If ("1" = CStr(unescapeGet(ssu(hxLook)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>不需要审核</option>
      <option value="0" <%If (Not isNull(unescapeGet(ssu(hxLook)))) Then If ("0" = CStr(unescapeGet(ssu(hxLook)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>需要审核</option>							
      </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>用户点入是否自动收录</u></strong><br>默认是需要审核</td>							<td class="forumRowHighlight" width="62%">								<select name="G_All_InAuto">
        <option value="1"  <%If (Not isNull(unescapeGet(ssu(G_All_InAuto)))) Then If ("1" = CStr(unescapeGet(ssu(G_All_InAuto)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>自动收录</option>
        <option value="0" <%If (Not isNull(unescapeGet(ssu(G_All_InAuto)))) Then If ("0" = CStr(unescapeGet(ssu(G_All_InAuto)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>不自动收录</option>								
        </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>用户点入超过几个自动审核</u></strong><br>如果不想自动审核，请把他设置为10000，最大10000</td>						<td class="forumRowHighlight" width="62%">							<input name="G_all_InNumb" value="<%=unescapeGet(ssu(G_all_InNumb))%>" size="45"> 最大10000						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>核心网址库是否导入流量网址库</u></strong><br>建议不要导入，没什么必要</td>						<td class="forumRowHighlight" width="62%">							<select name="G_All_dhList_f">
          <option value="1" <%If (Not isNull(unescapeGet(ssu(G_All_dhList_f)))) Then If ("1" = CStr(unescapeGet(ssu(G_All_dhList_f)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>自动导入</option>
          <option value=""  <%If (Not isNull(unescapeGet(ssu(G_All_dhList_f)))) Then If ("" = CStr(unescapeGet(ssu(G_All_dhList_f)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>不导入</option>							
          </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分操作--用户点入一次增加多少</u></strong><br>默认是空，为不增加</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_lailu" value="<%=unescapeGet(ssu(G_jifen_lailu))%>" size="45"> 建议为2，点入一次增加2个积分						</td>					</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25" width="38%">网站基本信息设置</th>				<th class="tableHeaderText" height="25" width="62%"></th>			</tr>			<tr>				<td colspan="2" id="b_id_2">					<table cellpadding="0" cellspacing="0" border="0" width="100%">						<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站首页标题(<font color="#FF0000">必改</font>)</u></strong><br>如果不填写将调用 网站名称</td>						<td class="forumRowHighlight" width="62%"><input name="G_WEBTITLE" value="<%=G_WEBTITLE%>" size="45" style="color:#FF0000"> 例如：晴天网址导航站</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站名称(<font color="#FF0000">必改</font>)</u></strong><br>网站名称</td>						<td class="forumRowHighlight" width="62%"><input name="G_WEBNAME" value="<%=G_WEBNAME%>" size="45" style="color:#FF0000"> 例如：晴天导航</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站完整URL(<font color="#FF0000">必改</font>)</u></strong><br>						网站完整URL，请一定要在最后面加/,否则静态页面无法生成</td>						<td class="forumRowHighlight" width="62%"><input name="G_WEBURL" value="<%=G_WEBURL%>" size="45" style="color:#FF0000">	例如：http://www.baidu.com/</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站的省略域名(<font color="#FF0000">必改</font>)</u></strong><br>网站的省略域名</td>						<td class="forumRowHighlight" width="62%">						<input name="G_WEBURL_2" value="<%=G_WEBURL_2%>" size="45" style="color:#FF0000"> 例如：ingtiancms.com</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站的客服(<font color="#FF0000">必改</font>)</u></strong><br>网站的客服</td>						<td class="forumRowHighlight" width="62%"><input name="G_QQ" value="<%=G_QQ%>" size="45" style="color:#FF0000">	比如：314048526</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站email(<font color="#FF0000">必改</font>)</u></strong><br>网站email</td>						<td class="forumRowHighlight" width="62%">						<input name="G_EMAIL" value="<%=G_EMAIL%>" size="45" style="color:#FF0000">	例如：314048526@.com</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站备案信息(<font color="#FF0000">必改</font>)</u></strong><br>网站备案信息,没有请填写"正在备案中"</td>						<td class="forumRowHighlight" width="62%"><input name="G_BEIAN" value="<%=G_BEIAN%>" size="45" style="color:#FF0000"> 未备案请填写：未备案</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站的客服电话</u></strong><br>网站的客服电话</td>						<td class="forumRowHighlight" width="62%"><input name="G_TEL" value="<%=G_TEL%>" size="45">	比如：(0)13588888888</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站关键词</u></strong><br>网站关键词,这里自己要填写好，搜索引擎推广的时候比较有用</td>						<td class="forumRowHighlight" width="62%"><input name="G_KEY" value="<%=G_KEY%>" size="45">	没有请留空</td>					</tr><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站描述</u></strong><br>网站描述</td>						<td class="forumRowHighlight" width="62%"><input name="G_DIE" value="<%=G_DIE%>" size="45">	没有请留空</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>生成验证文件名</u></strong><br>只能有数据和字母组成，最好复杂点，比如:ingtianunion</td>						<td class="forumRowHighlight" width="62%"><input name="G_union_my" value="<%=G_union_my%>" size="45">					</td></tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25"><a name="#yunxingmoshi"></a>网站联盟帐号设置</th>				<th class="tableHeaderText" align="left" height="25">&nbsp;请填写加粗的部分</th>			</tr>			<tr>				<td colspan="2" id="b_id_31">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>淘客帐号</u></strong><br>没有的话请不要填写，比如：mm_10599941_0_0</td>						<td class="forumRowHighlight" width="62%">						<input name="G_lm_taobao" value="<%=G_lm_taobao%>" size="45"> <a href="../p_inc/turnto.asp?u=http://www.alimama.com/" target="_blank">点击申请</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>购物客联盟ID</u></strong><br>没有的话请不要填写</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_gouwuke_s" value="<%=G_lm_gouwuke_s%>" size="45"> <a href="../p_inc/turnto.asp?u=http://www.yiifa.com/" target="_blank">点击申请</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>新浪微博ID</u></strong><br>没有的话请不要填写</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_sina_weibo" value="<%=G_lm_sina_weibo%>" size="45"> <a href="../p_inc/turnto.asp?u=http://www.weibo.com/" target="_blank">点击申请</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>当当购物</u></strong><br>没有的话请不要填写，比如：P-276318</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_dangdang_s" value="<%=G_lm_dangdang_s%>" size="45"> <a href="../p_inc/turnto.asp?u=http://union.dangdang.com/" target="_blank">点击申请</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>亚马逊购物</u></strong><br>没有的话请不要填写，比如：wjlhkp-23</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_amazon_s" value="<%=G_lm_amazon_s%>" size="45"> <a href="../p_inc/turnto.asp?u=https://associates.amazon.cn/" target="_blank">点击申请</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>京东商城</u></strong><br>没有的话请不要填写，比如：1688</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_360buy" value="<%=G_lm_360buy%>" size="45"> <a href="../p_inc/turnto.asp?u=http://u.jd.com/" target="_blank">点击申请</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>百度联盟帐号</u><br>没有的话请不要填写，比如：wjlhkp_pg</td>						<td class="forumRowHighlight" width="62%">							<input name="G_lm_baidu" value="<%=G_lm_baidu%>" size="45">	目前无法申请，仅限有账号的用户						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>百度联盟帐号CH</u><br>没有的话请不要填写，比如：5</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_baidu_ch" value="<%=G_lm_baidu_ch%>" size="45">	目前无法申请，仅限有账号的用户						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>Google搜索</u><br>没有的话请不要填写，比如：pub-0520467129961361</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_google_s" value="<%=G_lm_google_s%>" size="45"> 目前无法申请，仅限有账号的用户						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>sogou搜索</u><br>没有的话请不要填写，比如：ingtiandy</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_sogou_s" value="<%=G_lm_sogou_s%>" size="45"> 目前无法申请，仅限有账号的用户						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>有道搜索</u><br>没有的话请不要填写，比如：aaaaa</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_youdao" value="<%=G_lm_youdao%>" size="45"> 目前无法申请，仅限有账号的用户						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>SOSO搜索</u><br>没有的话请不要填写，比如：m400000_0001</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_soso" value="<%=G_lm_soso%>" size="45"> 目前无法申请，仅限有账号的用户						</td>					</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">模版管理</th>				<th class="tableHeaderText" align="left" height="25"></th>			</tr>			<tr>				<td colspan="2" id="b_id_31">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>模版选择：</u></strong><br>所有模版都放在/template/目录下      </td>						<td class="forumRowHighlight" width="62%">							<select name="G_moban" size="1">
		           <option value="<%=G_moban%>" selected=""><%=G_moban%></option>	
		  						</select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站首页的文件名：</u></strong><br>比如index.html、index.htm<br></td>						<td class="forumRowHighlight" width="62%">							<select name="G_JIN_TAI_IndexPage">
		  						  <option value="index.shtml" <%If (Not isNull(G_JIN_TAI_IndexPage)) Then If ("index.shtml" = CStr(G_JIN_TAI_IndexPage)) Then Response.Write("selected=""selected""") : Response.Write("")%>>index.shtml</option>
		  						  <option value="index.html"  <%If (Not isNull(G_JIN_TAI_IndexPage)) Then If ("index.html" = CStr(G_JIN_TAI_IndexPage)) Then Response.Write("selected=""selected""") : Response.Write("")%>>index.html</option>
		  						  <option value="index.htm" <%If (Not isNull(G_JIN_TAI_IndexPage)) Then If ("index.htm" = CStr(G_JIN_TAI_IndexPage)) Then Response.Write("selected=""selected""") : Response.Write("")%>>index.htm</option>

</select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>模版放置的路径</u></strong><br>默认是：html,不改的话，会被人盗走的哦，</td>						<td class="forumRowHighlight" width="62%"><input name="G_moban_html" value="<%=G_moban_html%>" size="15" id="G_moban_html"></td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>所有静态生成目录：</u></strong><br>默认都在根目录，注意请不要填写系统文件夹名</td>						<td class="forumRowHighlight" width="62%"><input name="G_jingtai_wenjian_mulu" value="<%=G_jingtai_wenjian_mulu%>" size="45"> 这里填写文件夹名，比如s</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>分类页生成模式</u></strong><br></td>						<td class="forumRowHighlight" width="62%">							<select name="G_List_yemian">
  <option value="" <%If (Not isNull(G_List_yemian)) Then If ("" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>movie2.html--带ID--不会重复</option>
  <option value="1" <%If (Not isNull(G_List_yemian)) Then If ("1" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>movie.html--最简洁--有重复的可能</option>
  <option value="2" <%If (Not isNull(G_List_yemian)) Then If ("2" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>lifefuwumovie.html--大类和小类的拼音</option>
  <option value="3"  <%If (Not isNull(G_List_yemian)) Then If ("3" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>/movie/--文件夹形式</option>							
  </select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>单个文件生成目录前缀：</u></strong><br>比如排行榜生成的目录<br></td>						<td class="forumRowHighlight" width="62%"><input name="G_JIN_TAI_PageOne" value="<%=G_JIN_TAI_PageOne%>" size="45"></td>										  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>自定义静态页面后缀：</u></strong><br>.html或.htm.或.shtml</td>						<td class="forumRowHighlight" width="62%">							<select name="G_HTML">
    <option value=".html" <%If (Not isNull(G_HTML)) Then If (".html" = CStr(G_HTML)) Then Response.Write("selected=""selected""") : Response.Write("")%>>.html</option>
    <option value=".htm" <%If (Not isNull(G_HTML)) Then If (".htm" = CStr(G_HTML)) Then Response.Write("selected=""selected""") : Response.Write("")%>>.htm</option>							
    </select>						</td>				  	</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">网站安全参数</th>				<th class="tableHeaderText" align="left" height="25"></th>			</tr>			<tr>				<td colspan="2" id="b_id_8">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>是否只让一个用户登陆(后台)</u></strong><br>是否只让一个用户登陆，慎用</td>						<td class="forumRowHighlight" width="62%">							<select name="G_FLAG">
      <option value="1" <%If (Not isNull(G_FLAG)) Then If ("1" = CStr(G_FLAG)) Then Response.Write("selected=""selected""") : Response.Write("")%>>是</option>
      <option value="0"  <%If (Not isNull(G_FLAG)) Then If ("0" = CStr(G_FLAG)) Then Response.Write("selected=""selected""") : Response.Write("")%>>否</option>							
      </select>						</td>					</tr> 					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>后台登陆验证码是否开启</u></strong><br>建议开启</td>						<td class="forumRowHighlight" width="62%">							<select name="G_yzm">
        <option value="true" <%If (Not isNull(G_yzm)) Then If ("true" = CStr(G_yzm)) Then Response.Write("selected=""selected""") : Response.Write("")%>>否</option>
        <option value="False" <%If (Not isNull(G_yzm)) Then If ("False" = CStr(G_yzm)) Then Response.Write("selected=""selected""") : Response.Write("")%>>是</option>							
        </select>						</td>					</tr> 					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>后台文件夹的目录</u></strong><br>后台文件夹的目录，只支持一级目录，改了以后请把对应的/admin文件夹也改好	</td>						<td class="forumRowHighlight" width="62%"><input name="G_ADMIN" value="<%=G_ADMIN%>" size="45"></td>					</tr> 				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="#" target="_blank"><span style="color:#0000FF">Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">前台用户参数设置</th>				<th class="tableHeaderText" align="left" height="25"></th>			</tr>			<tr>				<td colspan="2" id="b_id_23">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>用户中心是否开启</u></strong><br></td>						<td class="forumRowHighlight" width="62%">						<select name="G_user_mem" onChange="f_G_jifen_tuiguang_s()">
          <option value=""  <%If (Not isNull(G_user_mem)) Then If ("" = CStr(G_user_mem)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认开启用户中心首页</option>
          <option value="1" <%If (Not isNull(G_user_mem)) Then If ("1" = CStr(G_user_mem)) Then Response.Write("selected=""selected""") : Response.Write("")%>>关闭用户中心-但是不关闭注册</option>
          <option value="2" <%If (Not isNull(G_user_mem)) Then If ("2" = CStr(G_user_mem)) Then Response.Write("selected=""selected""") : Response.Write("")%>>关闭用户中心-但是关闭注册-关闭所有</option>						
          </select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分--用户注册送多少积分</u></strong><br>建议保留原始数据</td>						<td class="forumRowHighlight" width="62%"><input name="G_zhuce_j2" value="<%=G_zhuce_j2%>" size="45"> 默认是5</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分--用户登陆一次送多少积分</u></strong><br>一天最多只算一次</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_denglu" value="<%=G_jifen_denglu%>" size="45"> 默认是1</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分--用户推广一个链接送多少积分</u></strong><br>推广者一次只能推广一个帐号</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_tuijian" value="<%=G_jifen_tuijian%>" size="45"></td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分--用户自动访问首页送多少积分</u></strong><br> 24小时之内访问只算一次</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_home" value="<%=G_jifen_home%>" size="45"></td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>用户自动访问首页送多少积分--延迟时间</u></strong><br>就是说打开首页多少时间以后开始记费</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_home_time" value="<%=G_jifen_home_time%>" size="45">  比如：10 表示默认10秒</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>推广积分模式</u></strong><br>按时间、按IP</td>						<td class="forumRowHighlight" width="62%">							<select name="G_jifen_tuiguang_s" onChange="f_G_jifen_tuiguang_s()">
            <option value=""  <%If (Not isNull(G_jifen_tuiguang_s)) Then If ("" = CStr(G_jifen_tuiguang_s)) Then Response.Write("selected=""selected""") : Response.Write("")%>>按IP记积分</option>
            <option value="1" <%If (Not isNull(G_jifen_tuiguang_s)) Then If ("1" = CStr(G_jifen_tuiguang_s)) Then Response.Write("selected=""selected""") : Response.Write("")%>>按时间记积分</option>
            <option value="2" <%If (Not isNull(G_jifen_tuiguang_s)) Then If ("2" = CStr(G_jifen_tuiguang_s)) Then Response.Write("selected=""selected""") : Response.Write("")%>>按PV记积分</option>							
            </select>							<span id="G_jifen_tuiguang_s_span">1IP只算一个推广积分</span>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>推广积分-用户每日积分增加上限</u></strong><br>如果不设置，那么积分可以无限增加</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_s_f_1" value="<%=G_jifen_s_f_1%>" size="45" type="text">							<span id="G_jifen_s_f_1_span">如：500</span>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>推广积分--延迟时间</u></strong><br>就是说打开推广链接多少时间以后开始记录，单位是毫秒</td>						<td class="forumRowHighlight" width="62%">							<input name="G_jifen_tuiguang_time" value="<%=G_jifen_tuiguang_time%>" size="45">  比如：10 表示默认10秒						</td>				  	</tr>					<tr style="display: none;" id="G_jifen_timer_tr">						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分操作--多少时间内只记一次积分</u></strong><br>这样可以扣量，默认是0，就是不限制</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_timer" value="<%=G_jifen_timer%>" size="45">单位是 秒</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>扣掉百分的比例</u></strong><br>写数字，默认是0，就是不扣量</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_jifen_bili" value="<%=G_jifen_jifen_bili%>" size="45"> 值介与0-100之间</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分名字重命名</u></strong><br>默认名字：积分</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_jifen_name" value="<%=G_jifen_jifen_name%>" size="45"> 比如：J币、H点 等</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>积分提款比例</u></strong><br>比如比例是1￥:200,这里只要填写200即可</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_jifen_zhifubao_bili" value="<%=G_jifen_jifen_zhifubao_bili%>" size="45"> 比如：200</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>最少提款数</u></strong><br>默认是1元</td>						<td class="forumRowHighlight" width="62%"><input name="G_tikuan_smail" value="<%=G_tikuan_smail%>" size="45"> 比如：10</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>下线设为主页奖励</u></strong><br>下线用户，每设为主页一次，上线即增加相应的积分</td>						<td class="forumRowHighlight" width="62%">						<select name="G_xiaxian_zhuye_1a">
              <option value=""  <%If (Not isNull(G_xiaxian_zhuye_1a)) Then If ("" = CStr(G_xiaxian_zhuye_1a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>不奖励</option>
              <option value="1" <%If (Not isNull(G_xiaxian_zhuye_1a)) Then If ("1" = CStr(G_xiaxian_zhuye_1a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>奖励</option>						
              </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>下线登陆奖励</u></strong><br>下线用户，每登陆一次，上线即增加相应的积分</td>						<td class="forumRowHighlight" width="62%">						<select name="G_xiaxian_zhuye_2a">
                <option value=""  <%If (Not isNull(G_xiaxian_zhuye_2a)) Then If ("" = CStr(G_xiaxian_zhuye_2a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>不奖励</option>
                <option value="1" <%If (Not isNull(G_xiaxian_zhuye_2a)) Then If ("1" = CStr(G_xiaxian_zhuye_2a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>奖励</option>						
                </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>上线获取的奖励比例</u></strong><br>请设置比例，比如0.5，默认是1,就是100%提成</td>						<td class="forumRowHighlight" width="62%"><input name="G_xiaxian_zhuye_1_bili" value="<%=G_xiaxian_zhuye_1_bili%>" type="text">最好填写0.5 或 1</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>下线提款上线奖励</u></strong><br>请设置比例，比如0.1，默认是0.1</td>						<td class="forumRowHighlight" width="62%"><input name="G_xiaxian_2_jiangli" value="<%=G_xiaxian_2_jiangli%>" type="text"> 比如  0.1，这里请填写小数，0.1即10%</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>前台是否开放积分明细查询</u></strong><br>默认是只有管理员才能查看</td>						<td class="forumRowHighlight" width="62%">						<select name="G_mingxi_look">
                  <option value="" <%If (Not isNull(G_mingxi_look)) Then If ("" = CStr(G_mingxi_look)) Then Response.Write("selected=""selected""") : Response.Write("")%>>只能管理员才能查看</option>
                  <option value="1"  <%If (Not isNull(G_mingxi_look)) Then If ("1" = CStr(G_mingxi_look)) Then Response.Write("selected=""selected""") : Response.Write("")%>>积分明细完全对用户开放查看</option>						
                  </select>						<span id="G_jifen_tuiguang_s_span"></span>							</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>前台是否开放绑定本机金币的功能</u></strong><br>默认是开放</td>						<td class="forumRowHighlight" width="62%">						<select name="G_jinbi_kaifang">
                    <option value="1"  <%If (Not isNull(G_jinbi_kaifang)) Then If ("1" = CStr(G_jinbi_kaifang)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认开放</option>
                    <option value="2" <%If (Not isNull(G_jinbi_kaifang)) Then If ("2" = CStr(G_jinbi_kaifang)) Then Response.Write("selected=""selected""") : Response.Write("")%>>关闭此功能</option>						
                    </select>						<span id="G_jifen_tuiguang_s_span"></span>							</td>					</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">前台用户注册设置</th>				<th class="tableHeaderText" align="left" height="25"><font color="#ff0000">1008版本号以上可用</font></th>			</tr>			<tr>				<td colspan="2" id="b_id_23">					<table cellpadding="0" cellspacing="0" border="0" width="100%">				  	<tbody><tr>				  		<td class="forumRowHighlight" height="23" width="38%"><strong><u>前台是否开放Email密码恢复功能</u></strong><br>用户找回密码的时候会用自己的邮箱给用户发邮件</td>				  		<td class="forumRowHighlight" width="62%">				  		<select name="G_email_f_1">
                      <option value=""  <%If (Not isNull(G_email_f_1)) Then If ("" = CStr(G_email_f_1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认关闭</option>
                      <option value="1" <%If (Not isNull(G_email_f_1)) Then If ("1" = CStr(G_email_f_1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>开放此功能</option>				  		
                      </select>				  		<span id="G_jifen_tuiguang_s_span">需要 邮件基本参数设置 </span>						</td>				  	</tr>				  	<tr>				  		<td class="forumRowHighlight" height="23" width="38%"><strong><u>前台用户注册是否开启Email验证功能</u></strong><br>开启的话，没有Email验证的话，无法登陆账号</td>				  		<td class="forumRowHighlight" width="62%">				  		<select name="G_soojs_yz_str">
                        <option value="" <%If (Not isNull(G_soojs_yz_str)) Then If ("" = CStr(G_soojs_yz_str)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认不开启</option>
                        <option value="1" <%If (Not isNull(G_soojs_yz_str)) Then If ("1" = CStr(G_soojs_yz_str)) Then Response.Write("selected=""selected""") : Response.Write("")%>>开放此功能</option>				  		
                        </select>				  		<span id="G_jifen_tuiguang_s_span">需要 邮件基本参数设置 </span>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>			<td colspan="2" class="forumRowHighlight" align="center" height="23">				<input name="Submit" value="保存设置" id="Submit_ok" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				<input name="Submit2" value="重&nbsp;&nbsp;&nbsp;&nbsp;置" type="reset">&nbsp;&nbsp;&nbsp;&nbsp;				<input name="beifen" checked="checked" value="1" type="checkbox">是否备份源文件				</td>			</tr>		</tbody>	</table></form>
<!--14-04-19 大军添加缺少的form完毕-->




<%
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = form;")
		WriteLn("	with(oForm){")
			WriteLn("		G_KEY.value='" & G_KEY & "';")
			WriteLn("		G_DIE.value='" & G_DIE & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
%>


<script>f_G_jifen_tuiguang_s()</script>
<%
end if
If request("action")="save" Then
Dim str
str=""
'str=str&"<"&chr(37)&"@ LANGUAGE = VBScript.Encode "&chr(37)&">"&chr(10)   大军修改 暂时屏蔽 防止重复头文件出错
str=str&"<"&chr(37)&chr(10)
str=str&"'----------------------下面是晴天版导航系统配置文件参数--------------------------------"&chr(10)
str=str&"On Error Resume Next"&chr(13)&chr(10)
str=str&" G_VIRTUAL_ROOT_DIR = "&re("G_VIRTUAL_ROOT_DIR")&chr(13)&chr(10)
str=str&" G_CONN_STR = "&re("G_CONN_STR")&chr(13)&chr(10)
str=str&" G_IS_SL_User_DB = "&re("G_IS_SL_User_DB")&chr(13)&chr(10)
str=str&" G_SL_IP = "&re("G_SL_IP")&chr(13)&chr(10)
str=str&" G_SL_DATA = "&re("G_SL_DATA")&chr(13)&chr(10)
str=str&" G_SL_USER = "&re("G_SL_USER")&chr(13)&chr(10)
str=str&" G_SL_PASS = "&re("G_SL_PASS")&chr(13)&chr(10)
str=str&" G_WEBTITLE = "&re("G_WEBTITLE")&chr(13)&chr(10)
str=str&" G_WEBNAME = "&re("G_WEBNAME")&chr(13)&chr(10)
str=str&" G_WEBURL = "&re("G_WEBURL")&chr(13)&chr(10)
str=str&" G_WEBURL_2 = "&re("G_WEBURL_2")&chr(13)&chr(10)
str=str&" G_QQ = "&re("G_QQ")&chr(13)&chr(10)


str=str&" G_TEL = "&re("G_TEL")&chr(13)&chr(10)
str=str&" G_EMAIL = "&re("G_EMAIL")&chr(13)&chr(10)
str=str&" G_BEIAN = "&re("G_BEIAN")&chr(13)&chr(10)
str=str&" G_KEY = "&re("G_KEY")&chr(13)&chr(10)
str=str&" G_DIE = "&re("G_DIE")&chr(13)&chr(10)
str=str&" G_moshi = "&re("G_moshi")&chr(13)&chr(10)
str=str&" G_moban = "&re("G_moban")&chr(13)&chr(10)
str=str&" G_moban_html = "&re("G_moban_html")&chr(13)&chr(10)
str=str&" G_HTML = "&re("G_HTML")&chr(13)&chr(10)
str=str&" G_JIN_TAI_PageOne = "&re("G_JIN_TAI_PageOne")&chr(13)&chr(10)
str=str&" G_Time_For = "&re("G_Time_For")&chr(13)&chr(10)
str=str&" G_FLAG = "&re("G_FLAG")&chr(13)&chr(10)
str=str&" G_yzm = "&re("G_yzm")&chr(13)&chr(10)
str=str&" G_ADMIN = "&re("G_ADMIN")&chr(13)&chr(10)
str=str&" EnableUploadFile = "&re("EnableUploadFile")&chr(13)&chr(10)
str=str&" G_BIG_T = "&re("G_BIG_T")&chr(13)&chr(10)
str=str&" MaxFileSize = "&re("MaxFileSize")&chr(13)&chr(10)
str=str&" UpFileType = "&re("UpFileType")&chr(13)&chr(10)
str=str&" G_SHUIYIN = "&re("G_SHUIYIN")&chr(13)&chr(10)
str=str&" G_SHUIYIN_TYPE = "&Replace(re("G_FLAG"),"""","")&chr(13)&chr(10)
str=str&" G_S_PicUrl = "&re("G_S_PicUrl")&chr(13)&chr(10)
str=str&" G_S_MarkText = "&re("G_S_MarkText")&chr(13)&chr(10)
str=str&" G_S_MarkFontColor = "&re("G_S_MarkFontColor")&chr(13)&chr(10)
str=str&" G_S_MarkFontName = "&re("G_S_MarkFontName")&chr(13)&chr(10)
str=str&" G_S_MarkFontBond = "&re("G_S_MarkFontBond")&chr(13)&chr(10)
str=str&" G_S_MarkFontSize = "&re("G_S_MarkFontSize")&chr(13)&chr(10)
str=str&" G_S_MarkPosition = "&re("G_S_MarkPosition")&chr(13)&chr(10)

str=str&" G_lm_baidu = "&re("G_lm_baidu")&chr(13)&chr(10)
str=str&" G_lm_baidu_ch = "&re("G_lm_baidu_ch")&chr(13)&chr(10)
str=str&" G_lm_taobao = "&re("G_lm_taobao")&chr(13)&chr(10)
str=str&" G_lm_xunlei = "&re("G_lm_xunlei")&chr(13)&chr(10)
str=str&" G_lm_google_s = "&re("G_lm_google_s")&chr(13)&chr(10)
str=str&" G_lm_sogou_s = "&re("G_lm_sogou_s")&chr(13)&chr(10)
str=str&" G_lm_amazon_s = "&re("G_lm_amazon_s")&chr(13)&chr(10)
str=str&" G_lm_dangdang_s = "&re("G_lm_dangdang_s")&chr(13)&chr(10)
str=str&" G_lm_360buy = "&re("G_lm_360buy")&chr(13)&chr(10)
str=str&" G_lm_youdao = "&re("G_lm_youdao")&chr(13)&chr(10)
str=str&" G_lm_soso = "&re("G_lm_soso")&chr(13)&chr(10)
str=str&" G_lm_500wan_s = "&re("G_lm_500wan_s")&chr(13)&chr(10)
str=str&" G_JIN_TAI_IndexPage = "&re("G_JIN_TAI_IndexPage")&chr(13)&chr(10)

str=str&" G_union_my = "&re("G_union_my")&chr(13)&chr(10)
str=str&" G_List_yemian = "&re("G_List_yemian")&chr(13)&chr(10)
str=str&" G_u_Cookies = "&re("G_u_Cookies")&chr(13)&chr(10)

str=str&" G_zhuce_j2 = "&re("G_zhuce_j2")&chr(13)&chr(10)
str=str&" G_jifen_denglu = "&re("G_jifen_denglu")&chr(13)&chr(10)
str=str&" G_jifen_tuijian = "&re("G_jifen_tuijian")&chr(13)&chr(10)
str=str&" G_jingtai_wenjian_mulu = "&re("G_jingtai_wenjian_mulu")&chr(13)&chr(10)

str=str&" G_jifen_lailu = "&re("G_jifen_lailu")&chr(13)&chr(10)
str=str&" G_jifen_timer = "&re("G_jifen_timer")&chr(13)&chr(10)
str=str&" G_jifen_tuiguang_s = "&re("G_jifen_tuiguang_s")&chr(13)&chr(10)
str=str&" G_jifen_jifen_bili = "&re("G_jifen_jifen_bili")&chr(13)&chr(10)
str=str&" G_jifen_jifen_name = "&re("G_jifen_jifen_name")&chr(13)&chr(10)
str=str&" G_jifen_home = "&re("G_jifen_home")&chr(13)&chr(10)
str=str&" G_jifen_home_time = "&re("G_jifen_home_time")&chr(13)&chr(10)

str=str&" G_jifen_jifen_zhifubao_bili = "&re("G_jifen_jifen_zhifubao_bili")&chr(13)&chr(10)
str=str&" G_tikuan_smail = "&re("G_tikuan_smail")&chr(13)&chr(10)
str=str&" G_xiaxian_renwu_1 = "&re("G_xiaxian_renwu_1")&chr(13)&chr(10)
str=str&" G_xiaxian_c_1 = "&re("G_xiaxian_c_1")&chr(13)&chr(10)
str=str&" G_xiaxian_c_2 = "&re("G_xiaxian_c_2")&chr(13)&chr(10)
str=str&" G_mingxi_look = "&re("G_mingxi_look")&chr(13)&chr(10)
str=str&" G_xiaxian_zhuye_1a = "&re("G_xiaxian_zhuye_1a")&chr(13)&chr(10)
str=str&" G_xiaxian_zhuye_2a = "&re("G_xiaxian_zhuye_2a")&chr(13)&chr(10)
str=str&" G_jinbi_kaifang = "&re("G_jinbi_kaifang")&chr(13)&chr(10)
str=str&" G_xiaxian_2_jiangli = "&re("G_xiaxian_2_jiangli")&chr(13)&chr(10)
str=str&" G_xiaxian_zhuye_1_bili = "&re("G_xiaxian_zhuye_1_bili")&chr(13)&chr(10)
str=str&" G_jifen_lailu_out = "&re("G_jifen_lailu_out")&chr(13)&chr(10)
str=str&" G_jifen_timer_lailu = "&re("G_jifen_timer_lailu")&chr(13)&chr(10)
str=str&" G_jifen_jifen_bili_lailu = "&re("G_jifen_jifen_bili_lailu")&chr(13)&chr(10)
str=str&" G_jifen_jifen_numbs_lailu = "&re("G_jifen_jifen_numbs_lailu")&chr(13)&chr(10)

str=str&" G_email_f_1 = "&re("G_email_f_1")&chr(13)&chr(10)
str=str&" G_jifen_s_f_1 = "&re("G_jifen_s_f_1")&chr(13)&chr(10)
str=str&" G_soojs_yz_str = "&re("G_soojs_yz_str")&chr(13)&chr(10)
str=str&" G_user_mem = "&re("G_user_mem")&chr(13)&chr(10)

str=str&" G_lm_gouwuke_s = "&re("G_lm_gouwuke_s")&chr(13)&chr(10)
str=str&" G_lm_sina_weibo = "&re("G_lm_sina_weibo")&chr(13)&chr(10)

str=str&" G_jifen_tuiguang_time = "&re("G_jifen_tuiguang_time")&chr(13)&chr(10)

str=str&chr(37)&">"&chr(13)&chr(10)
'save file-----start
'start copy file 保存之前先备份
N_Fso.CreateFolders "/backup/"
IF request.Form("beifen")="1" Then
	Pa="../backup"
	Set d_file1=server.CreateObject(G_FSO)
	set d_folder1=d_file1.GetFolder(""&server.mappath(Pa)&"")
	d_file1.CopyFile server.MapPath("../p_inc/config.asp"),server.MapPath(Pa&"/config_"&FormatDate(now,11)&""&".asp")	
End IF
'end copy file
Path = "../p_inc"
FileName = "config.asp"
EditFile = Server.MapPath(Path) & "\" & FileName
Dim FsoObj,FileObj,FileStreamObj
'Set FsoObj = Server.CreateObject(G_FSO)
'Set FileObj = FsoObj.GetFile(EditFile)
	'Set FileStreamObj = FileObj.OpenAsTextStream(2)
	'FileStreamObj.Write str
    'FileStreamObj.save
'response.Write EditFile
'''----------------------------
write2file EditFile, str, false 
'新加入写入文件函数
sub write2file(strfile, strcontent, blnappend) 
'写入文件 
'strfile 文件名(路径) , strcontent 写入的内容, blnappend 是否追加 
on error resume next 
set objfso = server.createobject("scripting.filesystemobject") 
if blnappend then 
set objwritetext = objfso.opentextfile(strfile,8,true) 
else 
set objwritetext = objfso.opentextfile(strfile,2,true) 
end if 
objwritetext.writeline (strcontent) 
set objwritetext = nothing 
set objfso = nothing 
'容错处理 
select case err 
case 424 response.write "路径未找到或该目录没有写入权限." 
case else 
response.write err.description 
response.write err 
end select 
end sub 

'调用方法: 
'write2file "c:＼dd.ini", "dd", true 
'或 
'call write2file ("c:＼dd.ini", "dd", true) 


'response.End()


'==================开始保存流量统计config===================
str=""
str=str&"<"&chr(37)&chr(10)
str=str&" hxCacheName = "&re("hxCacheName")&chr(13)&chr(10)
str=str&" cneip = """""&chr(13)&chr(10)
str=str&" maxReBack = "&re("maxReBack")&chr(13)&chr(10)
str=str&" hxtime = "&re("hxtime")&chr(13)&chr(10)
str=str&" hxLook = "&re("hxLook")&chr(13)&chr(10)
str=str&" G_All_moshi = "&re("G_All_moshi")&chr(13)&chr(10)
str=str&" G_All_InAuto = "&re("G_All_InAuto")&chr(13)&chr(10)
str=str&" G_all_InNumb = "&re("G_all_InNumb")&chr(13)&chr(10)
str=str&" G_All_dhList_f = "&re("G_All_dhList_f")&chr(13)&chr(10)
str=str&chr(37)&">"&chr(13)&chr(10)
IF request.Form("beifen")="1" Then
	Pa="../backup"
	Set d_file1=server.CreateObject(G_FSO)
	set d_folder1=d_file1.GetFolder(""&server.mappath(Pa)&"")
	d_file1.CopyFile server.MapPath("../p_inc/qingtiancms.com.config__.asp"),server.MapPath(Pa&"/config_dh_"&FormatDate(now,11)&""&".asp")	
End IF
Path = "../p_inc"
FileName = "qingtiancms.com.config__.asp"
EditFile = Server.MapPath(Path) & "\" & FileName


Set FsoObj = Server.CreateObject(G_FSO)
Set FileObj = FsoObj.GetFile(EditFile)
Set FileStreamObj = FileObj.OpenAsTextStream(2)
FileStreamObj.Write str



'===开始重新写入文件================
str1=ReadAllTextFile(Add_Root_Dir("/tUnion/js/1.config"))
IF G_VIRTUAL_ROOT_DIR="" Then
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL)
Else
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")
End IF
N_Fso.CreateFolderFile Add_Root_Dir("/tUnion/js/1.js"),str1

str1=ReadAllTextFile(Add_Root_Dir("/tUnion/js/2.config"))
IF G_VIRTUAL_ROOT_DIR="" Then
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL)
Else
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")
End IF
N_Fso.CreateFolderFile Add_Root_Dir("/tUnion/js/2.js"),str1

'save file-----end

'===开始写入基本配置==================
str1=ReadAllTextFile(Add_Root_Dir("/p_inc/qingtiancms.com........asp"))
IF G_VIRTUAL_ROOT_DIR="" Then
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL)
	str1=replace(str1,"{G_VIRTUAL_ROOT_DIR}","/")
Else
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")
	str1=replace(str1,"{G_VIRTUAL_ROOT_DIR}","/"&request("G_VIRTUAL_ROOT_DIR")&"/")
End IF
str1=Replace(str1,"{t:G_All_moshi}",request("G_All_moshi"))
str1=Replace(str1,"{t:G_All_dhList_f}",request("G_All_dhList_f"))
str1=Replace(str1,"{t:G_WEBNAME}",request("G_WEBNAME"))
str1=Replace(str1,"{t:G_moban}",request("G_moban"))
str1=Replace(str1,"{t:G_jifen_home_time}",Bint(request("G_jifen_home_time"))*1000)
str1=Replace(str1,"{t:G_jifen_tuiguang_time}",Bint(request("G_jifen_tuiguang_time"))*1000)
str1=MakeHTML_CMS(str1)

N_Fso.CreateFolderFile Add_Root_Dir("/p_inc/public.js"),str1

IF Cadmin="" Then
str_f=Add_Root_Dir("/template/"&G_moban&"/js/public4/rebuild/css/index.css.gif")
str1=ReadAllTextFile(str_f)
str1_u="http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("/")&"Template/"&G_moban&"/images/logo.png"
str1=Replace(str1,"http://hao123.ingti"&"andy.cn/skin19"&"s/Template/skin19_4_20100527/images/logo.png",str1_u)
N_Fso.CreateFolderFile Add_Root_Dir("/template/"&G_moban&"/js/public4/rebuild/css/index.css"),str1
End IF


response.write"<table cellpadding=2 cellspacing=1 border=0 width=400 class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>保存网站信息</TH>"
'response.Flush()
'response.write"<TR><tr><td height=85 valign=top class=forumRowHighlight><div align=left><br><br>正在转化可用播放方式，请不要关闭....<br>"
'response.Flush()
'response.Write "先前支持格式："&G_v_type&"<br>"
'response.Write "现在支持格式："&request("G_v_type")&"<br>"
'
'G_v_type_arr=split(G_v_type,",")
'G_v_type_t=G_v_type
'For i=0 To Ubound(G_v_type_arr)
'	IF Instr(request("G_v_type"),G_v_type_arr(i))>0 Then
'		G_v_type_t=replace(G_v_type_t,G_v_type_arr(i),"")
'	End IF
'Next
'G_v_type_t=PrintArray(G_v_type_t,",")
'response.Write "去除格式："&G_v_type_t&"<br>"
'G_v_type_t_arr=Split(G_v_type_t,",")
'For i=0 To Ubound(G_v_type_t_arr)
'	G_v_type_t_1=Trim(G_v_type_t_arr(i))
'	IF G_v_type_t_1<>"" Then
'		conn.execute("update ingtiandy_movie set m_look=0 where m_type3='"&G_v_type_t_1&"'")
'	End IF
'Next
'response.Write"转化完毕!</div></td></tr>"
response.write"<TR><tr><td height=85 valign=top class=forumRowHighlight><div align=center><br><br>网站配置保存成功！</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='qingtiancms.com.setting.asp'>&lt;&lt; 返回上一页</a></td>"
response.write"</tr>"
response.write"</table>"
response.write"<br><br>" 
Response.Write "<script>parent.left.location.reload()</script>"
end if



%>
</body>
</html>
