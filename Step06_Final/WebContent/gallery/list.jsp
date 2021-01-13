<%@page import="java.util.List"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=8;
	//하단 페이지를 몇개씩 표시할 것인지 
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1 이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum!=null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;

	//startRowNum 과 endRowNum 을 GalleryDto 객체에 담고
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	//GalleryDao 객체를 이용해서 회원 목록을 얻어온다.
	List<GalleryDto> list=GalleryDao.getInstance().getList(dto);
	
	
	int startPageNum=1+ ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 row 의 개수
	int totalRow=GalleryDao.getInstance().getCount();
	//전체 페이지의 개수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정을 해준다.
	}	

	//로그인된 아이디가 있는지 읽어와본다 (로그인을 하지 않았으면 null 이다)
	String id=(String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<!-- 
	jquery 플러그인 imgLiquid.js 로딩하기
	-반드시 jquery.js 가 먼저 로딩이 되어 있어야지만 동작한다.
	-사용법은 이미지의 부모 div 크기를 결정하고 이미지를 선택해서 .imgLiquid() 동작을 하면된다.
 -->
<script src="${pageContext.request.contextPath}/js/imgLiquid.js"></script>
<style>
	/*card 이미지 부모요소의 높이 지정*/
	.img-wrapper{
		height:250px;
		/*transform 을 적용할 때 0.3s 동안 순차적으로 적용하기*/
		transition: transform 20s ease-out;
	}
	.img-wrapper:hover{
		/*월본 크기의 1.1 배로 확대 시키기*/
		transform: rotateZ(10000deg) scale(1.0);
	}
	/*한줄만 text가 나오고 한줄 넘는 길이에 대해서는 ...처리 하는 css*/
	.card .card-text{
		display:block;
		white-space :nowrap;
		text-overflow:ellipsis;
		overflow:hidden;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<a href="private/upload_form.jsp">사진 업로드 하러 가기</a><br />
	<a href="private/ajax_form.jsp">사진 업로드 하러 가기2</a>
	<h1>갤러리 목록 입니다.</h1>
	<div class="row">
		<%for(GalleryDto tmp:list){ %>
		<!--
			[ 칼럼의 폭을 반응형으로 ] 
			device 폭 768px 미만에서 칼럼의 폭 => 6/12 (50%)
			device 폭 768px ~ 992px 에서 칼럼의 폭 => 4/12 (33.333%)
			device 폭 992px 이상에서 칼럼의 폭 => 3/12 (25%)
		-->
		<div class="col-6 col-md-4 col-lg-3">
			<div class="card mb-3">
				<a href="detail.jsp?num=<%=tmp.getNum()%>">
					<div class="img-wrapper">					
						<img class="card-img-top" src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>"/>
					</div>
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
	<nav>
		<ul class="pagination justify-content-center">
			<%if(startPageNum != 1) {%>
			<li class="page-item">
				<a href="list.jsp?pageNum=<%=startPageNum-1 %>" class="page-link">Prev</a>
			</li>			
			<%}else{ %>
			<li class="page-item disabled">
				<a href="javascript:" class="page-link">Prev</a>
			</li>			
			<%} %>
			<%for(int i=startPageNum;  i<=endPageNum; i++) {%>
				<%if(i==pageNum) {%>
					<li class="page-item active">
						<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					</li>				
				<%}else{ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum<totalPageCount) {%>
			<li class="page-item">
				<a href="list.jsp?pageNum=<%=endPageNum+1 %>" class="page-link">Next</a>
			</li>			
			<%}else{ %>
			<li class="page-item disabled">
				<a href="javascript:" class="page-link">Next</a>
			</li>			
			<%} %>
		</ul>
	</nav><!-- page개수 만들기 END -->
</div>
<script>
	// card 이미지의 부모 요소를 선택해서 imgLiquid 동작(jquery plugin 동작) 하기
	$(".img-wrapper").imgLiquid();
</script>
</body>
</html>