<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	jsp 페이지 안에서의 주석 입니다.
	여기 작성한 내용은 jsp 페이지가 해석하지 않습니다.
	클라이언트 웹브라우저에 출력되지 않습니다.
--%>

<%--
	특정 jsp 페이지에 포함 시킬 내용을 jsp 페이지에 작성할 수 있습니다.
	
--%>
<%
	// "thisPage" 라는 파라미터 명으로 전달된 문자열 읽어오기
	String thisPage=request.getParameter("thisPage");
	//NullPointerException 방지 (500번 버스 안타기)
	if(thisPage==null){
		thisPage="";
	}
%>

<nav class="navbar navbar-dark bg-primary navbar-expand-sm">
	<div class="container">	
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<img style="width:30px; height:30px" src="${pageContext.request.contextPath}/images/kim1.png" alt="" />
		Acorn</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav">
				<li class="nav-item <%=thisPage.equals("member") ? "active" : "" %>">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/list.jsp">회원 목록</a>
				</li>
				<li class="nav-item <%=thisPage.equals("todo") ? "active" : "" %>">
					<a class="nav-link" href="${pageContext.request.contextPath}/todo/list.jsp">할일 목록</a>
				</li>
			</ul> 
		</div>
	</div>
</nav>
<!-- 
	여기도 주석이긴 하지만 
	여기 작성한 내용은 그대로 클라이언트에게 출력됩니다.
	클라이언트 웹브라우저는 여기 작성한 내용을 해석하지 않습니다.
 -->