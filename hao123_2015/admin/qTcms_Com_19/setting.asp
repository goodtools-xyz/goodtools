<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<!--#include file="News/Config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>网站信息设置</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.bg66{ color:#666666}

-->
</style>
</head>
<body>
<%

If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" Then
	response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
	response.End()
End IF
response.Cookies("qingtiandy.cn")=""
If request("action")="" Then
Function Basic_1()
	IF G_IS_SQL_User_DB="1" Then
		Basic_1="(<font color=""#FF0000"">必改</font>)"
	Else
		Basic_1=""
	End IF
End Function

Function Basic_2()
	IF G_IS_SQL_User_DB="1" Then
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
	Ghelp="<a href='"&v&"' target=_blank><img src='../images/help.gif' border=0 alt='查看帮助'></a>"
End Function
Function req(v)
	req=""""&request.Form(v)&""""
End Function
%>
<script src="../js/basicjs.js"></script>
<script src="images/admincitys.js"></script>
<script src="images/admin.js"></script>
<form action="?action=save" method="post" name="form">







<!--大军添加-->

<table class="tableBorder" cellpadding="3" cellspacing="1" align="center" border="0" width="98%"><tbody><tr><th class="tableHeaderText" height="25" width="38%">1616参数设置</th><th class="tableHeaderText" height="25" width="62%"></th></tr>  <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>天气预报默认选择城市</u></strong><br>			  如果不选择，默认是智能判断的</td>				<td class="forumRowHighlight" width="62%">				  <select id="w_pro" onChange="Weather.cp(this.value)">	

