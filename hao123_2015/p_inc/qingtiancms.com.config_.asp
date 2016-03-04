<%
'Const-----------------------------------------------
'安全密码参数设置，“0,3,4,2,0”；
'作用：有人通过下载数据库或SQL注入得到了管理员的真正密码后，仍不能进入系统
'第1位	是否启用安全密码 为0时则不启用 为1时启用
'第2位	取验证码中的第几位参与运算，取1-4之间的数字
'第3位	取验证码中的第几位参与运算，取1-4之间的数字
'第4位	将取得的两位验证码作什么运算，1为加法运算；2为乘法运算
'第5位	将得到的结果插入到密码的第几位后面
'例如安全码参数设置为1，1，3，2，5  即为启用安全码，将验证码的第一位和第三位相乘的结果插入到密码的第五位后面
'如果你登陆时 产生的验证码为3568 管理员密码为TryLogin
'则你应该输入的密码为TryLo18gin
'如果开启了验证码中有随机字母，请不要使用此功能
Const G_SAFE_PASS_SET_STR = "0,1,2,2,2"
'开启静态功能
'Const G_JING_TAI=true
'是否开启播放页静态功能
'Const G_JING_TAI_PLAY=true
'是否开启下载页静态功能
'Const G_JING_TAI_DOWN=true
'播放地址
'服务器组件变量开始------------------------------------------------------------------------------------
'Scripting.FileSystemObject；
Const G_FSO = "Scripting.FileSystemObject"
'Adodb.RecordSet；
Const G_RS = "Adodb.RecordSet"
'Adodb.Connection；
Const G_CONN = "Adodb.Connection"
Const G_Comm = "cms"
Const G_Com = "com"
Dim G_XMLHTTP:G_XMLHTTP="MSXML2.XMLHTTP"
Dim Temp_G_Stream_2:Temp_G_Stream_2="stream"
Dim G_Stream:G_Stream="adodb."&Temp_G_Stream_2
'---------------------版块兼容-------------------------------------------------------------------------

'Dim-------------------------------------------------

Dim G_error_page_1
G_error_page_1=G_WEBURL&G_VIRTUAL_ROOT_DIR&""
Dim G_error_page_2
G_error_page_2=G_WEBURL&G_VIRTUAL_ROOT_DIR&"/"&G_ADMIN&"/login.asp"
Dim G_qingtiandh_m_language
G_qingtiandh_m_language=Array("国语","英语")
Dim kp_1,kp_2,kp_3
kp_1=true
kp_2=false
kp_3=true
G_music_abc="0-9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,k,u,v,w,x,y,z"
G_music_abc_array=split(G_music_abc,",")
Set N_Fso=New Class_QingTian_FSO
IF G_moban_html="" Then G_moban_html="html"

G_G_H="http://load.qtcms.net/"
G_1616_sql="1"
G_gonggao_1="1"
G_xiaxian_1="1"
G_xiaxian_1_zhuye="1"
G_xiaxian_2="2"
%>