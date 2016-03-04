<%
Class Cls_Cache
	Private Obj,ExpireTime,ExpireTimeName,CacheName,Path
	Private Sub Class_initialize()
		Path=Request.Servervariables("url")
		Path=Left(Path,InstrRev(Path,"/"))
	End Sub

	Private Sub Class_Terminate()
	End Sub

	Public Property Get BlEmpty
		If IsEmpty(Obj) Then
			BlEmpty=True
		Else
			BlEmpty=False
		End If
	End Property

	Public Property Get Valid
		If IsEmpty(Obj) Or Not IsDate(ExpireTime) Then
			Valid=False
		ElseIf CDate(ExpireTime)< Now Then
			Valid=False
		Else
			Valid=True
		End If
	End Property

	Public Property Let name(Str)
		CacheName=Str & Path
		Obj=Application(CacheName)
		ExpireTimeName=Str & "expires" & Path
		ExpireTime=Application(ExpireTimeName)
	End Property

	Public Property Let Expires(Tm)
		ExpireTime=Tm
		Application.Lock
		Application(ExpireTimeName)=ExpireTime
		Application.UnLock
	End Property

	Public Sub add(Var,Expire)
		If IsEmpty(Var) Or Not IsDate(Expire) Then
			Exit Sub
		End If
		Obj=Var
		ExpireTime=Expire
		Application.Lock
		Application(CacheName)=Obj
		Application(ExpireTimeName)=ExpireTime
		Application.UnLock
	End Sub

	Public Property Get Value
		If isEmpty(Obj) Or Not IsDate(ExpireTime) Then
			Value=Null
		ElseIf CDate(ExpireTime)<Now Then
			Value=Null
		Else
			Value=Obj
		End If
	End Property

	Public Sub makeEmpty()
		Application.Lock
		Application(CacheName)=Empty
		Application(ExpireTimeName)=Empty
		Application.UnLock
		Obj=Empty
		ExpireTime=Empty
	End Sub

	Public Function Equal(Var2)
		If Typename(Obj)<>Typename(Var2) Then
			Equal=False
		ElseIf Typename(Obj)="Object" Then
			If Obj is Var2 Then
				Equal=True
			Else
				Equal=False
			End If
		ElseIf Typename(Obj)="Variant()" Then
			If Join(Obj,"^")=Join(Var2,"^") Then
				Equal=True
			Else
				Equal=False
			End If
		Else
			If Obj=Var2 Then
				Equal=True
			Else
				Equal=False
			End If
		End If
	End Function

	Public Function GetallCache()
		Dim Cacheobj
		For Each Cacheobj in Application.Contents
			GetallCache = GetallCache & Cacheobj & ","
		Next
	End Function

	Public Sub DelCahe(MyCaheName)
		Application.Lock
		Application.Contents.Remove(MyCaheName)
		Application.unLock
	End Sub

	Public Sub InnerHtml(obj,msg)
		Response.Write "<li>"&msg&"</li>"
		Response.Flush
	End Sub
End Class
%>