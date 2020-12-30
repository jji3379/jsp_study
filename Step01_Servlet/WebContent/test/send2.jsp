<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/send2.jsp</title>
</head>
<body>
<%
	//한글 깨지지 않게
	request.setCharacterEncoding("utf-8");
	String msg=request.getParameter("msg");
	System.out.println("입력한 내용: "+msg);
%>
<p>ㄷㄷㄷㅈ</p>
</body>
</html>