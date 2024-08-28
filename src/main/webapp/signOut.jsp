<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie[] cookie = request.getCookies();

for(Cookie item:cookie){
	if("shopping".equals(item.getName())){
		item.setMaxAge(0);
		response.addCookie(item);
	}
}
%>
<script>
	location.href = "index.do"
</script>