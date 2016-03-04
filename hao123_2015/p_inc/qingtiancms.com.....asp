<%
Function MakeHTML_CMS(str)
	Dim temp_arr,Main_str,i
	Main_str=str
	Dim temp_arr2
	
	Main_str=str
	'获取内至单个标签////////////////////////////////
	temp_arr=body2s(Main_str,"{qingtiancms:","}","{$$$}",false)
	IF instr(temp_arr,"{$$$}")>0 Then
		temp_arr=left(temp_arr,instrrev(temp_arr,"{$$$}")-1)
		temp_arr_a=split(temp_arr,"{$$$}")
		For i=Lbound(temp_arr_a) To Ubound(temp_arr_a)
			str=replace(str,temp_arr_a(i),GetRp(GetHTML_CMS_1_1(temp_arr_a(i))))	
		Next
	End IF
	'获取分类标签	
	
	'获取大循环标签
	Set soojs3 = New Regexp
	soojs3.IgnoreCase = True
	soojs3.Global = True
	soojs3.Pattern ="{-qt_Loop:(\n|.)*?{/-qt_Loop}"	
	Set Matches =soojs3.Execute(Main_str)
	set  soojs3=nothing 
	temp_arr3=""
	For Each Match in Matches
		temp_arr3=temp_arr3&Match.Value&"{$$$}" '循环匹配
	Next
	IF instr(temp_arr3,"{$$$}")>0 Then
		temp_arr3=left(temp_arr3,instrrev(temp_arr3,"{$$$}")-1)
		temp_arr_c=split(temp_arr3,"{$$$}")	
		For i=Lbound(temp_arr_c) To Ubound(temp_arr_c)
			str=replace(str,temp_arr_c(i),GetHTML_CMS_3(temp_arr_c(i)))
		Next 
	End IF
	Main_str=str	
	
	'获取内至循环标签/////////////////////////////////		
	Set soojs = New Regexp
	soojs.IgnoreCase = True
	soojs.Global = True
	soojs.Pattern ="{qt_Loop:(\n|.)*?{/qt_Loop}"	
	Set Matches =soojs.Execute(Main_str)
	set  soojs=nothing 
	temp_arr2=""
	For Each Match in Matches
		temp_arr2=temp_arr2&Match.Value&"{$$$}" '循环匹配
	Next

	IF instr(temp_arr2,"{$$$}")>0 Then
		temp_arr2=left(temp_arr2,instrrev(temp_arr2,"{$$$}")-1)
		temp_arr_b=split(temp_arr2,"{$$$}")	
		For i=Lbound(temp_arr_b) To Ubound(temp_arr_b)
		
			str=replace(str,temp_arr_b(i),GetHTML_CMS_2(temp_arr_b(i)))
		Next 
	End IF
	
	
	'获取内至单个标签////////////////////////////////
	temp_arr=body2s(Main_str,"{qt:","}","{$$$}",false)
	IF instr(temp_arr,"{$$$}")>0 Then
		temp_arr=left(temp_arr,instrrev(temp_arr,"{$$$}")-1)
		temp_arr_a=split(temp_arr,"{$$$}")
		For i=Lbound(temp_arr_a) To Ubound(temp_arr_a)
			str=replace(str,temp_arr_a(i),GetRp(GetHTML_CMS_1(temp_arr_a(i))))	
		Next
	End IF
	'获取分类标签
	

	
	str=GetParseIf(str)
	IF Instr(str,"<!--代码压缩-->")>0 Then
		Set Ree=new RegExp 
		Ree.IgnoreCase =True 
		Ree.Global=True	
		Ree.Pattern="(" & Chr(8) & "|" & Chr(9) & "|" & Chr(10) & "|" & Chr(13) & ")"
		str=Ree.Replace(str,"")	
	End IF
	
	MakeHTML_CMS=str
End Function

Function GetHTML_CMS_1_1(valu)
	Select Case valu
		Case "{qingtiancms:G_qTcms_Com_16_right_mz}"
			GetHTML_CMS_1_1=G_qTcms_Com_16_right_mz	
		Case Else
	End Select
End Function

