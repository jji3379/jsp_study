<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
		아래의 링크가 동작하도록 해 보세요.
		목록보기, 추가, 수정, 삭제 기능을 모두 구현 하세요.
		test.todo.dto
		test.todo.dao 패키지도 만들고 TodoDto TodoDao 만드세요. NUM, CONTENT, REGDATE
		모두 구현후 bootstrap css 도 모든 페이지에 적용 시켜 보세요.
	 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/resource.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대 경로로 page 의 value 로 명시 해야한다. --%>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<!-- 
		nav 요소는 div 요소에 의미를 더한 요소이다.
		-navigation 요소를 포함하고 있다고 알려준다.
	 -->
	 <!-- 
	 	배경색이 어두운색 계열이면 navbar-dark
	 	배경색이 밝은색 계열이면 navbar-light 클래스를 추가 해야한다.
	  -->
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="todo/list.jsp">리스트 보기</a></li>
	</ul>
</div>
</body>
</html>