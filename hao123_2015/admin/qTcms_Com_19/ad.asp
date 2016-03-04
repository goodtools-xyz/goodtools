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
<img src="dh.jpg" border="0" usemap="#Map" href=",&quot;列表页--底部广告(宽960)&quot;" />
<map name="Map" id="Map">
  <area shape="rect" coords="618,1,726,27" href="qq_1.asp" />
<area shape="rect" coords="1130,0,1209,26" href="setting.asp" />
<area shape="rect" coords="353,144,484,184" href="setting.asp" />
<area shape="rect" coords="530,37,851,103" href="setting.asp" />
<area shape="rect" coords="875,40,1026,68" href="../qingtiandy_gonggao/index.asp" />
<area shape="rect" coords="537,113,905,143" href="News/index.asp?m_type1=29" />
<area shape="rect" coords="1057,33,1224,99" href="News/index.asp?m_type1=25" /><area shape="rect" coords="222,1842,360,1876" href="News/index.asp?m_type1=22" /><area shape="rect" coords="1056,1877,1217,2209" href="News/index.asp?m_type1=22&amp;m_type2=2" /><area shape="rect" coords="549,1845,589,1873" href="News/index.asp?m_type1=22&amp;m_type2=3" /><area shape="rect" coords="602,1847,642,1874" href="News/index.asp?m_type1=22&amp;m_type2=4" /><area shape="rect" coords="659,1842,699,1872" href="News/index.asp?m_type1=22&amp;m_type2=5" /><area shape="rect" coords="709,1845,751,1874" href="News/index.asp?m_type1=22&amp;m_type2=6" /><area shape="rect" coords="222,1882,393,2210" href="News/index.asp?m_type1=22&amp;m_type2=1" />
<area shape="rect" coords="218,245,458,325" href="News/index.asp?m_type1=4" />
<area shape="rect" coords="219,195,457,242" href="News/index.asp?m_type1=3" />
<area shape="rect" coords="219,334,460,540" href="News/index.asp?m_type1=5" /><area shape="rect" coords="233,543,271,565" href="News/index.asp?m_type1=6" />
<area shape="rect" coords="223,799,280,830" href="News/index.asp?m_type1=10" />
<area shape="rect" coords="285,801,338,829" href="News/index.asp?m_type1=11" />
<area shape="rect" coords="349,805,394,830" href="News/index.asp?m_type1=12" />
<area shape="rect" coords="408,805,454,829" href="News/index.asp?m_type1=13" />
<area shape="rect" coords="227,1013,273,1033" href="News/index.asp?m_type1=14" />
<area shape="rect" coords="289,1017,336,1036" href="News/index.asp?m_type1=15" />
<area shape="rect" coords="351,1014,393,1042" href="News/index.asp?m_type1=16" />
<area shape="rect" coords="409,1014,452,1038" href="News/index.asp?m_type1=17" />
<area shape="rect" coords="227,1220,275,1245" href="News/index.asp?m_type1=18" />
<area shape="rect" coords="286,1220,335,1246" href="News/index.asp?m_type1=19" />
<area shape="rect" coords="343,1217,394,1244" href="News/index.asp?m_type1=20" />
<area shape="rect" coords="406,1219,451,1245" href="News/index.asp?m_type1=21" />
<area shape="rect" coords="288,545,334,571" href="News/index.asp?m_type1=7" />
<area shape="rect" coords="345,545,396,573" href="News/index.asp?m_type1=8" />
<area shape="rect" coords="406,546,450,573" href="News/index.asp?m_type1=9" />
<area shape="rect" coords="484,214,1194,465" href="News/index.asp?m_type1=1" />
<area shape="rect" coords="472,472,1212,501" href="News/index.asp?m_type1=2" />
<area shape="rect" coords="466,507,1220,532" href="News/index.asp?m_type1=26" />
<area shape="rect" coords="527,549,1140,780" href="../qingtiandh_List2/index.asp" />
<area shape="rect" coords="531,832,1129,1123" href="../qingtiandh_List2/index.asp" />
<area shape="rect" coords="531,1176,1138,1319" href="../qingtiandh_List2/index.asp" />
<area shape="rect" coords="528,1376,1152,1633" href="../qingtiandh_List2/index.asp" />
<area shape="rect" coords="479,549,517,778" href="../qingtiandh_ltype1/type.asp" />
<area shape="rect" coords="480,827,519,1121" href="../qingtiandh_ltype1/type.asp" />
<area shape="rect" coords="479,1173,513,1320" href="../qingtiandh_ltype1/type.asp" />
<area shape="rect" coords="479,1376,515,1632" href="../qingtiandh_ltype1/type.asp" />
<area shape="rect" coords="230,1663,1205,1822" href="../qingtiandh_type1/type.asp" /><area shape="rect" coords="764,1844,802,1876" href="News/index.asp?m_type1=22&amp;m_type2=7" />
<area shape="rect" coords="835,1850,836,1851" href="#" /><area shape="rect" coords="818,1843,852,1875" href="News/index.asp?m_type1=22&amp;m_type2=8" />
<area shape="rect" coords="869,1844,905,1877" href="News/index.asp?m_type1=22&amp;m_type2=9" />
<area shape="rect" coords="925,1846,961,1874" href="News/index.asp?m_type1=22&amp;m_type2=10" />
<area shape="rect" coords="225,2231,376,2266" href="News/index.asp?m_type1=23" />
<area shape="rect" coords="423,2230,517,2266" href="News/index.asp?m_type1=23&amp;m_type2=1" />
<area shape="rect" coords="532,2230,608,2266" href="News/index.asp?m_type1=23&amp;m_type2=2" />
<area shape="rect" coords="628,2228,718,2267" href="News/index.asp?m_type1=23&amp;m_type2=3" />
<area shape="rect" coords="729,2225,808,2267" href="News/index.asp?m_type1=23&amp;m_type2=4" />
<area shape="rect" coords="825,2226,904,2266" href="News/index.asp?m_type1=23&amp;m_type2=5" />
<area shape="rect" coords="923,2227,1010,2263" href="News/index.asp?m_type1=23&amp;m_type2=6" />
<area shape="rect" coords="1021,2227,1107,2267" href="News/index.asp?m_type1=23&amp;m_type2=7" />
<area shape="rect" coords="226,2614,626,2821" href="News/index.asp?m_type1=24" />
<area shape="rect" coords="232,2850,1202,2925" href="News/index.asp?m_type1=28" /><area shape="rect" coords="297,1,534,26" href="News/index.asp?m_type1=30">
<area shape="rect" coords="229,2944,1209,3000" href="../qingtiandy_usersweb/index.asp" />
<area shape="rect" coords="996,2715,1211,2822" href="News/index.asp?m_type1=31&m_type2=1">
<area shape="rect" coords="985,2610,1218,2649" href="News/index.asp?m_type1=31&m_type2=2">
<area shape="rect" coords="1296,26,1426,130" href="News/index.asp?m_type1=32">
<area shape="rect" coords="222,3009,480,3044" href="News/index.asp?m_type1=33">
<area shape="rect" coords="40,377,177,555" href="News/index.asp?m_type1=34">
<area shape="rect" coords="474,790,907,822" href="News/index.asp?m_type1=35&m_type2=1">
<area shape="rect" coords="476,1140,912,1165" href="News/index.asp?m_type1=35&m_type2=2">
<area shape="rect" coords="475,1334,906,1368" href="News/index.asp?m_type1=35&m_type2=3">
<area shape="rect" coords="1219,2100,1312,2444" href="News/index.asp?m_type1=36&m_type2=">
<area shape="rect" coords="228,3292,1208,3433" href="News/index.asp?m_type1=37&m_type2=">
<area shape="rect" coords="228,3742,1209,3878" href="News/index.asp?m_type1=38&m_type2=">
<area shape="rect" coords="1082,146,1173,180" href="News/index.asp?m_type1=39&m_type2="><area shape="rect" coords="486,3012,534,3044" href="News/index.asp?m_type1=40">
<area shape="rect" coords="223,3183,478,3216" href="News/index.asp?m_type1=41"><area shape="rect" coords="932,3237,1211,3268" href="News/index.asp?m_type1=42">
<area shape="rect" coords="241,3912,525,3949" href="News/index.asp?m_type1=33">
<area shape="rect" coords="531,3911,590,3948" href="News/index.asp?m_type1=40">
</map>
</body>
</html>
