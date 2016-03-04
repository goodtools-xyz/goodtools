<%
if request.querystring<>"" then call Sql_stophacker(request.querystring,"'|\b(alert|confirm|prompt)\b|<[^>]*?>|^\+/v(8|9)|\bonmouse(over|move)=\b|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")
if Request.ServerVariables("HTTP_REFERER")<>"" then call Sql_stophacker2(Request.ServerVariables("HTTP_REFERER"),"'|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")
if request.Cookies<>"" then call Sql_stophacker(request.Cookies,"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)") 
call Sql_stophacker(request.Form,"^\+/v(8|9)|\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|<\s*img\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")




function Sql_stophacker(values,re)
	dim l_get, l_get2,n_get,regex,IP
 	for each n_get in values
  		for each l_get in values
   			l_get2 = values(l_get)
   			set regex = new regexp
   			regex.ignorecase = true
   			regex.global = true
   			regex.pattern = re
   			if regex.test(l_get2) then
            	IP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
                If IP = "" Then 
                	IP=Request.ServerVariables("REMOTE_ADDR")
                end if
    			Response.Write("<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>您的提交带有不合法参数,谢谢合作!</div>")
    			Response.end
  			end if
   			set regex = nothing
  		next
	 next
end function 


function Sql_stophacker2(values,re)
	dim regex
  	set regex=new regexp
  	regex.ignorecase = true
  	regex.global = true
  	regex.pattern = re
  	if regex.test(values) then
    	IP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If IP = "" Then 
        	IP=Request.ServerVariables("REMOTE_ADDR")
        end if
    	Response.Write("<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>您的提交带有不合法参数,谢谢合作!</div>")
   	 Response.end
   end if
   set regex = nothing
end function 
%>