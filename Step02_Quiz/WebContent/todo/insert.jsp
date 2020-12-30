<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	//한글 깨지지 않도록 인코딩
	request.setCharacterEncoding("utf-8"); 
	//폼 전송되는 파라미터 추출
	String content=request.getParameter("content"); //form에서 name 값
	//DB에 저장할 내용을 dto에 추가하기
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	//dao를 이용해서 DB에 저장한다. insert 하기
	TodoDao dao=TodoDao.getInstance();
	boolean isInsert=dao.insert(dto);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isInsert){ %>
		<script>
			//javascript 를 클라이언트에게 로딩시켜서 페이지 이동 시키기		
			location.href="${pageContext.request.contextPath}/todo/list.jsp";	
		</script>
	<%}else{ %>
		<p> 할일 추가 실패! <a href="insertform.jsp">다시 추가하러 가기</a></p>
	<%} %>
</body>
</html>