<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 한글 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//2. 수정할 회원의 번호, 이름, 주소 를 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));	
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//3. MemberDto 객체에 수정할 회원의 정보를 담는다.
	MemberDto dto=new MemberDto(num, name, addr);
	
	//4. DB에 수정 반영하기
	MemberDao dao=MemberDao.getInstance();
	boolean isupdate=dao.updateDto(dto);	
	//5. 응답하기
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isupdate){ %>
		<!--  <p><%=num%> 번 회원의 정보가 수정되었습니다. <a href="list.jsp">확인</a></p>-->
		<script>
			alert("<%=num%> 번 회원의 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("회원 정보 수정실패!");
			location.href="list.jsp";
		</script>
		<!--  <p>수정을 실패 하였습니다. <a href="updateform.jsp">다시 수정하기</a></p>-->	
	<%} %>
</body>
</html>