Function GetHTML_CMS_1(valu)
	Dim u1
	IF instr(valu,"ListUrl1")>0 Then
		u1=GetContent(valu,"{qt:ListUrl1","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=url_(array("l1",Trim(u1),"1"))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	
	IF instr(valu,"#")>0 Then
		u1=GetContent(valu,"{qt:#","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=GetUrl_httpAll(Trim(u1))
		Else
			GetHTML_CMS_1="#"
		End IF
		Exit Function
	End IF			
	
	IF instr(valu,"ListUrl2")>0 Then
		u1=GetContent(valu,"{qt:ListUrl2","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=url_(array("l2",Trim(u1),"1"))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	
	IF instr(valu,"ListName1")>0 Then
		u1=GetContent(valu,"{qt:ListName1","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type1_name(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	IF instr(valu,"ListlName1")>0 Then
		u1=GetContent(valu,"{qt:ListlName1","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_typel1_name(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	IF instr(valu,"ListContent1")>0 Then
		u1=GetContent(valu,"{qt:ListContent1","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type1_Content(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	IF instr(valu,"ListContent3")>0 Then
		u1=GetContent(valu,"{qt:ListContent3","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type3_Content(Trim(u1))
		Else
			GetHTML_CMS_1=""
		End IF
		Exit Function
	End IF		
	IF instr(valu,"ListContenttop3")>0 Then
		u1=GetContent(valu,"{qt:ListContenttop3","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type3_Content_top(Trim(u1))
		Else
			GetHTML_CMS_1=""
		End IF
		Exit Function
	End IF		
	IF instr(valu,"ListTitle1")>0 Then
		u1=GetContent(valu,"{qt:ListTitle1","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type1_title(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	IF instr(valu,"Listtypedes1")>0 Then
		u1=GetContent(valu,"{qt:Listtypedes1","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type1_typedes(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF				
	IF instr(valu,"ListName2")>0 Then
		u1=GetContent(valu,"{qt:ListName2","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type2_name(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF	
	IF instr(valu,"ListContent2")>0 Then
		u1=GetContent(valu,"{qt:ListContent2","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type2_Content(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF		
	IF instr(valu,"ListTitle2")>0 Then
		u1=GetContent(valu,"{qt:ListTitle2","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type2_title(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF		
	IF instr(valu,"Listtypedes2")>0 Then
		u1=GetContent(valu,"{qt:Listtypedes2","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type2_typedes(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF						
	IF instr(valu,"ListName3")>0 Then
		u1=GetContent(valu,"{qt:ListName3","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_type3_name(Trim(u1))
		Else
			GetHTML_CMS_1="其他"
		End IF
		Exit Function
	End IF

	IF instr(valu,"SkinH")>0 Then
		u1=GetContent(valu,"{qt:SkinH","}",0)
		IF u1<>"" Then
			IF u1<>G_moban Then
				u111=Get_pifu_q(Trim(u1))
				IF u111<>G_moban_2 Then
					GetHTML_CMS_1=Add_Root_Dir(u111&G_JIN_TAI_IndexPage)
				Else
					GetHTML_CMS_1=Add_Root_Dir(G_JIN_TAI_IndexPage)
				End IF
			Else
				GetHTML_CMS_1=Add_Root_Dir(G_JIN_TAI_IndexPage)
				
			End IF
		Else
			GetHTML_CMS_1=""
		End IF
		Exit Function
	End IF
		
	IF instr(valu,"pageone")>0 Then
		u1=GetContent(valu,"{qt:pageone","}",0)
		IF u1<>"" Then
			u1=Replace(u1,"$","qin"&"gtia"&"n"&G_Comm)
			GetHTML_CMS_1=url_(Array("one",u1))
		Else
			GetHTML_CMS_1="/"
		End IF
		Exit Function
	End IF		

	IF instr(valu,"pages")>0 Then
		u1=GetContent(valu,"{qt:pages","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=url_(Array("pages",u1))
		Else
			GetHTML_CMS_1="/"
		End IF
		Exit Function
	End IF

	IF instr(valu,"pagemore")>0 Then
		u1=GetContent(valu,"{qt:pagemore","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=url_(Array("more",u1))
		Else
			GetHTML_CMS_1="/"
		End IF
		Exit Function
	End IF	

	IF instr(valu,"listnewsname")>0 Then
	
		u1=Trim(GetContent(valu,"{qt:listnewsname","}",0))
		IF u1<>"" And u1<>"0" Then
			GetHTML_CMS_1=Get_newstype1_name(Trim(u1))
		Else
			
			GetHTML_CMS_1="新闻列表"
		End IF
		Exit Function
		
		
	End IF

	IF instr(valu,"detailnewsname")>0 Then
		u1=GetContent(valu,"{qt:detailnewsname","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_newsm_name(Trim(u1))
		Else
			GetHTML_CMS_1="新闻"
		End IF
		Exit Function
	End IF	

	IF instr(valu,"ListNewsUrl")>0 Then
		Set re = New RegExp
		re.Pattern ="{qt:ListNewsUrl\s*(\d+)(.*)}"
		re.IgnoreCase = True
		re.Global=True
		ku = re.Replace(valu, "$1")
		GetHTML_CMS_1=url_(array("newsall",ku,""))
		Exit Function
	End IF


	IF instr(valu,"listproductname")>0 Then
	
		u1=Trim(GetContent(valu,"{qt:listproductname","}",0))
		IF u1<>"" And u1<>"0" Then
			GetHTML_CMS_1=Get_producttype1_name(Trim(u1))
		Else
			
			GetHTML_CMS_1="产品列表"
		End IF
		Exit Function
		
		
	End IF

	IF instr(valu,"detailproductname")>0 Then
		u1=GetContent(valu,"{qt:detailproductname","}",0)
		IF u1<>"" Then
			GetHTML_CMS_1=Get_productm_name(Trim(u1))
		Else
			GetHTML_CMS_1="产品"
		End IF
		Exit Function
	End IF	

	IF instr(valu,"ListproductUrl")>0 Then
		Set re = New RegExp
		re.Pattern ="{qt:ListproductUrl\s*(\d+)(.*)}"
		re.IgnoreCase = True
		re.Global=True
		ku = re.Replace(valu, "$1")
		GetHTML_CMS_1=url_(array("newsall",ku,""))
		Exit Function
	End IF


								
	Select Case valu
	Case "{qt:G_WEBNAME} - {qt:G_WEBURL}"
		GetHTML_CMS_1=G_WEBTITLE	
	Case "{qt:G_WEBNAME}"
		GetHTML_CMS_1=G_WEBNAME
	Case "{qt:G_WEBURL_2}"
		GetHTML_CMS_1=G_WEBURL_2
	Case "{qt:G_WEBURL}"
		GetHTML_CMS_1=G_WEBURL	
	Case "{qt:G_WEBTITLE}"
		GetHTML_CMS_1=G_WEBTITLE					
	Case "{qt:G_DIE}"
		GetHTML_CMS_1=G_DIE
	Case "{qt:G_KEY}"
		GetHTML_CMS_1=G_KEY	
	Case "{qt:G_HTML}"
		GetHTML_CMS_1=G_HTML
	Case "{qt:G_BEIAN}"
		GetHTML_CMS_1=G_BEIAN
	Case "{qt:G_EMAIL}"
		GetHTML_CMS_1=G_EMAIL
	Case "{qt:G_QQ}"
		GetHTML_CMS_1=G_QQ	
	Case "{qt:G_Ip}"
		GetHTML_CMS_1=getIP()					
	Case "{qt:kword}"
		GetHTML_CMS_1=qt_kword	
	Case "{qt:G_moban}"
		GetHTML_CMS_1=G_moban	
	Case "{qt:G_JIN_TAI_PageOne}"
		IF G_JIN_TAI_PageOne="" Then G_JIN_TAI_PageOne=G_moban
		IF G_jingtai_wenjian_mulu="" Then
			GetHTML_CMS_1=Session("Page_skinsa")&G_JIN_TAI_PageOne	
		Else
			GetHTML_CMS_1=G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne	
		End IF		
	Case "{qt:G_lm_baidu}"
		IF G_lm_baidu="" Then G_lm_baidu="wjlhkp_pg"
		GetHTML_CMS_1=G_lm_baidu	
	Case "{qt:G_lm_taobao}"
		IF G_lm_taobao="" Then G_lm_taobao="mm_17185721_0_0"
		GetHTML_CMS_1="pid="&G_lm_taobao&"&unid=061843020701&commend=all&search_type=auction&user_action=initiative&f=D9_5_1&at_topsearch=1&sort=&spercent=0"
	Case "{qt:G_lm_taobao2}"
		IF G_lm_taobao="" Then G_lm_taobao="mm_17185721_0_0"
		GetHTML_CMS_1=G_lm_taobao	
	Case "{qt:G_lm_taobao3}"
		IF G_lm_taobao="" Then G_lm_taobao="mm_17185721_0_0"
		G_lm_taobao_a=Split(G_lm_taobao,"_")
		GetHTML_CMS_1=G_lm_taobao_a(1)
	Case "{qt:G_lm_taobao4}"
		GetHTML_CMS_1=G_lm_taobao						
	Case "{qt:G_lm_xunlei}"
		IF G_lm_xunlei="" Then G_lm_xunlei="20116"
		GetHTML_CMS_1=G_lm_xunlei	
	Case "{qt:G_lm_google_s}"
		IF G_lm_google_s="" Then G_lm_google_s="partner-pub-0520467129961361:mibs8b9cu7d"
		IF G_lm_google_s="baidu" Then 
			G_lm_google_s="baidu"
		Else
			IF Instr(G_lm_google_s,":")=0 Then G_lm_google_s="partner-pub-0520467129961361:mibs8b9cu7d"
		End IF
		GetHTML_CMS_1=G_lm_google_s		
	Case "{qt:G_lm_sogou_s}"
		IF G_lm_sogou_s="" Then G_lm_sogou_s=""
		GetHTML_CMS_1=G_lm_sogou_s	
	Case "{qt:G_lm_dangdang_s}"
		IF G_lm_dangdang_s="" Then G_lm_dangdang_s="P-276318"
		GetHTML_CMS_1=G_lm_dangdang_s	
	Case "{qt:G_lm_500wan_s}"
		IF G_lm_500wan_s="" Then G_lm_500wan_s="2650"
		GetHTML_CMS_1=G_lm_500wan_s		
	Case "{qt:G_lm_amazon_s}"
		IF G_lm_amazon_s="" Then G_lm_amazon_s="wjlhkp-23"
		GetHTML_CMS_1=G_lm_amazon_s	
	Case "{qt:G_redbaby_s}"
		IF G_redbaby_s="" Then G_redbaby_s="57357"
		GetHTML_CMS_1=G_redbaby_s	
	Case "{qt:G_lm_soso}"
		IF G_lm_soso="" Then G_lm_soso="0"
		GetHTML_CMS_1=G_lm_soso			
	Case "{qt:IshomePage_js}"
		GetHTML_CMS_1="<script type=""text/javascript"">var QtCmssetN=0;</script>"	
	Case "{qt:IshomePage_func}"
		GetHTML_CMS_1=" onclick=""this.style.behavior='url(#default#homepage)';if(!(this.isHomePage('"&G_WEBURL&"'))&amp;&amp;QtCmssetN!=1){this.sethomepage('"&G_WEBURL&"');QtCmssetN=1;}"""	
	Case "{qt:G_lm_360buy}"
		IF G_lm_360buy="" Then G_lm_360buy="1122"
		GetHTML_CMS_1=G_lm_360buy	
	Case "{qt:HomePage}"
		GetHTML_CMS_1=url_(array("home",""))	
	Case "{qt:G_u_Cookies}"
		GetHTML_CMS_1=G_u_Cookies	
	Case "{qt:G_All_moshi}"
		GetHTML_CMS_1=G_All_moshi	
	Case "{qt:G_qTcms_Com_16_Time}"
		GetHTML_CMS_1=G_qTcms_Com_16_Time	
	Case "{qt:G_qTcms_Com_16_City}"
		GetHTML_CMS_1=G_qTcms_Com_16_City		
	Case "{qt:G_lm_youdao}"
		GetHTML_CMS_1=G_lm_youdao	
	Case "{qt:G_jifen_jifen_name}"
		GetHTML_CMS_1=G_jifen_jifen_name	
	Case "{qt:G_lm_baidu_ch}"
		GetHTML_CMS_1=G_lm_baidu_ch		
	Case "{qt:newsall}"
		GetHTML_CMS_1=url_(array("newsall","0","1"))	
	Case "{qt:sysTime}"
		GetHTML_CMS_1=DateDiff("s","1970-01-01 08:00:00",now())		
	Case "{qt:HomePage}"
		GetHTML_CMS_1=Add_Root_Dir("/")	
	Case "{qt:Uccenter}"	
		GetHTML_CMS_1=""&G_Uc_tongbu&""	
	Case "{qt:G_jinbi_kaifang}"
		GetHTML_CMS_1=G_jinbi_kaifang	
	Case "{qt:G_U_yiqifa_u}"
		GetHTML_CMS_1=G_U_yiqifa_u	
	Case "{qt:G_U_yiqifa_id}"
		IF G_U_yiqifa_id="" Then G_U_yiqifa_id=161989
		GetHTML_CMS_1=G_U_yiqifa_id		
	Case "{qt:G_lm_sina_weibo}"
		GetHTML_CMS_1=G_lm_sina_weibo	
	Case "{qt:G_qTcms_Com_16_Pifu}"
		GetHTML_CMS_1=G_qTcms_Com_16_Pifu	
	Case "{qt:G_qTcms_Com_16_qq}"
		GetHTML_CMS_1=G_qTcms_Com_16_qq	
	Case "{qt:G_qTcms_Com_16_yq}"
		GetHTML_CMS_1=G_qTcms_Com_16_yq	
	Case "{qt:G_qTcms_Com_16_sosuo_q}"
		
		GetHTML_CMS_1=G_qTcms_Com_16_sosuo_q
	Case "{qt:G_qTcms_Com_16_mkuai}"
		GetHTML_CMS_1=G_qTcms_Com_16_mkuai	
	Case "{qt:G_qTcms_Com_16_qingtiancms_b_b1}"
		GetHTML_CMS_1=G_qTcms_Com_16_qingtiancms_b_b1
	Case "{qt:G_qTcms_Com_16_qingtiancms_b_b2}"
		GetHTML_CMS_1=G_qTcms_Com_16_qingtiancms_b_b2	
	Case "{qt:G_qTcms_Com_16_qingtiancms_b_b3}"
		GetHTML_CMS_1=G_qTcms_Com_16_qingtiancms_b_b3		
	Case "{qt:G_qTcms_Com_16_qingtiancms_b_c1}"
		GetHTML_CMS_1=G_qTcms_Com_16_qingtiancms_b_c1
	Case "{qt:G_qTcms_Com_16_qingtiancms_b_c2}"
		GetHTML_CMS_1=G_qTcms_Com_16_qingtiancms_b_c2																																					
	Case Else
		GetHTML_CMS_1=valu
	End Select
End Function

Function GetHTML_CMS_2(valu)
	Dim v1,v2,v3,v4
	Dim v3_a,v3_1,v3_2,v3_3,sql,sql_order,v3_2_1,v3_2_a,vvv4,vvv4_1,vvv4_2,vvv4_a
	Dim u1,s1,s2,w1,w3,w4,w5,w6
	Dim g_str
	g_str="*"
	IF Instr(valu,"{/qt_Loop}")=0  Then
		GetHTML_CMS_2=""
		Exit Function
	End IF	
	'{qt_Loop:MovieList 1,0,0,4[,1,4]}
	v1=GetContent(valu,"{qt_Loop:","}",1)
	v2=GetContent(v1,"{qt_Loop:"," ",0) '类别
	u1=replace(replace(valu,v1,""),"{/qt_Loop}","")
	Select Case v2
	
	Case "List19"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") 
		IF Instr(v3,",")>0 Then	
			v3_a=split(v3,",")
			v3_0=v3_a(0) '1表示编号排行 2表示按a-z排序,3表示按z-a排序
			v3_1=v3_a(1) '表示一级类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '显示个数
			v3_3=0		'二级类别
			IF Ubound(v3_a)=3 Then
				v3_3=v3_a(3)
			End IF
			s1=0
			s2=""
			IF v3_2="0" Then
				sql="select  "&g_str&" from qtcms_com_19 where n_look=1 "
			Else
				IF Instr(v3_2,"|")=0 Then
					vvv4_1=v3_2
					vvv4_2=0
				Else
					vvv4_a=split(v3_2,"|")
					vvv4_1=vvv4_a(0)'实际个数
					vvv4_2=vvv4_a(1)'过滤个数
				End IF
				sql="select top $vvv4_1$ $g_str$  from qtcms_com_19 where n_look=1 "
			End IF	
			
			IF instr(v3_1,"|")>0 Then
				v3_2_a=split(v3_1,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_1<>"0" Then
					sql=sql&" and n_type1="&v3_1
				End IF
			End IF			
			
			
			IF instr(v3_3,"|")>0 Then
				v3_2_a=split(v3_3,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type2="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type2="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type2="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_3<>"0" Then
					sql=sql&" and n_type2="&v3_3
				End IF
			End IF				
			
			
			IF v3_0=1 Then
				sql_order=" order by n_numb desc,id desc"
			Else 
				sql_order=" order by id desc"
			End IF			
			IF Instr(v3_2,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qtcms_com_19 where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$",g_str)
				sql=sql&sql_order
			End IF	
			
			GetHTML_CMS_2=Get_List19(sql,u1)						
		End IF
			
	Case "List"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示编号排行 2表示按a-z排序,3表示按z-a排序
			v3_0=v3_a(1) '表示一级类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '表示二级类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_3=v3_a(3) '表示三级类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_4=v3_a(4) '显示个数
			IF Ubound(v3_a)=5 Then
				s2=v3_a(4) '关键词
				sql="select  "&g_str&" from qingtiandh_List where m_look=1 "
			ElseIF Ubound(v3_a)=6 Then
				s2=v3_a(4) '关键词
				sql="select  "&g_str&" from qingtiandh_List where m_look=1 "			
				w3=v3_a(5)					
			Else
				s1=0
				s2=""
				IF v3_4="0" Then
					sql="select  "&g_str&" from qingtiandh_List where m_look=1 "
				Else
					IF Instr(v3_4,"|")=0 Then
						vvv4_1=v3_4
						vvv4_2=0
					Else
						vvv4_a=split(v3_4,"|")
						vvv4_1=vvv4_a(0)'实际个数
						vvv4_2=vvv4_a(1)'过滤个数
					End IF
					sql="select top $vvv4_1$ $g_str$  from qingtiandh_List where m_look=1 "
				End IF
			End IF
			
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (m_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or m_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or m_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and m_type1="&v3_0
				End IF
			End IF
			
			IF instr(v3_2,"|")>0 Then
				v3_2_a=split(v3_2,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (m_type2="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or m_type2="&v3_2_a(i)&") "
					Else
						sql=sql&" or m_type2="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_2<>"0" Then
					sql=sql&" and m_type2="&v3_2
				End IF
			End IF	
			
			IF instr(v3_3,"|")>0 Then
				v3_3_a=split(v3_3,"|")
				For i=Lbound(v3_3_a) To Ubound(v3_3_a)
					IF i=0 Then
						sql=sql&" and (m_type3="&v3_3_a(i)
					ElseIF i=Ubound(v3_3_a) Then
						sql=sql&" or m_type3="&v3_3_a(i)&") "
					Else
						sql=sql&" or m_type3="&v3_3_a(i)
					End IF
				Next
			Else
				IF v3_3<>"0" Then
					sql=sql&" and m_type3="&v3_3
				End IF
			End IF					
			
			s2=Trim(replace(s2,"'",""))
			IF s2<>""  Then sql=sql&" and (m_name like'%"&s2&"%') "			
								
			IF v3_1=1 Then
				sql_order=" order by m_no desc,id desc"
			ElseIF v3_1=2 Then 	
				sql_order=" order by m_name asc,id desc"
			ElseIF v3_1=3 Then 	
				sql_order=" order by m_name desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_4,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandh_List where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$",g_str)
				sql=sql&sql_order
			End IF	
			
			GetHTML_CMS_2=Get_sql_n1(sql,u1)
		Else	
			GetHTML_CMS_2=Get_sql_n1(v3,u1)
		End IF		
	Case "type2" 
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_0=v3_a(0) '菜单个数，0表示按照默认的递增的排序方式，可以是1|2|3|4
			v3_1=v3_a(1) '菜单个数，前者优先
			v3_2=v3_a(2) '菜单的字数
			v3_3=v3_a(3) '大类ID
			v3_4=""		'一级类别名称
			IF Ubound(v3_a)=4 Then
				v3_4=v3_a(4) '一级类别id
			End IF	
			IF v3_4<>"" Then
				sql="select top "&v3_1&" * from  qingtiandh_type2 where typehide=1 And typeid1="&v3_3
				Set oRss=Conn.Execute("Select Typeid From qingtiandh_type1 where typehttpurl like '%"&v3_4&"%'")
				IF Not oRss.Eof Then
					v3_4=oRss(0)
					sql="select top "&v3_1&" * from  qingtiandh_type2 where typehide=1 And typeid1="&v3_4
				End IF
				oRss.close
			Else		
				sql="select top "&v3_1&" * from  qingtiandh_type2 where typehide=1 And typeid1="&v3_3
			End IF
			
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (typeid="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or typeid="&v3_2_a(i)&") "
					Else
						sql=sql&" or typeid="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and typeid="&v3_0
				End IF
			End IF
			sql=sql&" order by typeno asc,typeid desc"

			GetHTML_CMS_2=Get_menu_type2(sql,u1,v3_2)
		End IF	
	Case "type2_1" 
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_0=v3_a(0) '菜单个数，0表示按照默认的递增的排序方式，可以是1|2|3|4
			v3_1=v3_a(1) '菜单个数，前者优先
			v3_2=v3_a(2) '菜单的字数
			v3_3=v3_a(3) '大类ID
			sql="select top "&v3_1&" * from  qingtiandh_type2 where  typeid1="&v3_3
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (typeid="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or typeid="&v3_2_a(i)&") "
					Else
						sql=sql&" or typeid="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and typeid="&v3_0
				End IF
			End IF
			sql=sql&" order by typeno asc,typeid desc"
			GetHTML_CMS_2=Get_menu_type2(sql,u1,v3_2)
		End IF		
	Case "type3" 
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_0=v3_a(0) '菜单个数，0表示按照默认的递增的排序方式，可以是1|2|3|4
			v3_1=v3_a(1) '菜单个数，前者优先
			v3_2=v3_a(2) '菜单的字数
			v3_3=v3_a(3) '二类ID
			sql="select top "&v3_1&" * from  qingtiandh_type3 where typehide=1 And typeid2="&v3_3
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (typeid="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or typeid="&v3_2_a(i)&") "
					Else
						sql=sql&" or typeid="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and typeid="&v3_0
				End IF
			End IF
			sql=sql&" order by typeno asc,typeid desc"
			GetHTML_CMS_2=Get_menu_type3(sql,u1,v3_2)
		End IF	
	Case "search" 
		v3=GetContent(v1," ","}",0)		
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_0=v3_a(0) '输出个数
			v3_1=v3_a(1) 'sql语句
			v3_1=Replace(v3_1,"@",",")
			
			GetHTML_CMS_2=Get_sql_n1(v3_1,u1)
		End IF	
	Case "WebList"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示编号排行 2表示按a-z排序,3表示按z-a排序
			v3_0=v3_a(1) '表示一级类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '待定
			v3_3=v3_a(3) '待定
			v3_4=v3_a(4) '显示个数

			s1=0
			s2=""
			IF v3_4="0" Then
				sql="select  "&g_str&" from qingtiandy_url where w_status=1 ANd w_look=1 "
			Else
				IF Instr(v3_4,"|")=0 Then
					vvv4_1=v3_4
					vvv4_2=0
				Else
					vvv4_a=split(v3_4,"|")
					vvv4_1=vvv4_a(0)'实际个数
					vvv4_2=vvv4_a(1)'过滤个数
				End IF
				sql="select top $vvv4_1$ $g_str$  from qingtiandy_url where w_status=1 ANd w_look=1 "
			End IF

			
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (w_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or w_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or w_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and w_type1="&v3_0
				End IF
			End IF
			
			IF instr(v3_2,"|")>0 Then
				v3_2_a=split(v3_2,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (m_type2="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or m_type2="&v3_2_a(i)&") "
					Else
						sql=sql&" or m_type2="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_2<>"0" Then
					sql=sql&" and m_type2="&v3_2
				End IF
			End IF	
			
								
			IF v3_1=1 Then
				sql_order=" order by w_no desc,inj desc,outj desc,id asc"
			ElseIF v3_1=2 Then 	
				sql_order=" order by indate desc,inj desc,outj desc,id asc"
			ElseIF v3_1=3 Then 	
				sql_order=" order by inj desc,outj desc,id asc"	
			ElseIF v3_1=4 Then 	
				sql_order=" order by inc desc,inj desc,id asc"										
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_4,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandy_url where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$",g_str)
				sql=sql&sql_order
			End IF	
			GetHTML_CMS_2=Get_sql_n1Web(sql,u1)
		Else	
			GetHTML_CMS_2=Get_sql_n1Web(v3,u1)
		End IF			
	Case "ListNew"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示编号排行 2表示按a-z排序,3表示按z-a排序
			v3_0=v3_a(1) '表示一级类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_4=v3_a(2) '显示个数
			
			s1=0
			s2=""
			IF v3_4="0" Then
				sql="select  "&g_str&" from qingtiandh_List2 where m_look=1 "
			Else
				IF Instr(v3_4,"|")=0 Then
					vvv4_1=v3_4
					vvv4_2=0
				Else
					vvv4_a=split(v3_4,"|")
					vvv4_1=vvv4_a(0)'实际个数
					vvv4_2=vvv4_a(1)'过滤个数
				End IF
				sql="select top $vvv4_1$ $g_str$  from qingtiandh_List2 where m_look=1 "
			End IF
			
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (m_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or m_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or m_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and m_type1="&v3_0
				End IF
			End IF
						
			
			s2=Trim(replace(s2,"'",""))
			IF s2<>""  Then sql=sql&" and (m_name like'%"&s2&"%') "			
								
			IF v3_1=1 Then
				sql_order=" order by m_no desc,id desc"
			ElseIF v3_1=2 Then 	
				sql_order=" order by m_name asc,id desc"
			ElseIF v3_1=3 Then 	
				sql_order=" order by m_name desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_4,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandh_List2 where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$",g_str)
				sql=sql&sql_order
			End IF	
			GetHTML_CMS_2=Get_sql_n1_ListNew(sql,u1)
		Else	
			GetHTML_CMS_2=Get_sql_n1_ListNew(v3,u1)
		End IF	
	Case "NewsList"
		Timerx "NewsList_start",""
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示时间排行，3表示点击排行，0表示ID排行, 4表示推荐排行,5标示汉字A~z排序,6:z~a
			v3_0=v3_a(1) '表示类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '表示地区,0表示全部，其他直接用汉字
			v3_3=v3_a(3) '表示显示的数目
						  '当前第几页
						  '关键词
						  '主演
						  '导演
						  '星级
						  '二级分类
			IF Ubound(v3_a)=5 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_News where n_look=1 "
			ElseIF Ubound(v3_a)=6 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_News where n_look=1 "			
				w3=v3_a(6)									
			Else
				s1=0
				s2=""
				IF v3_3="0" Then
					sql="select  * from qingtiandy_News where n_look=1 "
				Else
					IF Instr(v3_3,"|")=0 Then
						vvv4_1=v3_3
						vvv4_2=0
					Else
						vvv4_a=split(v3_3,"|")
						vvv4_1=vvv4_a(0)'实际个数
						vvv4_2=vvv4_a(1)'过滤个数
					End IF
					sql="select top $vvv4_1$ $g_str$  from qingtiandy_News where n_look=1 "
				End IF
			End IF
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0"  Then
					sql=sql&" and n_type1="&v3_0
				End IF
			End IF
			
			v3_2=Trim(replace(v3_2,"'",""))
								
			s2=Trim(replace(s2,"'",""))
			IF s2<>""  Then sql=sql&" and (n_title like'%"&s2&"%') "	
			w3=Trim(replace(w3,",",""))
			'IF w3<>""  Then sql=sql&" and m_star like'%"&w3&"%'"
					
			IF v3_1=1 Then
				sql_order=" order by n_date desc,id desc"
			ElseIF v3_1=3 Then
				sql_order=" order by n_hits desc,n_date desc,id desc"
			ElseIF v3_1=4 Then
				sql_order=" order by n_numb desc,n_date desc,id desc"
			ElseIF v3_1=5 Then 	
				sql_order=" order by n_title,id desc"
			ElseIF v3_1=6 Then 	
				sql_order=" order by n_title desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_3,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandy_News where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$","*")
				sql=sql&sql_order
			End IF	
			
			IF Ubound(v3_a)>=5 Then
				GetHTML_CMS_2=Get_sql_n1_News_html(sql,u1,s1,s2,v3_3)
			Else
				GetHTML_CMS_2=Get_sql_n1_new(sql,u1,s1,s2)
			End IF
		End IF		
		Timerx "NewsList_end",""
		
	Case "GgList"
		
		Timerx "GgList_start",""
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示时间排行，3表示点击排行，0表示ID排行, 4表示推荐排行,5标示汉字A~z排序,6:z~a
			v3_0=v3_a(1) '表示类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '表示地区,0表示全部，其他直接用汉字
			v3_3=v3_a(3) '表示显示的数目
						  '当前第几页
						  '关键词
						  '主演
						  '导演
						  '星级
						  '二级分类
			IF Ubound(v3_a)=5 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_gonggao where n_look=1 "
			ElseIF Ubound(v3_a)=6 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_gonggao where n_look=1 "			
				w3=v3_a(6)									
			Else
				s1=0
				s2=""
				IF v3_3="0" Then
					sql="select  * from qingtiandy_gonggao where n_look=1 "
				Else
					IF Instr(v3_3,"|")=0 Then
						vvv4_1=v3_3
						vvv4_2=0
					Else
						vvv4_a=split(v3_3,"|")
						vvv4_1=vvv4_a(0)'实际个数
						vvv4_2=vvv4_a(1)'过滤个数
					End IF
					sql="select top $vvv4_1$ $g_str$  from qingtiandy_gonggao where n_look=1 "
				End IF
			End IF
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0"  Then
					sql=sql&" and n_type1="&v3_0
				End IF
			End IF
			
			v3_2=Trim(replace(v3_2,"'",""))
								
			s2=Trim(replace(s2,"'",""))
			IF s2<>""  Then sql=sql&" and (n_title like'%"&s2&"%') "	
			w3=Trim(replace(w3,",",""))
			'IF w3<>""  Then sql=sql&" and m_star like'%"&w3&"%'"
					
			IF v3_1=1 Then
				sql_order=" order by n_date desc,id desc"
			ElseIF v3_1=3 Then
				sql_order=" order by n_hits desc,n_date desc,id desc"
			ElseIF v3_1=4 Then
				sql_order=" order by n_numb desc,n_date desc,id desc"
			ElseIF v3_1=5 Then 	
				sql_order=" order by n_title,id desc"
			ElseIF v3_1=6 Then 	
				sql_order=" order by n_title desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_3,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandy_gonggao where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$","*")
				sql=sql&sql_order
			End IF	
			
			
			
			IF Ubound(v3_a)>=5 Then
				GetHTML_CMS_2=Get_sql_n1_News_html(sql,u1,s1,s2,v3_3)
			Else
				GetHTML_CMS_2=Get_sql_n1_Gg(sql,u1,s1,s2)
			End IF
		End IF		
		Timerx "NewsList_end",""			
	Case "NewList"
		Timerx "NewsList_start",""
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		vtable=qtcmsdh.J1616_m("16","1","","","","","","","","")
		
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示时间排行，3表示点击排行，0表示ID排行, 4表示推荐排行,5标示汉字A~z排序,6:z~a
			v3_0=v3_a(1) '表示类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '表示地区,0表示全部，其他直接用汉字
			v3_3=v3_a(3) '表示显示的数目
						  '当前第几页
						  '关键词
						  '主演
						  '导演
						  '星级
						  '二级分类
			IF Ubound(v3_a)=5 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from "&vtable&" where n_look=1 "
			ElseIF Ubound(v3_a)=6 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from "&vtable&" where n_look=1 "			
				w3=v3_a(6)									
			Else
				s1=0
				s2=""
				IF v3_3="0" Then
					sql="select  * from "&vtable&" where n_look=1 "
				Else
					IF Instr(v3_3,"|")=0 Then
						vvv4_1=v3_3
						vvv4_2=0
					Else
						vvv4_a=split(v3_3,"|")
						vvv4_1=vvv4_a(0)'实际个数
						vvv4_2=vvv4_a(1)'过滤个数
					End IF
					sql="select top $vvv4_1$ $g_str$  from "&vtable&" where n_look=1 "
				End IF
			End IF
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0"  Then
					sql=sql&" and n_type1="&v3_0
				End IF
			End IF
			
			v3_2=Trim(replace(v3_2,"'",""))
								
			s2=Trim(replace(s2,"'",""))
			IF s2<>""  Then sql=sql&" and (n_title like'%"&s2&"%') "	
			w3=Trim(replace(w3,",",""))
			'IF w3<>""  Then sql=sql&" and m_star like'%"&w3&"%'"
					
			IF v3_1=1 Then
				sql_order=" order by n_date desc,id desc"
			ElseIF v3_1=3 Then
				sql_order=" order by n_hits desc,n_date desc,id desc"
			ElseIF v3_1=4 Then
				sql_order=" order by n_numb desc,n_date desc,id desc"
			ElseIF v3_1=5 Then 	
				sql_order=" order by n_title,id desc"
			ElseIF v3_1=6 Then 	
				sql_order=" order by n_title desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_3,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from "&vtable&" where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$","*")
				sql=sql&sql_order
			End IF	
			
			IF Ubound(v3_a)>=5 Then
				GetHTML_CMS_2=Get_sql_n1_News_html(sql,u1,s1,s2,v3_3)
			Else
				GetHTML_CMS_2=Get_sql_n1_new(sql,u1,s1,s2)
			End IF
		End IF		
		Timerx "NewsList_end",""			
	Case "ProductList"
		Timerx "ProductList_start",""
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示时间排行，3表示点击排行，0表示ID排行, 4表示推荐排行,5标示汉字A~z排序,6:z~a
			v3_0=v3_a(1) '表示类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '表示地区,0表示全部，其他直接用汉字
			v3_3=v3_a(3) '表示显示的数目
						  '当前第几页
						  '关键词
						  '主演
						  '导演
						  '星级
						  '二级分类
			IF Ubound(v3_a)=5 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_Product where n_look=1 "
			ElseIF Ubound(v3_a)=6 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_Product where n_look=1 "			
				w3=v3_a(6)									
			Else
				s1=0
				s2=""
				IF v3_3="0" Then
					sql="select  * from qingtiandy_Product where n_look=1 "
				Else
					IF Instr(v3_3,"|")=0 Then
						vvv4_1=v3_3
						vvv4_2=0
					Else
						vvv4_a=split(v3_3,"|")
						vvv4_1=vvv4_a(0)'实际个数
						vvv4_2=vvv4_a(1)'过滤个数
					End IF
					sql="select top $vvv4_1$ $g_str$  from qingtiandy_Product where n_look=1 "
				End IF
			End IF
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type1="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0"  Then
					sql=sql&" and n_type1="&v3_0
				End IF
			End IF
			
			v3_2=Trim(replace(v3_2,"'",""))
								
			s2=Trim(replace(s2,"'",""))
			IF s2<>""  Then sql=sql&" and (n_title like'%"&s2&"%') "	
			w3=Trim(replace(w3,",",""))
			'IF w3<>""  Then sql=sql&" and m_star like'%"&w3&"%'"
					
			IF v3_1=1 Then
				sql_order=" order by n_date desc,id desc"
			ElseIF v3_1=3 Then
				sql_order=" order by n_hits desc,n_date desc,id desc"
			ElseIF v3_1=4 Then
				sql_order=" order by n_numb desc,n_date desc,id desc"
			ElseIF v3_1=5 Then 	
				sql_order=" order by n_title,id desc"
			ElseIF v3_1=6 Then 	
				sql_order=" order by n_title desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_3,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandy_Product where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$","*")
				sql=sql&sql_order
			End IF	
			
			IF Ubound(v3_a)>=5 Then
				GetHTML_CMS_2=Get_sql_n1_Product_html(sql,u1,s1,s2,v3_3)
			Else
				GetHTML_CMS_2=Get_sql_n1_Product(sql,u1,s1,s2)
			End IF
		End IF		
		Timerx "NewsList_end",""			
	Case "NewsDetail"
		Timerx "NewsDetail_start",v2
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		GetHTML_CMS_2=Get_DetailNewsContent(v3,u1)	
		Timerx "NewsDetail_end",v2	
	Case "productDetail"
		Timerx "productDetail_start",v2
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		GetHTML_CMS_2=Get_DetailProductContent(v3,u1)	
		Timerx "productDetail_end",v2															
	Case Else
		GetHTML_CMS_2=valu
	End Select
End Function
Function Get_sql_n1(sql,v)
	'sql语句，循环内容
	Dim n1,n_name_a,n2,v3,v4,v5,v6
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	Do While Not rs.Eof
		m_id=rs("id")
		m_name_1=Str4Null(GetRP(rs("m_name")))
		m_type1_1=Bint(rs("m_type1"))
		m_type2_1=Bint(rs("m_type2"))
		m_type3_1=Bint(rs("m_type3"))
		m_url_1=Str4Null(GetRP(rs("m_url")))
		m_no_1=GetRP(rs("m_no"))
		m_date_1=rs("m_time")
		m_color_1=GetRp(rs("m_color"))
		m_content_1=GetRp(rs("m_content"))
		m_pic_1=GetRP(rs("m_pic"))
		m_i=v_i
		v4=v3
		IF m_color_1<>""  Then
			v4=Get_length_CMS_("mname_1_color",v4,m_name_1&"{####}"&m_color_1)
		Else
			v4=Get_length_CMS_("mname_1_color",v4,m_name_1)
		End IF		
		v4=Replace(v4,"{qt:m_pic}",Add_Root_Dir(m_pic_1))
		IF Instr(v4,"m_name")>0 Then v4=Get_length_CMS_("m_name",v4,m_name_1)
		IF Instr(v4,"n_name")>0 Then v4=Get_length_CMS_("m_name",v4,m_name_1)
		v4=Replace(v4,"{qt:type1_id}",m_type1_1)
		v4=Replace(v4,"{qt:type2_id}",m_type2_1)
		v4=Replace(v4,"{qt:m_i}",v_i)
		v4=Replace(v4,"{qt:m_id}",m_id)
		IF Instr(v4,"type1_name")>0 Then 
			Set oRs2=conn.Execute("select typename,typename2 from qingtiandh_type1 where typeid="&m_type1_1)
			IF Not oRs2.Eof THen
				type1_name_1=oRs2("typename")
				type1_name_2=oRs2("typename2")
			Else
				type1_name_1=""
				type1_name_2=""
			End IF
			'oRs2.close:Set oRs2=Nothing		
			v4=Replace(v4,"{qt:type1_name}",type1_name_1)
			v4=Replace(v4,"{qt:type1_name2}",IIf(type1_name_2="",type1_name_1,type1_name_2))
		End IF
		IF Instr(v4,"type2_name")>0 Then 
			Set oRs2=conn.Execute("select typename,typename2 from qingtiandh_type2 where typeid="&m_type2_1)
			IF Not oRs2.Eof THen
				type2_name_1=oRs2("typename")
				type2_name_2=oRs2("typename2")
			Else
				type2_name_1=""
				type2_name_2=""
			End IF
			'oRs2.close:Set oRs2=Nothing		
			v4=Replace(v4,"{qt:type2_name}",type2_name_1)
			v4=Replace(v4,"{qt:type2_name2}",IIf(type2_name_2="",type2_name_1,type2_name_2))
		End IF		
		v4=Replace(v4,"{qt:type2_url}",url_(array("l2",Trim(m_type2_1),"1")))
		v4=Replace(v4,"{qt:type1_url}",url_(array("l1",Trim(m_type1_1),"1")))
		IF Instr(v4,"m_url")>0 Then v4=Get_length_CMS_("m_url",v4,m_url_1)
		'时间格式
		IF Instr(v4,"m_date")>0 Then
			v5=GetContent(v4,"{qt:m_date","}",0)
			v6=GetContent(v4,"{qt:m_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(m_date_1,3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(m_date_1,5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(m_date_1,Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(m_date_1,Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(m_date_1,Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		
		IF Instr(m_content_1,"$")>0 Then
			m_content_1_a=Split(m_content_1,"$")
			v4=Replace(v4,"{qt:m_content1}",m_content_1_a(0))
			v4=Replace(v4,"{qt:m_content2}",m_content_1_a(1))
			v4=Replace(v4,"{qt:m_content3}",m_content_1_a(2))
		End IF
		
		v4=GetParseIf(v4)
		Get_sql_n1=Get_sql_n1&v4
		v_i=v_i+1
		rs.movenext
	Loop
	rs.close
End Function

Function Get_sql_n1Web(sql,v)
	'sql语句，循环内容
	Dim n1,n_name_a,n2,v3,v4,v5,v6
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	Do While Not rs.Eof
		v4=v3
		w_id_1=rs("id")
		w_name_1=GetRP(rs("w_name"))
		w_url_1=GetRP(rs("w_url"))
		w_inj_1=rs("inj")
		w_outj_1=rs("outj")
		w_inc_1=rs("inc")
		w_outc_1=rs("outc")		
		
		IF Clng(w_inj_1)>Clng(w_outj_1) Then
			v4=Get_length_CMS_("wname_1_color",v4,w_name_1&"{####}"&"#FF0000")
		Else
			v4=Get_length_CMS_("wname_1_color",v4,w_name_1)
		End IF		
		v4=Replace(v4,"{qt:w_i}",v_i)
		v4=Replace(v4,"{qt:w_id}",w_id_1)
		IF Instr(v4,"w_name")>0 Then v4=Get_length_CMS_("w_name",v4,w_name_1)
		v4=Replace(v4,"{qt:w_url}",GetUrl_httpAll(w_url_1))
		v4=Replace(v4,"{qt:w_inj}",w_inj_1)
		v4=Replace(v4,"{qt:w_outj}",w_outj_1)
		v4=Replace(v4,"{qt:w_inc}",w_inc_1)
		v4=Replace(v4,"{qt:w_outc}",w_outc_1)		
		'时间格式
		IF Instr(v4,"dateandtime")>0 Then
			v5=GetContent(v4,"{qt:dateandtime","}",0)
			v6=GetContent(v4,"{qt:dateandtime","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(m_date_1,3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(m_date_1,5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(m_date_1,Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(m_date_1,Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(m_date_1,Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		v4=GetParseIf(v4)
		Get_sql_n1Web=Get_sql_n1Web&v4
		v_i=v_i+1
		rs.movenext
	Loop
	
	rs.close
End Function
Function Get_Plist(sql,v)
	'sql语句，循环内容
	Dim n1,n_name_a,n2,v3,v4,v5,v6
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a,rs
	v_i=1
	v3=v	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1

	Do While Not rs.Eof
		v4=v3
		m_id_1=rs("id")
		m_name_1=GetRP(rs("m_name"))
		m_name_2=GetRP(rs("m_name2"))
		m_url_1=GetRP(rs("m_url"))
		m_pic_1=Replace(GetRP(rs("m_pic")),"../images/","template/"&G_moban&"/images/")
		IF m_name_2="" Then m_name_2=m_name_1
		'IF Instr(m_url_1,"{qt:G_lm")>0 Then
			m_url_1=GetUrl_httpAll(m_url_1)	
		'End IF	
		m_color_1=GetRP(rs("m_color"))
		IF m_color_1<>"" Then
			v4=Get_length_CMS_("name_1_color",v4,m_name_1&"{####}"&m_color_1)
			v4=Get_length_CMS_("name_2_color",v4,m_name_2&"{####}"&m_color_1)
		Else
			v4=Get_length_CMS_("name_1_color",v4,m_name_1)	
			v4=Get_length_CMS_("name_2_color",v4,m_name_2)
		End IF
		v4=Replace(v4,"{qt:m_i}",v_i)
		v4=Replace(v4,"{qt:m_id}",m_id_1)
		IF Instr(v4,"m_name")>0 Then v4=Get_length_CMS_("m_name",v4,m_name_1)
		IF Instr(v4,"m2_name")>0 Then v4=Get_length_CMS_("m2_name",v4,m_name_2)
		v4=Replace(v4,"{qt:m_url}",m_url_1)
		v4=Replace(v4,"{qt:m_pic}",Add_Root_Dir(m_pic_1))
		IF Instr(v4,"qt:n_i")>0 Then
			v7=GetContent(v4,"{qt:n_i ","}",0)
			v8=GetContent(v4,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,v7+v_i)
			End IF
		End IF			
		v4=GetParseIf(v4)
		Get_Plist=Get_Plist&v4
		v_i=v_i+1
		rs.movenext
	Loop	
	rs.close
	
	Set soojs = New Regexp
	soojs.IgnoreCase = True
	soojs.Global = True
	soojs.Pattern =  "{qt:typeurl2 (\d+)}"
	Set Matches =soojs.Execute(Get_Plist)'开始执行配置
	set  soojs=nothing 	
	For Each Match in Matches
		Get_Plist=Replace(Get_Plist,Match.Value,url_(array("l2",Trim(Match.SubMatches(0)),"1")))
	Next	
	'Get_Plist = soojs.Replace(Get_Plist,url_(array("l2",Trim("$1"),"")))	
End Function
Function Get_length_CMS_(v,v4,m_name_1)
	Dim pp1,pp2,pp3
	IF instr(v4,"{qt:"&v)=0 Then
		Get_length_CMS_=v4
		Exit Function
	End IF
	Dim n1,n2,i,n_name_a,leng
	n_name=body2s(v4,"{qt:"&v&"","}","{$$$}",false)	
	IF instr(n_name,"{$$$}")>0 Then
		n_name=left(n_name,instrrev(n_name,"{$$$}")-1)
		
		n_name_a=split(n_name,"{$$$}")
		For i=0 To Ubound(n_name_a)
			n1=n_name_a(i)
			n2=Trim(GetContent(n1,"{qt:"&v&"","}",0))
			IF m_name_1<>"" and Not isnull(m_name_1) Then
				IF Instr(m_name_1,"{####}")>0 Then
					pp1=split(m_name_1,"{####}")
					pp2=pp1(0)
					pp3=pp1(1)
					IF n2<>"" Then						
						v4=replace(v4,n1,"<font color="&pp3&">"&Get_length(pp2,"",Clng(n2)*2)&"</font>")
					Else
						v4=replace(v4,n1,"<font color="&pp3&">"&pp2&"</font>")
					End IF							
				Else				
					IF n2<>"" Then
						IF v="m_name" or v="mname_1_color" or v="name_1_color" Then
							leng=Get_length(m_name_1,"",Clng(n2)*2)
						Else
							leng=left(m_name_1,n2)	
						End IF					
					Else
						leng=m_name_1						
					End IF
					v4=replace(v4,n1,leng)
						
				End IF
			Else
				v4=replace(v4,n1,"")
			End IF
		Next
		
	End IF
	
	Get_length_CMS_=v4
End Function
Function GetRP(v)
	Dim p,pp
	p=v
	pp=qtcmsdh.Lnumbs(p)
	GetRP=pp
End Function

Function Get_menu_type2(sql,u1,length)
	Dim v1,str,mi
	Dim t_name1,t_name2,t_name
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	IF Not rs.Eof Then
		mi=1
		Do While Not rs.Eof
			v1=u1
			t_name1=Get_length(rs("typename"),"",length*2)
			t_name2=Get_length(rs("typename2"),"",length*2)
			IF t_name2<>"" Then 
				t_name=t_name2
			Else
				t_name=t_name1
			End IF		
			t_typeid=rs("typeid")
			t_typecontent=GetRP(rs("typecontent"))
			t_typecolor=GetRP(rs("typecolor"))
			t_typehttpurl2=GetRP(rs("typehttpurl2"))
			IF Instr(t_typehttpurl2,"http")>0 Then
				v1=replace(v1,"{qt:m_type_url}",t_typehttpurl2)
			Else
				v1=replace(v1,"{qt:m_type_url}",url_(array("l2",Trim(t_typeid),"1")))
			End IF
			IF t_typecolor="" Then
				v1=replace(v1,"{qt:m_type_name}",t_name1)
				v1=replace(v1,"{qt:m_type_name1}",t_name1)
				v1=replace(v1,"{qt:m_type_name2}",t_name)
			Else
				v1=replace(v1,"{qt:m_type_name}","<font color='"&t_typecolor&"'>"&t_name1&"</font>")
				v1=replace(v1,"{qt:m_type_name1}","<font color='"&t_typecolor&"'>"&t_name1&"</font>")
				v1=replace(v1,"{qt:m_type_name2}","<font color='"&t_typecolor&"'>"&t_name&"</font>")		
			End IF
			v1=replace(v1,"{qt:m_type_id}",t_typeid)
			v1=replace(v1,"{qt:m_i}",mi)
			v1=replace(v1,"{qt:mm_i}",mi)
			v1=replace(v1,"{qt:m_type_mi}",mi)
			IF Instr(v1,"{qt:m_type_total}")>0 Then
				'v1=replace(v1,"{qt:m_type_total}",Get_MovieTypeTotal(rs("typeid")))
			End IF			
			v1=replace(v1,"{qt:TypeContent}",t_typecontent)
			t1=GetContent(v1,"{qt_Loop:urlList}","{/qt_Loop:urlList}",1)
			t2=GetContent(v1,"{qt_Loop:urlList}","{/qt_Loop:urlList}",0)	
			IF t1<>"" And t2<>"" Then
				t3_a=Get_menu_type2_UrlList(t_typeid,t2)
				v1=replace(v1,t1,t3_a(0))
				v1=replace(v1,"{qt:md_i}",t3_a(1))
			End IF				
			v1=GetParseIf(v1)
			v1=GetParseIfx(v1)
			Get_menu_type2=Get_menu_type2&v1
			mi=mi+1
			rs.movenext
		Loop
	Else
		Get_menu_type2=""
	End IF
	
	Get_menu_type2=GetParseIfxx(Get_menu_type2)
	Get_menu_type2=GetParseIf(Get_menu_type2)
	rs.close
End Function

'二类的所有子类和所有网址
Function Get_menu_type3(sql,u1,length)
	Dim v1,str,ii
	Dim t_name1,t_name2,t_name
	Dim rs
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1

	IF Not rs.Eof Then
		ii=1
		Do While Not rs.Eof
			v1=u1
			t_name1=Get_length(rs("typename"),"",length*2)
			t_name2=Get_length(rs("typename2"),"",length*2)
			IF t_name2<>"" Then 
				t_name=t_name2
			Else
				t_name=t_name1
			End IF		
			t_typeid=rs("typeid")
			t_typeid1=rs("typeid1")
			t_typeid2=rs("typeid2")
			t_typecontent=GetRP(rs("typecontent"))
			t_typecolor=GetRP(rs("typecolor"))
			v1=replace(v1,"{qt:m_type_url}",url_(array("l2",Trim(t_typeid),"1")))
			IF t_typecolor="" Then
				v1=replace(v1,"{qt:m_type_name}",t_name1)
				v1=replace(v1,"{qt:m_type_name1}",t_name1)
				v1=replace(v1,"{qt:m_type_name2}",t_name)
			Else
				v1=replace(v1,"{qt:m_type_name}","<font color='"&t_typecolor&"'>"&t_name1&"</font>")
				v1=replace(v1,"{qt:m_type_name1}","<font color='"&t_typecolor&"'>"&t_name1&"</font>")
				v1=replace(v1,"{qt:m_type_name2}","<font color='"&t_typecolor&"'>"&t_name&"</font>")		
			End IF			
			v1=replace(v1,"{qt:m_type_id}",t_typeid)
			IF Instr(v1,"qt:m_type3_i")>0 Then
				v7=GetContent(v1,"{qt:m_type3_i ","}",0)
				v8=GetContent(v1,"{qt:m_type3_i ","}",1)
				v7=StayNub(v7)
				IF v7="" Then 
					v1=replace(v1,"{qt:m_type3_i}",ii)
				Else
					v7=Clng(v7)
					v1=replace(v1,v8,v7+ii)
				End IF
			End IF			
			
			IF Instr(v1,"{qt:m_type_total}")>0 Then
				v1=replace(v1,"{qt:m_type_total}",Get_TypeTotal3(t_typeid))
			End IF			
			v1=replace(v1,"{qt:TypeContent}",t_typecontent)
			v1=replace(v1,"{qt:m_i}",t_typeid&t_typeid1&t_typeid2)
			t1=GetContent(v1,"{qt_Loop:urlList}","{/qt_Loop:urlList}",1)
			t2=GetContent(v1,"{qt_Loop:urlList}","{/qt_Loop:urlList}",0)	
			IF t1<>"" And t2<>"" Then
				t3_a=Get_menu_type3_UrlList(t_typeid,t2)
				v1=replace(v1,t1,t3_a(0))
				v1=replace(v1,"{qt:md_i}",t3_a(1))
			End IF						
			v1=GetParseIf(v1)
			Get_menu_type3=Get_menu_type3&v1
			ii=ii+1
			rs.movenext
		Loop
	Else
		Get_menu_type3=""
	End IF
	rs.close
End Function


Function Get_List19(Sql,u1)
	Dim oStr
	oStr=""
	Dim rs,v_i
	Set rs=server.CreateObject(G_RS)
	rs.open Sql,Conn,1,1
	v4=""
	v_i=1
	Do While Not rs.Eof
		n_title1=GetRp(rs("n_title"))
		n_title2=GetRp(rs("n_title2"))
		n_color=GetRp(rs("n_color"))
		n_gotourl=GetUrl_httpAll(GetRp(rs("n_gotourl")))
		n_gotourl2=GetUrl_httpAll(GetRp(rs("n_gotourl2")))
		n_pic=Replace(GetRP(rs("n_pic")),"../images/","template/"&G_moban&"/images/")
		n_content=GetRp(rs("n_content"))
		n_content=Replace(n_content,"../images/","template/"&G_moban&"/images/")
		
		v3=u1
		v3=Replace(v3,"{qt:n_title1}",n_title1)
		IF n_color<>"" Then
			v3=Get_length_CMS_("nd_title1_color",v3,n_title1&"{####}"&n_color)
			
		Else
			v3=Get_length_CMS_("nd_title1_color",v3,n_title1)
		End IF
		v3=Get_length_CMS_("n_content",v3,n_content)
		v3=Replace(v3,"{qt:n_title2}",n_title2)
		v3=Replace(v3,"{qt:n_gotourl}",n_gotourl)
		v3=Replace(v3,"{qt:n_gotourl2}",n_gotourl2)
		IF n_pic<>"" Then
			IF Instr(n_pic,"http://")>0 Then
				v3=Replace(v3,"{qt:n_pic}",n_pic)
			Else
				v3=Replace(v3,"{qt:n_pic}",Add_Root_Dir(n_pic))
			End IF
		Else
			v3=Replace(v3,"{qt:n_pic}","")
		End IF
		IF Instr(v3,"qt:n_i")>0 Then
			v7=GetContent(v3,"{qt:n_i ","}",0)
			v8=GetContent(v3,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v3=replace(v3,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v3=replace(v3,v8,v7+v_i)
			End IF
		End IF	
		IF Instr(v3,"qt:n2_i")>0 Then
			v7=GetContent(v3,"{qt:n2_i ","}",0)
			v8=GetContent(v3,"{qt:n2_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v3=replace(v3,"{qt:n2_i}",right("0"&v_i,2))
			Else
				v7=Clng(v7)
				v3=replace(v3,v8,right("0"&(v7+v_i),2))
			End IF
		End IF	
									
		v4=v4&v3
		v_i=v_i+1
		rs.MoveNext
	Loop
	rs.close
	v4=GetParseIf(v4)
	Get_List19=v4
End Function

'二类的网址列表
Function Get_menu_type2_UrlList(type3,u1)
	type3=Bint(type3)
	Set rsde=server.CreateObject(G_RS)
	
	rsde.open "Select * From qingtiandh_List Where m_type2="&type3&" And m_look=1 Order by m_no Desc,m_time Desc,Id Desc",conn,1,1
	IF rsde.Eof Then
		Get_menu_type2_UrlList=array("",1)
		Exit Function
	Else
		ii=1
		v4=""
		Do While Not rsde.Eof
			v3=u1
			m_i=ii
			m_name_1=rsde("m_name")	
			m_color_1=GetRp(rsde("m_color"))	
			m_url_1=rsde("m_url")
			m_id=rsde("id")
			m_pic=GetRp(rsde("m_pic"))
			IF m_color_1<>""  Then
				v3=Get_length_CMS_("mdname_1_color",v3,m_name_1&"{####}"&m_color_1)
			Else
				v3=Get_length_CMS_("mdname_1_color",v3,m_name_1)
			End IF	
			v3=Replace(v3,"{qt:md_name}",m_name_1)
			v3=Replace(v3,"{qt:md_url}",m_url_1)	
			v3=Replace(v3,"{qt:md_i}",m_i)
			v3=Replace(v3,"{qt:md_id}",m_id)
			IF m_pic<>"" Then
				IF Instr(m_pic,"http://")>0 Then
					v3=Replace(v3,"{qt:md_pic}",m_pic)
				Else
					m_pic=Replace(GetRP(m_pic),"../images/","template/"&G_moban&"/images/")
					v3=Replace(v3,"{qt:md_pic}",Add_Root_Dir(m_pic))
				End IF
			Else
				v3=Replace(v3,"{qt:md_pic}","")
			End IF
			v4=v4&v3		
			ii=ii+1
			rsde.MoveNext
		Loop
		v4=GetParseIfxx(v4)
		Get_menu_type2_UrlList=array(v4,ii)
	End IF
End Function


'三类的网址列表
Function Get_menu_type3_UrlList(type3,u1)
	type3=Bint(type3)
	Set rsde=server.CreateObject(G_RS)
	
	rsde.open "Select * From qingtiandh_List Where m_type3="&type3&" And m_look=1 Order by m_no Desc,m_time Desc,Id Desc",conn,1,1
	IF rsde.Eof Then
		Get_menu_type3_UrlList=array("",1)
		Exit Function
	Else
		ii=1
		v4=""
		Do While Not rsde.Eof
			v3=u1
			m_i=ii
			m_name_1=rsde("m_name")	
			m_color_1=GetRp(rsde("m_color"))	
			m_url_1=rsde("m_url")
			m_url_1=GetUrl_httpAll(m_url_1)
			m_id=rsde("id")
			m_pic=GetRp(rsde("m_pic"))
			IF m_color_1<>""  Then
				v3=Get_length_CMS_("mdname_1_color",v3,m_name_1&"{####}"&m_color_1)
			Else
				v3=Get_length_CMS_("mdname_1_color",v3,m_name_1)
			End IF	
			v3=Replace(v3,"{qt:md_name}",m_name_1)
			v3=Replace(v3,"{qt:md_url}",m_url_1)	
			v3=Replace(v3,"{qt:md_i}",m_i)
			v3=Replace(v3,"{qt:md_id}",m_id)
			IF m_pic<>"" Then
				IF Instr(m_pic,"http://")>0 Then
					v3=Replace(v3,"{qt:md_pic}",m_pic)
				Else
					m_pic=Replace(GetRP(m_pic),"../images/","template/"&G_moban&"/images/")
					v3=Replace(v3,"{qt:md_pic}",Add_Root_Dir(m_pic))
				End IF
			Else
				v3=Replace(v3,"{qt:md_pic}","")
			End IF
			v4=v4&v3		
			ii=ii+1
			rsde.MoveNext
		Loop

		v4=GetParseIfxx(v4)
		Get_menu_type3_UrlList=array(v4,ii)
	End IF
End Function



Function GetParseIf(content)
	IF Instr(content,"{end if")=0 Then
		GetParseIf=content
		Exit Function
	End IF
	dim matchIf,matchesIf,strIf,strThen,strThen1,strElse1
	dim ifFlag
	labelRule = "{if([\s\S]*?):([\s\S]+?)}([\s\S]*?){end if\1}"
	set regExpObj= new RegExp
	regExpObj.ignoreCase = true
	regExpObj.Global = true		
	regExpObj.Pattern = labelRule
	set matchesIf = regExpObj.Execute(content)
	for each matchIf in matchesIf 
		strIf = matchIf.SubMatches(1)
		strThen = matchIf.SubMatches(2)
		if instr(strThen,"{else}")>0 then 
			strThen1=split(strThen,"{else}")(0)
			strElse1=split(strThen,"{else}")(1)
			Execute("if  " & strIf & " then ifFlag = true else ifFlag = false")
			if ifFlag then content = replace(content,matchIf.value,strThen1) else content = replace(content,matchIf.value,strElse1)
		else
			Execute("if  " & strIf & " then ifFlag = true else ifFlag = false")
			if ifFlag then content = replace(content,matchIf.value,strThen) else content = replace(content,matchIf.value,"")
		end if
	next
	set matchesIf = nothing
	GetParseIf=content
End Function

Function GetParseIfx(content)
	IF Instr(content,"{aend if")=0 Then
		GetParseIfx=content
		Exit Function
	End IF
	dim matchIf,matchesIf,strIf,strThen,strThen1,strElse1
	dim ifFlag
	labelRule = "{aif([\s\S]*?):([\s\S]+?)}([\s\S]*?){aend if\1}"
	set regExpObj= new RegExp
	regExpObj.ignoreCase = true
	regExpObj.Global = true		
	regExpObj.Pattern = labelRule
	set matchesIf = regExpObj.Execute(content)
	for each matchIf in matchesIf 
		strIf = matchIf.SubMatches(1)
		strThen = matchIf.SubMatches(2)
		if instr(strThen,"{else}")>0 then 
			strThen1=split(strThen,"{else}")(0)
			strElse1=split(strThen,"{else}")(1)
			Execute("if  " & strIf & " then ifFlag = true else ifFlag = false")
			if ifFlag then content = replace(content,matchIf.value,strThen1) else content = replace(content,matchIf.value,strElse1)
		else
			Execute("if  " & strIf & " then ifFlag = true else ifFlag = false")
			
			if ifFlag then content = replace(content,matchIf.value,strThen) else content = replace(content,matchIf.value,"")
		end if
	next
	set matchesIf = nothing
	GetParseIfx=content
End Function

Function GetParseIfxx(content)
	IF Instr(content,"{bend if")=0 Then
		GetParseIfxx=content
		Exit Function
	End IF
	dim matchIf,matchesIf,strIf,strThen,strThen1,strElse1
	dim ifFlag
	labelRule = "{bif([\s\S]*?):([\s\S]+?)}([\s\S]*?){bend if\1}"
	set regExpObj= new RegExp
	regExpObj.ignoreCase = true
	regExpObj.Global = true		
	regExpObj.Pattern = labelRule
	set matchesIf = regExpObj.Execute(content)
	for each matchIf in matchesIf 
		strIf = matchIf.SubMatches(1)
		strThen = matchIf.SubMatches(2)
		if instr(strThen,"{else}")>0 then 
			strThen1=split(strThen,"{else}")(0)
			strElse1=split(strThen,"{else}")(1)
			Execute("if  " & strIf & " then ifFlag = true else ifFlag = false")
			if ifFlag then content = replace(content,matchIf.value,strThen1) else content = replace(content,matchIf.value,strElse1)
		else
			Execute("if  " & strIf & " then ifFlag = true else ifFlag = false")
			
			if ifFlag then content = replace(content,matchIf.value,strThen) else content = replace(content,matchIf.value,"")
		end if
	next
	set matchesIf = nothing
	GetParseIfxx=content
End Function

Function GetHTML_CMS_3(valu)
	Dim v1,v2,v3,v4
	Dim v3_a,v3_1,v3_2,v3_3,sql,sql_order,v3_2_1,v3_2_a
	Dim u1,s1,s2,w1,w3,w4,rs
	IF Instr(valu,"{/-qt_Loop}")=0  Then
		GetHTML_CMS_2=""
		Exit Function
	End IF	
	'{qt_Loop:MovieList 1,0,0,4[,1,4]}
	v1=GetContent(valu,"{-qt_Loop:","}",1)
	v2=GetContent(v1,"{-qt_Loop:"," ",0) '类别
	u1=replace(replace(valu,v1,""),"{/-qt_Loop}","")
	Select Case v2	
	Case "Alltype2" '大类循环
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_0=v3_a(0) '菜单个数，0表示按照默认的递增的排序方式，可以是1|2|3|4
			v3_1=v3_a(1) '菜单个数，前者优先
			v3_2=v3_a(2) '菜单的字数
			sql="select top "&v3_1&" * from  qingtiandh_type1 where typehide=1 "
			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (typeid="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or typeid="&v3_2_a(i)&") "
					Else
						sql=sql&" or typeid="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and typeid="&v3_0
				End IF
			End IF
			sql=sql&" order by typeno asc,typeid desc"
			GetHTML_CMS_3=Get_menu_type1(sql,u1,v3_2)
		End IF	
	Case "Kutype" '大类循环
		GetHTML_CMS_3=Get_menu_type1(qtcmsdh.Bq_x(v1)(0),u1,qtcmsdh.Bq_x(v1)(1))			
	Case "AllList" '酷站导航列表
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '
		g_str="*"
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_0=v3_a(0) '类别种类，
			v3_1=v3_a(1) '菜单个数，前者优先
			v3_2=v3_a(2) '菜单的字数
			
			IF v3_1="0" Then
				sql="select  "&g_str&" from qingtiandh_ltype1 where  typehide=1 "
			Else
				IF Instr(v3_1,"|")=0 Then
					vvv4_1=v3_1
					vvv4_2=0
				Else
					vvv4_a=split(v3_1,"|")
					vvv4_1=vvv4_a(0)'实际个数
					vvv4_2=vvv4_a(1)'过滤个数
				End IF
				sql="select top $vvv4_1$ $g_str$  from qingtiandh_ltype1 where typehide=1 "
			End IF			

			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (typeid="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or typeid="&v3_2_a(i)&") "
					Else
						sql=sql&" or typeid="&v3_2_a(i)
					End IF
				Next
			Else
				IF v3_0<>"0" Then
					sql=sql&" and typeid="&v3_0
				End IF
			End IF
			
			sql_order=" order by typeno asc,typeid desc"
			
			IF Instr(v3_1,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","typeid")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","typeid")
				sql="Select * from qingtiandh_ltype1 where [typeid] in ("&sql4&sql_order&") And [typeid] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$",g_str)
				sql=sql&sql_order
			End IF				
			
			GetHTML_CMS_3=Get_sql_n1_all(sql,u1)
		End IF	
	Case "BigType1List"
		sql="select"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '	
		v3_0=v3
		Set rs_m1=conn.execute("select  typeid,typename,typeid1,typeid2 from qingtiandh_type3 where typeid1="&v3_0&" ANd  typehide=1 order by typeid asc, typeno asc")
		big_i=1
		Do While Not rs_m1.Eof 
			v3=u1
			v3=replace(v3,"{qt:big_type1}",rs_m1("typeid1"))	
			v3=replace(v3,"{qt:big_type2}",rs_m1("typeid2"))	
			v3=replace(v3,"{qt:big_type3}",rs_m1("typeid"))
			v3=Get_length_CMS_("big_typename3",v3,rs_m1("typename"))
			v3=replace(v3,"{qt:big_m_i}",big_i)
			GetHTML_CMS_3=GetHTML_CMS_3&v3&vbcrlf	
			big_i=big_i+1
			rs_m1.movenext
		Loop	
		GetHTML_CMS_3=GetParseIf(GetHTML_CMS_3)
	Case "Big2Type1List"
		sql="select"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '	
		v3_0=v3
		IF v3_0<>"0" Then
			Sql="select  typeid,typename,typeid1 from qingtiandh_type2 where typeid1="&v3_0&" ANd  typehide=1 order by typeid asc, typeno asc"
		Else
			Sql="select  typeid,typename,typeid1 from qingtiandh_type2 where   typehide=1 order by typeid asc, typeno asc"
		End IF		
		Set rs_m1=conn.execute(Sql)
		big_i=1
		Do While Not rs_m1.Eof 
			v3=u1
			v3=replace(v3,"{qt:big_type1}",rs_m1("typeid"))	
			v3=replace(v3,"{qt:big_type2}",rs_m1("typeid1"))
			v3=Get_length_CMS_("big_typename2",v3,rs_m1("typename"))
			v3=replace(v3,"{qt:big_m_i}",big_i)
			GetHTML_CMS_3=GetHTML_CMS_3&v3&vbcrlf	
			big_i=big_i+1
			rs_m1.movenext
		Loop	
		GetHTML_CMS_3=GetParseIf(GetHTML_CMS_3)		
	Case "ProductAllList"
		sql="select"
		v3=GetContent(v1," ","}",0)
		v3=replace(v3," ","") '	
		v3_0=v3
		v3_ii=1
		Set rs_m1=conn.execute("select  typeid,typename from qingtiandy_Ptype1 where typehide=1 order by typeno asc")
		Do While Not rs_m1.Eof 
			v3=u1
			etypeid=rs_m1(0)
			etypename=rs_m1(1)
			v3=replace(v3,"{qt:productm_type1}",rs_m1(0))	
			v3=replace(v3,"{qt:productTypeName}",rs_m1(1))
			v3=replace(v3,"{qt:productm_i}",v3_ii)
			IF Instr(v3,"{qt:productTypeCount}")>0 Then
				e_c_productc=0
				Set oRs_e=Conn.Execute("Select Count(*) from qingtiandy_product Where n_type1="&etypeid)
				IF Not oRs_e.Eof Then
					e_c_productc=oRs_e(0)
				End IF
				v3=replace(v3,"{qt:productTypeCount}",e_c_productc)
			End IF
			GetHTML_CMS_3=GetHTML_CMS_3&v3&vbcrlf	
			v3_ii=v3_ii+1
			rs_m1.movenext
		Loop
		GetHTML_CMS_3=GetParseIf(GetHTML_CMS_3)		
	Case Else
	
	End Select
	GetHTML_CMS_3=GetHTML_CMS_3
End Function

Function Get_menu_type1(sql,u1,length)
	Dim v1,str,mi
	Dim t_name1,t_name2,t_name
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	IF Not rs.Eof Then
		mi=1
		Do While Not rs.Eof
			v1=u1
			t_typeid=rs("typeid")
			v1=replace(v1,"{qt:m_type_id1}",t_typeid)
			v1=replace(v1,"{qt:m_i}",mi)
			v1=replace(v1,"{qt:m-_i}",mi)
			IF Instr(v1,"{qt:m_type1_total}")>0 Then
			'	v1=replace(v1,"{qt:m_type1_total}",Get_MovieTypeTotal(rs("typeid")))
			End IF			
			v1=GetParseIf(v1)
			Get_menu_type1=Get_menu_type1&v1
			mi=mi+1
			rs.movenext
		Loop
	Else
		Get_menu_type1=""
	End IF
	Get_menu_type1=GetParseIfx(Get_menu_type1)
	rs.close
End Function


Function Get_sql_n1_all(sql,v)
	'sql语句，循环内容
	Dim n1,n_name_a,n2,v3,v4,v5,v6
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	Do While Not rs.Eof
		m_type1_1=Bint(rs("typeid"))
		m_type1_2=Bint(rs("m_type2"))
		type2_name_1=rs("typename")
		type_pic=GetRp(rs("type_pic"))
		IF Instr(type2_name_1,"||")>0 Then
			type2_name_1_a=Split(type2_name_1,"||")
			type2_name_1=type2_name_1_a(0)
		End IF
		type2_name_2=GetRP(rs("typename2"))	
		typehttpurl=GetRp(rs("typehttpurl"))
		m_i=v_i
		v4=v3
		IF Instr(typehttpurl,"http://")>0 then
			v4=Replace(v4,"{qt:ListUrl2 {-qt:type2_id}}",typehttpurl)
		End IF
		v4=Replace(v4,"{-qt:type1_id}",m_type1_1)
		v4=Replace(v4,"{-qt:type2_id}",m_type1_2)
		IF Instr(v4,"type2_name")>0 Then 
			'oRs2.close:Set oRs2=Nothing		
			v4=Replace(v4,"{-qt:type2_name}",type2_name_1)
			v4=Replace(v4,"{-qt:type2_name2}",IIf(type2_name_2="",type2_name_1,type2_name_2))
		End IF	
		v4=Replace(v4,"{-qt:m_i}",m_i)
		v4=Replace(v4,"{-qt:type_pic}",type_pic)
		v4=GetParseIf(v4)
		Get_sql_n1_all=Get_sql_n1_all&v4
		v_i=v_i+1
		rs.movenext
	Loop
	rs.close
End Function

Function Get_sql_n1_ListNew(sql,v)
	'sql语句，循环内容
	Dim n1,n_name_a,n2,v3,v4,v5,v6
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	Do While Not rs.Eof
		m_id=rs("id")
		m_name_1=GetRP(rs("m_name"))
		m_type1_1=Bint(rs("m_type1"))
		m_url_1=GetUrl_httpAll(GetRP(rs("m_url")))
		m_no_1=GetRP(rs("m_no"))
		m_date_1=rs("m_time")
		m_color_1=GetRp(rs("m_color"))
		m_pic=GetRp(rs("m_pic"))
		m_content=GetRp(rs("m_content"))
		m_i=v_i
		v4=v3
		IF m_color_1<>""  Then
			v4=Get_length_CMS_("mname_1_color",v4,m_name_1&"{####}"&m_color_1)
		Else
			v4=Get_length_CMS_("mname_1_color",v4,m_name_1)
		End IF		
		IF Instr(v4,"m_name")>0 Then v4=Get_length_CMS_("m_name",v4,m_name_1)
		IF Instr(v4,"n_name")>0 Then v4=Get_length_CMS_("m_name",v4,m_name_1)
		v4=Replace(v4,"{qt:type1_id}",m_type1_1)
		v4=Replace(v4,"{qt:type2_id}",m_type2_1)
		v4=Replace(v4,"{qt:m_i}",m_i)
		
		IF Instr(v4,"qt:m2_i")>0 Then
			v7=GetContent(v4,"{qt:m2_i ","}",0)
			v8=GetContent(v4,"{qt:m2_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:m2_i}",right("0"&v_i,2))
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,right("0"&(v7+v_i),2))
			End IF
		End IF			
		
		
		v4=Replace(v4,"{qt:m_id}",m_id)	
		m_pic_1=Replace(GetRP(m_pic),"../images/","template/"&G_moban&"/images/")
		v4=Replace(v4,"{qt:m_pic}",m_pic_1)	
		
		v4=Replace(v4,"{qt:type2_url}",url_(array("l2",Trim(m_type2_1),"1")))
		IF Instr(v4,"m_url")>0 Then v4=Get_length_CMS_("m_url",v4,m_url_1)
		'时间格式
		IF Instr(v4,"m_date")>0 Then
			v5=GetContent(v4,"{qt:m_date","}",0)
			v6=GetContent(v4,"{qt:m_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(m_date_1,3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(m_date_1,5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(m_date_1,Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(m_date_1,Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(m_date_1,Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		v4=Replace(v4,"{qt:m_content}",m_content)	
		v4=GetParseIf(v4)
		v4=GetParseIfx(v4)
		Get_sql_n1_ListNew=Get_sql_n1_ListNew&v4
		v_i=v_i+1
		rs.movenext
	Loop
	rs.close
End Function

Function Get_sql_n1_Gg(sql,v,s1,s2)
	'sql语句，循环内容，开始ID，结束ID
	Dim n1,n_name_a,n2,v3,v4,v5,v6,v7,v8
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	

	Do While Not rs.Eof
		n_id_1=rs("id")
		n_title_1=replace(rs("n_title"),"'","")
		n_color_1=rs("n_color")
		n_hits_1=rs("n_hits")
		n_date_1=rs("n_date")
		n_gotourl_1=rs("n_gotourl")
		n_numb=rs("n_numb")
		n_content=rs("n_content")
		'n_type1_1=Get_type1_name3(rs("n_type1"))
		n_type1_1_id=rs("n_type1")
		v4=v3
		
		IF n_color_1<>"" And Not isNUll(n_color_1) Then
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1&"{####}"&n_color_1)
		Else
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1)
		End IF
		v4=Get_length_CMS_("n_title",v4,n_title_1)
		
		IF Instr(v4,"n_type1_name")>0 Then v4=Get_length_CMS_("m_type1_name",v4,n_type1_1)
		IF Instr(v4,"n_type1_id")>0 Then v4=Get_length_CMS_("n_type1_id",v4,n_type1_1_id)
		
		IF Instr(v4,"n_content")>0 Then v4=Get_length_CMS_("n_content",v4,HTMLEncode12(rs("n_content")))
		
		v4=replace(v4,"{qt:n_hits}",n_hits_1)	
		v4=replace(v4,"{qt:n_ziduan1}",n_ziduan1_1)
		v4=replace(v4,"{qt:n_id}",n_id_1)	
		'时间格式
		IF Instr(v4,"n_date")>0 Then
			v5=GetContent(v4,"{qt:n_date","}",0)
			v6=GetContent(v4,"{qt:n_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(rs("n_date"),3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(rs("n_date"),5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(rs("n_date"),Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(rs("n_date"),Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(rs("n_date"),Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		IF Instr(v4,"n_url")>0 Then 
			IF Instr(n_gotourl_1,"http://")>0 And Not Isnull(n_gotourl_1) Then
				v4=replace(v4,"{qt:n_url}",n_gotourl_1)
			Else
				v4=replace(v4,"{qt:n_url}",url_(Array("n",n_id_1,"/")))
			End IF 
		End IF
		IF Instr(v4,"n_pic")>0 Then 
			v4=replace(v4,"{qt:n_pic}",Add_Root_Dir(n_pic_1)) 
		End IF		
		IF Instr(v4,"qt:n_i")>0 Then
			v7=GetContent(v4,"{qt:n_i ","}",0)
			v8=GetContent(v4,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,v7+v_i)
			End IF
		End IF						
		Get_sql_n1_Gg=Get_sql_n1_Gg&v4
		v_i=v_i+1
		rs.movenext
	Loop
	rs.close
End Function


Function Get_sql_n1_new(sql,v,s1,s2)
	'sql语句，循环内容，开始ID，结束ID
	Dim n1,n_name_a,n2,v3,v4,v5,v6,v7,v8
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	

	Do While Not rs.Eof
		n_id_1=rs("id")
		n_title_1=replace(rs("n_title"),"'","")
		n_color_1=rs("n_color")
		n_hits_1=rs("n_hits")
		n_date_1=rs("n_date")
		n_gotourl_1=rs("n_gotourl")
		n_numb=rs("n_numb")
		n_content=rs("n_content")
		'n_type1_1=Get_type1_name3(rs("n_type1"))
		n_type1_1_id=rs("n_type1")
		n_pic_1=rs("n_pic")
		n_ziduan1_1=GetRp(rs("n_ziduan1"))
		v4=v3
		
		IF n_color_1<>"" And Not isNUll(n_color_1) Then
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1&"{####}"&n_color_1)
		Else
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1)
		End IF
		v4=Get_length_CMS_("n_title",v4,n_title_1)
		
		IF Instr(v4,"n_type1_name")>0 Then v4=Get_length_CMS_("m_type1_name",v4,n_type1_1)
		IF Instr(v4,"n_type1_id")>0 Then v4=Get_length_CMS_("n_type1_id",v4,n_type1_1_id)
		
		IF Instr(v4,"n_content")>0 Then v4=Get_length_CMS_("n_content",v4,HTMLEncode12(rs("n_content")))
		
		v4=replace(v4,"{qt:n_hits}",n_hits_1)	
		v4=replace(v4,"{qt:n_ziduan1}",n_ziduan1_1)
		v4=replace(v4,"{qt:n_id}",n_id_1)	
		'时间格式
		IF Instr(v4,"n_date")>0 Then
			v5=GetContent(v4,"{qt:n_date","}",0)
			v6=GetContent(v4,"{qt:n_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(rs("n_date"),3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(rs("n_date"),5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(rs("n_date"),Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(rs("n_date"),Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(rs("n_date"),Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		IF Instr(v4,"n_url")>0 Then 
			IF Instr(n_gotourl_1,"http://")>0 And Not Isnull(n_gotourl_1) Then
				v4=replace(v4,"{qt:n_url}",n_gotourl_1)
			Else
				v4=replace(v4,"{qt:n_url}",url_(Array("n",n_id_1,"/")))
			End IF 
		End IF
		IF Instr(v4,"n_pic")>0 Then 
			v4=replace(v4,"{qt:n_pic}",Add_Root_Dir(n_pic_1)) 
		End IF		
		IF Instr(v4,"qt:n_i")>0 Then
			v7=GetContent(v4,"{qt:n_i ","}",0)
			v8=GetContent(v4,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,v7+v_i)
			End IF
		End IF						
		Get_sql_n1_new=Get_sql_n1_new&v4
		v_i=v_i+1
		rs.movenext
	Loop
	rs.close
End Function

Function Get_sql_n1_News_html(sql,v,s1,s2,v3_3)
	'sql语句，循环内容，返回第几页，关键词,一页几个
	Dim n1,n_name_a,n2,v3,v4,totalpage_list,temp_i,l_k,G_LIST_numb,v5,v6
	Dim m_id,m_name_1,m_pic,m_star_1,m_Director_1
	Dim str_page,rsrecordcount,p1
	v3=v
	l_k=s1
	G_LIST_numb=v3_3
	temp_i=1
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	IF Not rs.Eof Then
		rsrecordcount=rs.recordcount	
		rs.pagesize=G_LIST_numb		
		rs.absolutepage=l_k	
		Do While Not rs.Eof And  Cint(temp_i)<=Cint(G_LIST_numb)
			n_id_1=rs("id")
			n_title_1=replace(rs("n_title"),"'","")
			n_color_1=rs("n_color")
			n_hits_1=rs("n_hits")
			n_date_1=rs("n_date")
			n_gotourl_1=rs("n_gotourl")
			n_numb=rs("n_numb")
			n_content=rs("n_content")
			n_type1_1=Get_type1_name3(rs("n_type1"))
			n_type1_1_id=rs("n_type1")
			v4=v3
			
			IF n_color_1<>"" And Not isNUll(n_color_1) Then
				v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1&"{####}"&n_color_1)
			Else
				v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1)
			End IF
			v4=Get_length_CMS_("n_title",v4,n_title_1)
			
			IF Instr(v4,"n_type1_name")>0 Then v4=Get_length_CMS_("m_type1_name",v4,n_type1_1)
			IF Instr(v4,"n_type1_id")>0 Then v4=Get_length_CMS_("n_type1_id",v4,n_type1_1_id)
			
			IF Instr(v4,"n_content")>0 Then v4=Get_length_CMS_("n_content",v4,HTMLEncode12(rs("n_content")))
			
			v4=replace(v4,"{qt:n_hits}",n_hits_1)	
			v4=replace(v4,"{qt:n_id}",n_id_1)	
			'时间格式
			IF Instr(v4,"n_date")>0 Then
				v5=GetContent(v4,"{qt:n_date","}",0)
				v6=GetContent(v4,"{qt:n_date","}",1)
				
				IF Trim(v5)="" Then
					v4=replace(v4,v6,ForMatDate(rs("n_date"),3))
				Else
					IF instr(v5,"|")>0 Then
						v5_1_a=split(v5,"|")
						v5_1_1=v5_1_a(0)
						v5_1_2=v5_1_a(1)
						IF ForMatDate(rs("n_date"),5)=ForMatDate(now(),5) Then
							v5="<font color="&v5_1_2&">"&ForMatDate(rs("n_date"),Trim(v5_1_1))&"</font>"
						Else
							v5=ForMatDate(rs("n_date"),Trim(v5_1_1))
						End IF
					Else
						v5=ForMatDate(rs("n_date"),Trim(v5))
					End IF
					v4=replace(v4,v6,v5)
				End IF
			End IF
			IF Instr(v4,"n_url")>0 Then 
				IF Instr(n_gotourl_1,"http://")>0 And Not Isnull(n_gotourl_1) Then
					v4=replace(v4,"{qt:n_url}",n_gotourl_1)
				Else
					v4=replace(v4,"{qt:n_url}",url_(Array("n",n_id_1,"/")))
				End IF 
			End IF
			IF Instr(v4,"qt:n_i")>0 Then
				v7=GetContent(v4,"{qt:n_i ","}",0)
				v8=GetContent(v4,"{qt:n_i ","}",1)
				v7=StayNub(v7)
				IF v7="" Then 
					v4=replace(v4,"{qt:n_i}",v_i)
				Else
					v7=Clng(v7)
					v4=replace(v4,v8,v7+v_i)
				End IF
			End IF						
		
			Get_sql_n1_News_html=Get_sql_n1_News_html&v4
			temp_i=temp_i+1
			rs.movenext
		Loop
	Else
		Get_sql_n1_News_html="无新闻"
	End IF
	rs.close
End Function

Function Get_DetailNewsContent(id,u1)
	
	Dim v1,t1,t2,t3,v5,v6,m_pic
	Dim p1,p2,p3
	Dim vvv1,vvv2,vvv3
	Dim m_content_detail_1_1,m_content_detail_1_0,m_content_detail_1_2,m_content_detail_1_3,m_content_detail_1_4,m_content_detail_1_1_a,m_content_detail_1_1_ai,m_content_detail_1_1_ai2,m_content_detail_1_2_1,m_content_detail_1_2_2
	v4=u1
	Set rsdetail=server.CreateObject(G_RS)
	rsdetail.open "select * from qingtiandy_News where id="&id,conn,1,1
	IF rsdetail.Eof Then
		Get_DetailNewsContent=""
		Exit Function
	Else
		Timerx "Get_DetailNewsContent_start_1",""
		
		n_id_1=rsdetail("id")
		n_title_1=replace(rsdetail("n_title"),"'","")
		n_color_1=rsdetail("n_color")
		n_hits_1=rsdetail("n_hits")
		n_date_1=rsdetail("n_date")
		n_gotourl_1=rsdetail("n_gotourl")
		n_numb=rsdetail("n_numb")
		n_content=rsdetail("n_content")
		n_type1_1=Get_type1_name3(rsdetail("n_type1"))
		n_type1_1_id=rsdetail("n_type1")
		v4=u1
		
		IF n_color_1<>"" And Not isNUll(n_color_1) Then
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1&"{####}"&n_color_1)
		Else
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1)
		End IF
		v4=Get_length_CMS_("n_title",v4,n_title_1)
		
		IF Instr(v4,"n_type1_name")>0 Then v4=Get_length_CMS_("m_type1_name",v4,n_type1_1)
		IF Instr(v4,"n_type1_id")>0 Then v4=Get_length_CMS_("n_type1_id",v4,n_type1_1_id)
		
		IF Instr(v4,"n_content")>0 Then v4=Get_length_CMS_("n_content",v4,HTMLEncode12(rsdetail("n_content")))
		IF Instr(v4,"n2_content")>0 Then v4=Get_length_CMS_("n2_content",v4,n_content)
		
		v4=replace(v4,"{qt:n_hits}",n_hits_1)	
		v4=replace(v4,"{qt:n_id}",n_id_1)	
		'时间格式
		IF Instr(v4,"n_date")>0 Then
			v5=GetContent(v4,"{qt:n_date","}",0)
			v6=GetContent(v4,"{qt:n_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(rsdetail("n_date"),3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(rsdetail("n_date"),5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(rsdetail("n_date"),Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(rsdetail("n_date"),Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(rsdetail("n_date"),Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		IF Instr(v4,"n_url")>0 Then 
			IF Instr(n_gotourl_1,"http://")>0 And Not Isnull(n_gotourl_1) Then
				v4=replace(v4,"{qt:n_url}",n_gotourl_1)
			Else
				v4=replace(v4,"{qt:n_url}",url_(Array("n",n_id_1,"/")))
			End IF 
		End IF
		IF Instr(v4,"qt:n_i")>0 Then
			v7=GetContent(v4,"{qt:n_i ","}",0)
			v8=GetContent(v4,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,v7+v_i)
			End IF
		End IF		


		Get_DetailNewsContent=v4		
	End IF	
End Function

Function Get_DetailProductContent(id,u1)
	
	Dim v1,t1,t2,t3,v5,v6,m_pic
	Dim p1,p2,p3
	Dim vvv1,vvv2,vvv3
	Dim m_content_detail_1_1,m_content_detail_1_0,m_content_detail_1_2,m_content_detail_1_3,m_content_detail_1_4,m_content_detail_1_1_a,m_content_detail_1_1_ai,m_content_detail_1_1_ai2,m_content_detail_1_2_1,m_content_detail_1_2_2
	v4=u1
	Set rsdetail=server.CreateObject(G_RS)
	rsdetail.open "select * from qingtiandy_Product where id="&id,conn,1,1
	IF rsdetail.Eof Then
		Get_DetailProductContent=""
		Exit Function
	Else
		Timerx "Get_DetailProductContent_start_1",""
		
		n_id_1=rsdetail("id")
		n_title_1=replace(rsdetail("n_title"),"'","")
		n_color_1=rsdetail("n_color")
		n_hits_1=rsdetail("n_hits")
		n_date_1=rsdetail("n_date")
		n_gotourl_1=rsdetail("n_gotourl")
		n_numb=rsdetail("n_numb")
		n_content=rsdetail("n_content")
		n_type1_1=Get_type1_name4(rsdetail("n_type1"))
		n_type1_1_id=rsdetail("n_type1")
		n_jifen=rsdetail("n_jifen")
		n_time=rsdetail("n_time")
		n_numball=rsdetail("n_numball")
		n_numbbuy=rsdetail("n_numbbuy")
		n_pic=rsdetail("n_pic")
		n_gotourl=rsdetail("n_gotourl")
		
		
		v4=u1
		
		IF n_color_1<>"" And Not isNUll(n_color_1) Then
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1&"{####}"&n_color_1)
		Else
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1)
		End IF
		v4=Get_length_CMS_("n_title",v4,n_title_1)
		
		IF Instr(v4,"n_type1_name")>0 Then v4=Get_length_CMS_("m_type1_name",v4,n_type1_1)
		IF Instr(v4,"n_type1_id")>0 Then v4=Get_length_CMS_("n_type1_id",v4,n_type1_1_id)
		
		IF Instr(v4,"n_content")>0 Then v4=Get_length_CMS_("n_content",v4,HTMLEncode12(rsdetail("n_content")))
		IF Instr(v4,"n2_content")>0 Then v4=Get_length_CMS_("n2_content",v4,n_content)
		
		IF Instr(v4,"n_jifen")>0 Then v4=Get_length_CMS_("n_jifen",v4,n_jifen)
		IF Instr(v4,"n_time")>0 Then v4=Get_length_CMS_("n_time",v4,n_time)
		IF Instr(v4,"n_numball")>0 Then v4=Get_length_CMS_("n_numball",v4,n_numball)
		IF Instr(v4,"n_numbbuy")>0 Then v4=Get_length_CMS_("n_numbbuy",v4,n_numbbuy)
		IF Instr(v4,"n_gotourl")>0 Then v4=Get_length_CMS_("n_gotourl",v4,n_gotourl)
		
		IF n_pic<>"" Then
			IF Instr(n_pic,"http://")>0 Then
				v4=Replace(v4,"{qt:n_pic}",n_pic)
			Else
				v4=Replace(v4,"{qt:n_pic}",n_pic)
			End IF
		Else
			v4=Replace(v4,"{qt:n_pic}","")
		End IF
					
		v4=replace(v4,"{qt:n_hits}",n_hits_1)	
		v4=replace(v4,"{qt:n_id}",n_id_1)	
		'时间格式
		IF Instr(v4,"n_date")>0 Then
			v5=GetContent(v4,"{qt:n_date","}",0)
			v6=GetContent(v4,"{qt:n_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(rsdetail("n_date"),3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(rsdetail("n_date"),5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(rsdetail("n_date"),Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(rsdetail("n_date"),Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(rsdetail("n_date"),Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		IF Instr(v4,"n_url")>0 Then 
			IF Instr(n_gotourl_1,"http://")>0 And Not Isnull(n_gotourl_1) Then
				v4=replace(v4,"{qt:n_url}",n_gotourl_1)
			Else
				v4=replace(v4,"{qt:n_url}",url_(Array("n",n_id_1,"/")))
			End IF 
		End IF
		IF Instr(v4,"qt:n_i")>0 Then
			v7=GetContent(v4,"{qt:n_i ","}",0)
			v8=GetContent(v4,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,v7+v_i)
			End IF
		End IF		


		Get_DetailProductContent=v4		
	End IF	
End Function

Function Get_sql_3(v3)
		v3=replace(v3," ","") '
		IF Instr(v3,",")>0 Then
			v3_a=split(v3,",")
			v3_1=v3_a(0) '1表示时间排行，3表示点击排行，0表示ID排行, 4表示推荐排行,5标示汉字A~z排序,6:z~a
			v3_0=v3_a(1) '表示类别，如果是全部类别那就是0，2个或2个以上类别用|分开
			v3_2=v3_a(2) '表示标题,0表示全部，其他直接用汉字
			v3_3=v3_a(3) '表示显示的数目

			IF Ubound(v3_a)=5 Then
				s1=v3_a(4) '页数
				s2=v3_a(5) '关键词
				sql="select  * from qingtiandy_News where id>0 "
			Else
				s1=0
				s2=""
				IF v3_3="0" Then
					sql="select  * from qingtiandy_News where id>0 "
				Else
					IF Instr(v3_3,"|")=0 Then
						vvv4_1=v3_3
						vvv4_2=0
					Else
						vvv4_a=split(v3_3,"|")
						vvv4_1=vvv4_a(0)'实际个数
						vvv4_2=vvv4_a(1)'过滤个数
					End IF
					sql="select top $vvv4_1$ $g_str$  from qingtiandy_News where id>0 "
				End IF
			End IF	


			IF instr(v3_0,"|")>0 Then
				v3_2_a=split(v3_0,"|")
				For i=Lbound(v3_2_a) To Ubound(v3_2_a)
					IF i=0 Then
						sql=sql&" and (n_type1="&v3_2_a(i)
					ElseIF i=Ubound(v3_2_a) Then
						sql=sql&" or n_type1="&v3_2_a(i)&") "
					Else
						sql=sql&" or n_type1="&v3_2_a(i)
					End IF
				Next
			Else
	
				IF v3_0="20000" Then
				Else
					IF v3_0<>"0" Then
						sql=sql&" and n_type1="&v3_0	
					End IF					
				End IF
			End IF

								
			v3_2=Trim(replace(v3_2,"'",""))
			IF v3_2<>"" And  v3_2<>"0" Then sql=sql&" and (n_title like'%"&v3_2&"%') "	
					
			IF v3_1=1 Then
				sql_order=" order by n_date desc,id desc"
			ElseIF v3_1=3 Then
				sql_order=" order by n_hits desc,n_date desc,id desc"
			ElseIF v3_1=4 Then
				sql_order=" order by n_numb desc,n_date desc,id desc"
			ElseIF v3_1=5 Then 	
				sql_order=" order by n_title,id desc"
			ElseIF v3_1=6 Then 	
				sql_order=" order by n_title desc,id asc"						
			Else 
				sql_order=" order by id desc"
			End IF
			
			IF Instr(v3_3,"|")>0 Then
				sql3=replace(replace(sql,"$vvv4_1$",vvv4_2),"$g_str$","id")
				sql4=replace(replace(sql,"$vvv4_1$",vvv4_1),"$g_str$","id")
				sql="Select * from qingtiandy_News where [id] in ("&sql4&sql_order&") And [id] Not in("&sql3&sql_order&")"&sql_order
			Else
				sql=replace(sql,"$vvv4_1$",vvv4_1)
				sql=replace(sql,"$g_str$","*")
				sql=sql&sql_order
			End IF	
			
		End IF		
	Get_sql_3=sql&"|"&v3_3
End Function

Function Get_page_cms(p1,curpage,page_numb,rsrecordcount,page_count,pageurl)
	Dim str_page2,ii,left_url,left_url_2
	str_page3=""
	str_page3=str_page3&"<select onchange='javascript:location.href=this.options[selectedIndex].value' name=page> "
	For ii=1 To page_count
		IF instr(pageurl,"&")=0 Then
			str_page3=str_page3&"<option  value='"&ii&pageurl&"'"
			left_url=""
		Else
			IF G_JING_TAI_Wei<>"" And Instr(pageurl,"#ysearchs")=0 Then
				str_page3=str_page3&"<option  value='"&ii&pageurl&"'"
				left_url=""			
			Else
				str_page3=str_page3&"<option  value='?page="&ii&pageurl&"'"
				left_url="?page="
			End IF
		End IF
		IF ii=curpage Then
			str_page3=str_page3&" selected"
		End IF
		str_page3=str_page3&">"&ii&"</option>"				
	Next
	str_page3=str_page3&"</select>"
	IF instr(pageurl,"&")=0 Then
		left_url_2="window.location=this.value+'"&pageurl&"'"
		left_url=""
	Else
		IF G_JING_TAI_Wei<>"" And Instr(pageurl,"#ysearchs")=0 Then
			left_url_2="window.location=this.value+'"&pageurl&"'"
			left_url=""			
		Else
			left_url_2="window.location='?page='+this.value+'"&pageurl&"'"
			left_url="?page="
		End IF
	End IF
	
	
	'========
	Pager=""
	IF Instr(p1,"{列表页")>0 Then
		Dim ss,iStart,iEnd,Pager,Page_list_1,Page_list_2,Page_list_3
		Dim Page_list_2_1,Page_list_2_2,Page_list_2_a
		Page_list_1=GetContent(p1,"{列表页 ","}",1)
		Page_list_2=GetContent(p1,"{列表页 ","}",0)	
		IF Instr(Page_list_2,",")>0 Then
			Page_list_2_a=SPlit(Page_list_2,",")
			Page_list_2_1=Page_list_2_a(0)
			Page_list_2_2=Page_list_2_a(1)
		Else
			Page_list_2_1=""
			Page_list_2_2=""
		End IF
		
		IF page_numb>18 Then 
			page_numb_ss=18
		Else
			page_numb_ss=page_numb
		End IF
		
		ss=curpage mod (page_numb_ss\2)
		If ss = 0 then ss = page_numb_ss\2
		If curpage <= page_numb_ss\2 then ss = curpage - 1
		iStart = curpage - ss
		iEnd = curpage + page_numb_ss\2 - ss
		If iEnd >= page_count then iEnd = page_count	
		Dim kkk_ii
		kkk_ii=1
		
		For i = iStart To iEnd
			'IF kkk_ii>9 Then Exit For
			If i = clng(curpage) then
				Page_list_3=Page_list_2_1
				Page_list_3=Replace(Page_list_3,"$page",i)	
				Page_list_3=Replace(Page_list_3,"$url",left_url&i&pageurl)			
				Pager = Pager &  Page_list_3
			Else
				Page_list_3=Page_list_2_2
				Page_list_3=Replace(Page_list_3,"$page",i)	
				Page_list_3=Replace(Page_list_3,"$url",left_url&i&pageurl)			
				Pager = Pager &  Page_list_3			
			End if
			kkk_ii=kkk_ii+1
		Next	
		p1=Replace(p1,Page_list_1,Pager)
	End IF	
	'=========
	str_page2="<input type='text' name='page' size='3' onkeydown=""if(event.keyCode==13) {"&left_url_2&"; return false;}"" title='输入数字后,请按Enter键跳转' id='qt_page_s' />"	
	IF Cint(rsrecordcount)>Cint(page_numb) Then
		str_page=p1
		IF curpage=1 Then		
					
		Else
			str_page=replace(str_page,"<!--a","")
			str_page=replace(str_page,"a-->","")
		End IF
		IF Cstr(curpage)=Cstr(page_count) Then
		Else
			str_page=replace(str_page,"<!--b","")
			str_page=replace(str_page,"b-->","")			
		End IF
		str_page=replace(str_page,"{总页数}",page_count)
		str_page=replace(str_page,"{总记录}",rsrecordcount)
		str_page=replace(str_page,"{当前页}",curpage)
		str_page=replace(str_page,"{上一页}",left_url&curpage-1)
		str_page=replace(str_page,"{下一页}",left_url&curpage+1)
		str_page=replace(str_page,"{转到页}",str_page2)
		str_page=replace(str_page,"{下拉页}",str_page3)
		str_page=replace(str_page,"{首页}",left_url&"1")
		str_page=replace(str_page,"{尾页}",left_url&page_count)
		str_page=replace(str_page,"{url}",pageurl)
	Else
		str_page=replace(p1,p1,"")		
	End IF	

	Get_page_cms=str_page

End Function

Function Get_sql_n1_Product(sql,v,s1,s2)
	'sql语句，循环内容，开始ID，结束ID
	Dim n1,n_name_a,n2,v3,v4,v5,v6,v7,v8
	Dim v_i
	Dim v5_1_1,v5_1_2,v5_1_a
	v_i=1
	v3=v	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1
	

	Do While Not rs.Eof
		n_id_1=rs("id")
		n_title_1=replace(rs("n_title"),"'","")
		n_color_1=rs("n_color")
		n_hits_1=rs("n_hits")
		n_date_1=rs("n_date")
		n_gotourl_1=rs("n_gotourl")
		n_numb=rs("n_numb")
		n_content=rs("n_content")
		n_type1_1=Get_type1_name3(rs("n_type1"))
		n_type1_1_id=rs("n_type1")
		v4=v3
		
		IF n_color_1<>"" And Not isNUll(n_color_1) Then
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1&"{####}"&n_color_1)
		Else
			v4=Get_length_CMS_("mntitle_1_color",v4,n_title_1)
		End IF
		v4=Get_length_CMS_("n_title",v4,n_title_1)
		
		IF Instr(v4,"n_type1_name")>0 Then v4=Get_length_CMS_("m_type1_name",v4,n_type1_1)
		IF Instr(v4,"n_type1_id")>0 Then v4=Get_length_CMS_("n_type1_id",v4,n_type1_1_id)
		
		IF Instr(v4,"n_content")>0 Then v4=Get_length_CMS_("n_content",v4,HTMLEncode12(rs("n_content")))
		
		v4=replace(v4,"{qt:n_hits}",n_hits_1)	
		v4=replace(v4,"{qt:n_id}",n_id_1)	
		'时间格式
		IF Instr(v4,"n_date")>0 Then
			v5=GetContent(v4,"{qt:n_date","}",0)
			v6=GetContent(v4,"{qt:n_date","}",1)
			
			IF Trim(v5)="" Then
				v4=replace(v4,v6,ForMatDate(rs("n_date"),3))
			Else
				IF instr(v5,"|")>0 Then
					v5_1_a=split(v5,"|")
					v5_1_1=v5_1_a(0)
					v5_1_2=v5_1_a(1)
					IF ForMatDate(rs("n_date"),5)=ForMatDate(now(),5) Then
						v5="<font color="&v5_1_2&">"&ForMatDate(rs("n_date"),Trim(v5_1_1))&"</font>"
					Else
						v5=ForMatDate(rs("n_date"),Trim(v5_1_1))
					End IF
				Else
					v5=ForMatDate(rs("n_date"),Trim(v5))
				End IF
				v4=replace(v4,v6,v5)
			End IF
		End IF
		IF Instr(v4,"n_url")>0 Then 
			v4=replace(v4,"{qt:n_url}",url_(Array("np",n_id_1,"/")))
		End IF
		IF Instr(v4,"qt:n_i")>0 Then
			v7=GetContent(v4,"{qt:n_i ","}",0)
			v8=GetContent(v4,"{qt:n_i ","}",1)
			v7=StayNub(v7)
			IF v7="" Then 
				v4=replace(v4,"{qt:n_i}",v_i)
			Else
				v7=Clng(v7)
				v4=replace(v4,v8,v7+v_i)
			End IF
		End IF						
		Get_sql_n1_Product=Get_sql_n1_Product&v4
		v_i=v_i+1
		rs.movenext
	Loop
	rs.close
End Function

Function MakeHTML_CMS_Self(str)
	Dim str2,temp_arr_b,str3
	str3=str
	str2=qtcmsdh.J1616_templte_Self(str)

	IF instr(str2,"{$$$}")>0 Then
		str2=left(str2,instrrev(str2,"{$$$}")-1)
		temp_arr_b=split(str2,"{$$$}")	
		For i=Lbound(temp_arr_b) To Ubound(temp_arr_b)
			str3=replace(str3,temp_arr_b(i),GetHTML_CMS_5(temp_arr_b(i)))
		Next 
	End IF
	MakeHTML_CMS_Self=str3
End Function

Function GetHTML_CMS_5(valu)
	Dim u1,ku
	Dim aa,bb
	v1=qtcmsdh.J1616_GetContent(valu,qtcmsdh.J1616_m("16","2","","","","","","","",""),qtcmsdh.J1616_m("16","3","","","","","","","",""),0)
	v1=Trim(v1)
	u1=v1
	aa=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/self/"&u1)))						
	GetHTML_CMS_5=aa
End Function
%>