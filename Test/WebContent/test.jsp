<%@page import="test.friend.dao.FriendDao"%>
<%@page import="test.friend.dto.FriendDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		FriendDto dto=new FriendDto();
		FriendDao dao=FriendDao.getInstance();
		
		dto.setName("a");
		dto.setPhone("b");
		dao.insert(dto);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>냐옹</h1>
</body>
</html>