<option value="100">Z 智能判断</option>					<option value="109">B 北京</option>					<option value="117">S 上海</option>					<option value="110">T 天津</option>					<option value="135">C 重庆</option>					<option value="119">A 安徽</option>					<option value="123">F 福建</option>					<option value="127">G 广东</option>					<option value="128">G 广西</option>					<option value="137">G 贵州</option>					<option value="131">G 甘肃</option>					<option value="111">H 河北</option>					<option value="124">H 河南</option>					<option value="125">H 湖北</option>					<option value="126">H 湖南</option>					<option value="129">H 海南</option>					<option value="116">H 黑龙江</option>					<option value="122">J 江西</option>					<option value="120">J 江苏</option>					<option value="115">J 吉林</option>					<option value="114">L 辽宁</option>					<option value="132">N 宁夏</option>					<option value="113">N 内蒙古</option>					<option value="133">Q 青海</option>					<option value="118">S 山东</option>					<option value="112">S 山西</option>					<option value="130">S 陕西</option>					<option value="136">S 四川</option>					<option value="139">X 西藏</option>					<option value="134">X 新疆</option>					<option value="138">Y 云南</option>					<option value="121">Z 浙江</option>					<option value="140">X 香港</option>					<option value="141">A 澳门</option>					<option value="142">T 台湾</option>				  </select>				  <select id="w_city" onChange="Weather.cc(this.value);"></select>				  <select id="l_city" name="G_qTcms_Com_16_City"></select>				</td>			</tr>				</tbody></table>  	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>默认搜索引擎设置</u></strong><br>			  默认是百度</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_sosuo_q">
  <option value="" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认</option>
  <option value="baidu"  <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("baidu" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>百度搜索</option>
  <option value="google" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("google" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>谷歌搜索</option>
  <option value="s360" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("s360" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>360搜索</option>
  <option value="sogou" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("sogou" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>搜狗搜索</option>
  <option value="bing" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("bing" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>必应搜索</option>
  <option value="youdao" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("youdao" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>有道搜索</option>				 
  </select>				</td>			</tr>		</tbody></table>  	</td>  </tr>   <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>网站是否正在进行QQ审核</u></strong><br>			  如果QQ登陆审核正在提交审核，请必须选择</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qq">
    <option value="" <%If (Not isNull(G_qTcms_Com_16_qq)) Then If ("" = CStr(G_qTcms_Com_16_qq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>QQ登陆不显示</option>
    <option value="1" <%If (Not isNull(G_qTcms_Com_16_qq)) Then If ("1" = CStr(G_qTcms_Com_16_qq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>QQ登陆正在审核</option>
    <option value="2"  <%If (Not isNull(G_qTcms_Com_16_qq)) Then If ("2" = CStr(G_qTcms_Com_16_qq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>QQ已通过审核</option>				 
    </select>				</td>			</tr>		</tbody></table>  	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>友情链接是否显示</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_yq">
      <option value="1"  <%If (Not isNull(G_qTcms_Com_16_yq)) Then If ("1" = CStr(G_qTcms_Com_16_yq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>显示</option>
      <option value="2" <%If (Not isNull(G_qTcms_Com_16_yq)) Then If ("2" = CStr(G_qTcms_Com_16_yq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>隐藏</option>				 
      </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>默认皮肤设置</u></strong><br>			  如果不选择，默认是空白的</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_Pifu">
        <option value="" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认空白</option>
        <option value="singer" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("singer" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--我是歌手</option>
        <option value="2014newyear" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("2014newyear" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--马到功成(马年快乐)</option>
        <option value="2014qrj" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("2014qrj" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--世纪情人节(02.14)</option>
        <option value="qrj" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("qrj" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--情人节(02.14)</option>
        <option value="smqm" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("smqm" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--春意</option>
        <option value="spring" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("spring" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--水墨清明(清明节)</option>
        <option value="childrens" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("childrens" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--六一儿童节(06.01)</option>
        <option value="kxl" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("kxl" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--开学啦</option>
        <option value="teacher" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("teacher" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--教师节快乐(09.10)</option>
        <option value="xmas" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("xmas" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--圣诞节(12.25)</option>
        <option value="practical" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("practical" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--最实用的网址导航</option>
        <option value="rocket" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("rocket" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--飞快的火箭</option>
        <option value="hellokitty" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("hellokitty" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--hellokitty</option>
        <option value="gytt" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("gytt" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--古韵天坛</option>
        <option value="meng" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("meng" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--萌点心</option>
        <option value="dpx" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("dpx" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--地平线</option>
        <option value="yuanfan" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("yuanfan" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--远帆</option>
        <option value="zoro" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("zoro" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--索隆和佩罗娜公主</option>
        <option value="love" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("love" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--爱就永远在一起</option>
        <option value="qhc" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("qhc" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--青花瓷</option>
        <option value="byj" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("byj" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--毕业季</option>
        <option value="fly" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("fly" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--放飛自己，尋找夢想</option>
        <option value="qb" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("qb" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--托尼托尼·乔巴</option>
        <option value="color" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("color" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--彩色标签</option>
        <option value="shopping" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("shopping" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--完美生活-爱购时尚</option>
        <option value="summer" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("summer" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--夏日海风</option>
        <option value="butterfly" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("butterfly" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--蝴蝶飞飞</option>
        <option value="angryBirds" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("angryBirds" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--愤怒的小鸟</option>
        <option value="emotionalBus" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("emotionalBus" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--情感巴士</option>
        <option value="2012guoqin" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("2012guoqin" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--国庆63周年</option>
        <option value="classicsPink" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("classicsPink" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--经典粉</option>
        <option value="pink" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("pink" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--粉红色</option>
        <option value="classicsGreen" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("classicsGreen" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--经典绿</option>
        <option value="green"  <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("green" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--绿色(仿hao123)</option>
        <option value="classicsBlue" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("classicsBlue" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--经典蓝</option>
        <option value="blue" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("blue" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--蓝色</option>				 
        </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>   <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>自动采集模块</u></strong><br>			  添加信息的时候，选择这里的模块就可以支持自动采集</td>				<td class="forumRowHighlight" width="62%">				<table cellpadding="0" cellspacing="0" border="0" width="100%">				  <tbody><tr>					<td>
		<%

		getG_qTcms_Com_16_mkuai=Split(G_qTcms_Com_16_mkuai,",") '这里的逗号取决于你之前保存到数据库中的分割符 
		

Function check(temp) 
check="" 
For I=0 To UBound(getG_qTcms_Com_16_mkuai) 
if temp=trim(getG_qTcms_Com_16_mkuai(I)) Then 
check="checked" 
End if 
Next 
End Function 
			
		%>
		
							<input name="G_qTcms_Com_16_mkuai" value="*"  type="checkbox" <%=check("*")%>>全部					</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>					<input name="G_qTcms_Com_16_mkuai" value="qingtiancms_com_toutiao" type="checkbox" <%=check("qingtiancms_com_toutiao")%>>
        头条					<input name="G_qTcms_Com_16_mkuai" value="xinwen" type="checkbox" <%=check("xinwen")%>>新闻					<input name="G_qTcms_Com_16_mkuai" value="junshi" type="checkbox" <%=check("junshi")%>>军事					<input name="G_qTcms_Com_16_mkuai" value="tiyu" type="checkbox" <%=check("tiyu")%>>体育					<input name="G_qTcms_Com_16_mkuai" value="bagua" type="checkbox" <%=check("bagua")%>>八卦									<input name="G_qTcms_Com_16_mkuai" value="guonei" type="checkbox" <%=check("guonei")%>>国内									<input name="G_qTcms_Com_16_mkuai" value="guoji" type="checkbox" <%=check("guoji")%>>国际									<input name="G_qTcms_Com_16_mkuai" value="yule" type="checkbox" <%=check("yule")%>>娱乐									<input name="G_qTcms_Com_16_mkuai" value="hulianwang" type="checkbox" <%=check("hulianwang")%>>互联网				<br>					<input name="G_qTcms_Com_16_mkuai" value="keji" type="checkbox" <%=check("keji")%>>科技									<input name="G_qTcms_Com_16_mkuai" value="caijing" type="checkbox" <%=check("caijing")%>>财经									<input name="G_qTcms_Com_16_mkuai" value="fangchan" type="checkbox" <%=check("fangchan")%>>房产									<input name="G_qTcms_Com_16_mkuai" value="jiaoyu" type="checkbox" <%=check("jiaoyu")%>>教育									<input name="G_qTcms_Com_16_mkuai" value="youxi" type="checkbox" <%=check("youxi")%>> 游戏									<input name="G_qTcms_Com_16_mkuai" value="nvxing" type="checkbox" <%=check("nvxing")%>>女性									<input name="G_qTcms_Com_16_mkuai" value="jiankang" type="checkbox" <%=check("jiankang")%>>健康									<input name="G_qTcms_Com_16_mkuai" value="shehui" type="checkbox" <%=check("shehui")%>>社会									</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>					<input name="G_qTcms_Com_16_mkuai" value="shipin" type="checkbox" <%=check("shipin")%>>视频					<input name="G_qTcms_Com_16_mkuai" value="dianying" type="checkbox" <%=check("dianying")%>>电影					<input name="G_qTcms_Com_16_mkuai" value="zongyi" type="checkbox" <%=check("zongyi")%>>综艺					<input name="G_qTcms_Com_16_mkuai" value="dongman" type="checkbox" <%=check("dongman")%>>动漫						<input name="G_qTcms_Com_16_mkuai" value="tv" type="checkbox" <%=check("tv")%>>电视剧						<input name="G_qTcms_Com_16_mkuai" value="mingxing" type="checkbox" <%=check("mingxing")%>>明星						<input name="G_qTcms_Com_16_mkuai" value="meinv" type="checkbox" <%=check("meinv")%>>美女						</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>										<input name="G_qTcms_Com_16_mkuai" value="qingtiancms_com_xiaohua" type="checkbox" <%=check("qingtiancms_com_xiaohua")%>>笑话						</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>					<input name="G_qTcms_Com_16_mkuai" value="bgyl" type="checkbox" <%=check("bgyl")%>>八卦娱乐					<input name="G_qTcms_Com_16_mkuai" value="mnyy" type="checkbox" <%=check("mnyy")%>>养眼美女					<input name="G_qTcms_Com_16_mkuai" value="mryx" type="checkbox" <%=check("mryx")%>>每日一笑					</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>										<input name="G_qTcms_Com_16_mkuai" value="qingtiancms_com_toplist" type="checkbox" check>搜索框关键词						</td>				  </tr>				</tbody></table>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>首页名站导航显示个数</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_right_mz">
          <option value="48"  <%If (Not isNull(G_qTcms_Com_16_right_mz)) Then If ("48" = CStr(G_qTcms_Com_16_right_mz)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认48个</option>
          <option value="60" <%If (Not isNull(G_qTcms_Com_16_right_mz)) Then If ("60" = CStr(G_qTcms_Com_16_right_mz)) Then Response.Write("selected=""selected""") : Response.Write("")%>>60个</option>				 
          </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>网购更优惠版块 是否显示</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qingtiancms_b_b1">
            <option value="2"  <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b1)) Then If ("2" = CStr(G_qTcms_Com_16_qingtiancms_b_b1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认显示</option>
            <option value="1" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b1)) Then If ("1" = CStr(G_qTcms_Com_16_qingtiancms_b_b1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>隐藏该版块</option>				 
            </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>休闲娱乐吧版块 是否显示</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qingtiancms_b_b2">
              <option value="2"  <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b2)) Then If ("2" = CStr(G_qTcms_Com_16_qingtiancms_b_b2)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认显示</option>
              <option value="1" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b2)) Then If ("1" = CStr(G_qTcms_Com_16_qingtiancms_b_b2)) Then Response.Write("selected=""selected""") : Response.Write("")%>>隐藏该版块</option>				 
              </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>最常用工具版块 是否显示</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qingtiancms_b_b3">
                <option value="2" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b3)) Then If ("2" = CStr(G_qTcms_Com_16_qingtiancms_b_b3)) Then Response.Write("selected=""selected""") : Response.Write("")%>>默认显示</option>
                <option value="1" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b3)) Then If ("1" = CStr(G_qTcms_Com_16_qingtiancms_b_b3)) Then Response.Write("selected=""selected""") : Response.Write("")%>>隐藏该版块</option>				 
                </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>网购更优惠版块 名字重命名</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<input name="G_qTcms_Com_16_qingtiancms_b_c1" id="G_qTcms_Com_16_qingtiancms_b_c1" value="<%=G_qTcms_Com_16_qingtiancms_b_c1%>"> 10个汉字以内				皮肤版本号1005以及以上有效，请把模板升级带最新				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>休闲娱乐吧版块 名字重命名</u></strong><br>			  默认是显示</td>				<td class="forumRowHighlight" width="62%">				<input name="G_qTcms_Com_16_qingtiancms_b_c2" id="G_qTcms_Com_16_qingtiancms_b_c2" value="<%=G_qTcms_Com_16_qingtiancms_b_c2%>"> 10个汉字以内				皮肤版本号1005以及以上有效，请把模板升级带最新				</td>			</tr>			</tbody></table> 	</td>  </tr> 				  <tr>					<td colspan="2" class="forumRowHighlight" align="right">						<a href="http://www.qingtiancms.com" target="_blank"><span style="color:#0000FF">?qTcms.com</span></a>					</td>				  </tr>



	
	<tr>
	  <td colspan="2" class="forumRowHighlight" align="center" height="23"><input name="Submit" value="保存设置" id="Submit_ok" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="Submit2" value="重&nbsp;&nbsp;&nbsp;&nbsp;置" type="reset">&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
  </tr>	  	



  






</tbody></table>




	
	<TR>
	  <td height=23 colspan="2" class="forumRowHighlight" align="center"><input type="submit" name="Submit" value="保存设置" id="Submit_ok">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset" name="Submit2" value="重&nbsp;&nbsp;&nbsp;&nbsp;置">&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
  </tr>	  	
</form>


  



<%
end if
If request("action")="save" Then



Dim str
str=""
str=str&"<"&chr(37)&chr(10)
str=str&" G_qTcms_Com_16_Time = "&req("G_qTcms_Com_16_Time")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_City = "&req("G_qTcms_Com_16_City")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_Pifu = "&req("G_qTcms_Com_16_Pifu")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_lie = "&req("G_qTcms_Com_16_lie")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_mz = "&req("G_qTcms_Com_16_mz")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_tj2 = "&req("G_qTcms_Com_16_tj2")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_yq = "&req("G_qTcms_Com_16_yq")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qq = "&req("G_qTcms_Com_16_qq")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_sosuo_q = "&req("G_qTcms_Com_16_sosuo_q")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_mkuai = "&req("G_qTcms_Com_16_mkuai")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_right_mz = "&req("G_qTcms_Com_16_right_mz")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_b1 = "&req("G_qTcms_Com_16_qingtiancms_b_b1")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_b2 = "&req("G_qTcms_Com_16_qingtiancms_b_b2")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_b3 = "&req("G_qTcms_Com_16_qingtiancms_b_b3")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_c1 = "&req("G_qTcms_Com_16_qingtiancms_b_c1")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_c2 = "&req("G_qTcms_Com_16_qingtiancms_b_c2")&chr(13)&chr(10)
str=str&chr(37)&">"&chr(13)&chr(10)


Path = "../../p_inc/qingtiancms.com.Config_Self.asp"


N_Fso.WriteToFile Path,str





response.write"<table cellpadding=2 cellspacing=1 border=0 width=400 class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>保存网站信息</TH>"

response.write"<TR><tr><td height=85 valign=top class=forumRowHighlight><div align=center><br><br>设置保存成功！</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='setting.asp'>&lt;&lt; 返回上一页</a></td>"
response.write"</tr>"
response.write"</table>"
response.write"<br><br>" 
end if



%>
</body>
</html>
