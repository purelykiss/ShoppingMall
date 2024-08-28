<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("message");
	System.out.println("온 메세지"+message);
	pageContext.setAttribute("message", message);
%>
<!DOCTYPE html>
<html>
<script>
	alert("${message}")
	location.href = "index.do"
</script>
</html>