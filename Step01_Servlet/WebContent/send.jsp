<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/send.jsp</title>
</head>
<body>
<%
	//클라이언트가 폼 전송한 파라미터를 읽어와서
	String a=request.getParameter("msg");
	//콘솔창에 출력하기
	System.out.println("msg: "+a);
%>
	<p>클라이언트야 메세지 잘 받았오~</p>
</body>
</html>