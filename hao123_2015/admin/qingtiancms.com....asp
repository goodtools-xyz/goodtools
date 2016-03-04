<LINK href="css/style.css" rel=stylesheet type=text/css>
<script>
 var sett;
 var i=1;
function $(id){return document.getElementById(id)}
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){
if (i%2==1)
	clearTimeout(sett)
else
	scrollWindow();
	i++;
}
document.ondblclick=scrollWindow2;
</script>
<%
Response.Buffer = True

Sub RemoveAllCache()
	Dim cachelist,i
	Call InnerHtml("UpdateInfo","<b>开始执行清理当前站点缓存</b>：")
	Cachelist=split(GetallCache(),",")	
	If UBound(cachelist)>0 Then
		For i=0 to UBound(cachelist)-1
		   DelCahe Cachelist(i)
		   Call InnerHtml("UpdateInfo","更新 <b>"&cachelist(i)&"</b> 完成")
		Next
		Call InnerHtml("UpdateInfo","更新了"& UBound(cachelist) &"个缓存对象<br>")
	Else
		Call InnerHtml("UpdateInfo","<b>当前站点全部缓存清理完成。</b>")
	End If
End Sub

Function GetallCache()
	Dim Cacheobj
	For Each Cacheobj in Application.Contents
		GetallCache = GetallCache & Cacheobj & ","
	Next
End Function

Sub DelCahe(MyCaheName)
	Application.Lock
	Application.Contents.Remove(MyCaheName)
	Application.unLock
End Sub

Sub InnerHtml(obj,msg)
	Response.Write "<li>"&msg&"</li>"
	Response.Flush
End Sub
RemoveAllCache()

%>