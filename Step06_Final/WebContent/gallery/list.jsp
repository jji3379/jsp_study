<%@page import="java.util.List"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디가 있는지 읽어와본다 (로그인을 하지 않았으면 null 이다)
	String id=(String)session.getAttribute("id");
	
	//Gallery 목록 얻어오기
	List<GalleryDto> list=GalleryDao.getInstance().getList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<a href="private/upload_form.jsp">사진 업로드 하러 가기</a>
	<h1>갤러리 목록 입니다.</h1>
	<div class="row">
		<%for(GalleryDto tmp:list){ %>
		<div class="col-6 col-md-3">
			<div class="card">
				<a href="detail.jsp?num=<%=tmp.getNum()%>">
					<img class="card-img-top" src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>"/>
				</a>
				<div class="card-body">
	   				<p class="card-text"><%=tmp.getCaption()%></p>
	   				<p class="card-text">by <strong><%=tmp.getWriter()%></strong></p>
	  				<p><small><%=tmp.getRegdate()%></small></p>
	  			</div>
			</div>
		</div>
		<%} %>
	</div>
</div>
</body>
</html>