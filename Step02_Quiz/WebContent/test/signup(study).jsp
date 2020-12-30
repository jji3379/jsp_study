<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원가입폼에 입력한 내용을 하나하나 모두 추출해서 콘솔창에 출력해 보세요.
	request.setCharacterEncoding("utf-8");
	//닉네임 값 추출
	String nick=request.getParameter("nick");
	System.out.println("닉네임 : "+nick);
	//이메일 값 추출
	String email=request.getParameter("email");
	String email2=request.getParameter("email2");
	String email3=request.getParameter("email3");
	System.out.println("이메일 : "+email);
	//관심사 값 추출
	String concern=request.getParameter("concern");
	System.out.println("관심사 : "+concern);
	//배우고 싶은 언어 추출
	String[] language=request.getParameterValues("language");
	System.out.println("----------------");
	
	//체크박스의 value 를 저장할 ArrayList 객체 생성
	List<String> languageList=new ArrayList<>();
	
	//만일 체크박스를 하나라도 체크 했다면
	if(language!=null){
		for(String tmp:language){
			System.out.println(tmp);
			//ArrayList 객체에 value 를 담는다.
			languageList.add(tmp);
		}
	}
	//남기고 싶은 말 추출
	String comment=request.getParameter("comment");
	System.out.println("남기고 싶은 말 : "+comment);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
</head>
<body>
	<h1>폼에 입력한 내용</h1>
	<form action="signup.jsp" method="post">
		닉네임<input type="text" name="nick" value="<%=nick%>"/><br />		
		이메일 수신여부1<!-- if/else -->
		<%if(email.equals("yes")){%>
			<label>
				<input type="radio" name="email" value="yes" checked/> 네
			</label>			
			<label>
				<input type="radio" name="email" value="no"/> 아니요
			</label>
		<%}else{%>
			<label>
				<input type="radio" name="email" value="yes"/> 네
			</label>			
			<label>
				<input type="radio" name="email" value="no" checked/> 아니요
			</label>
		<%} %>
		<br />
		이메일 수신여부2 <!-- >checked< -->
			<label>
				<input type="radio" name="email2" value="yes" 
				<%if(email2.equals("yes")){ %>checked<%} %>/> 네
			</label>			
			<label>
				<input type="radio" name="email2" value="no"
				<%if(email2.equals("no")){ %>checked<%} %>/> 아니요
			</label>
			<br />
		이메일 수신여부3<!-- 3항 연산자 -->
			<label>
				<input type="radio" name="email3" value="yes" 
				<%=email3.equals("yes")?"checked":"" %>/> 네
			</label>			
			<label>
				<input type="radio" name="email3" value="no"
				<%=email3.equals("no")?"checked":"" %>/> 아니요
			</label>
		<br />
		관심사 <select name="concern">
			<option value="">선택</option>
			<option value="game"
			<%=concern.equals("game") ? "selected" :"" %>
			>게임</option>
			<option value="movie"
			<%=concern.equals("movie")?"selected":"" %>
			>영화</option>
			<option value="etc"
			<%=concern.equals("etc")?"selected":"" %>
			>기타</option>
		</select>
		<br />
		배우고 싶은 언어 체크
		<label>
			<input type="checkbox" name="language" value="Java"
			<%=languageList.contains("Java") ? "checked" : "" %>
			/> 자바
		</label>
		<label>
			<input type="checkbox" name="language" value="Python"
			<%=languageList.contains("Python") ? "checked" : "" %>/> 파이썬
		</label>
		<label>
			<input type="checkbox" name="language" value="C++"
			<%=languageList.contains("C++") ? "checked" : "" %>
			/> C++
		</label>
		<br />
		남기고 싶은 말
		<textarea name="comment" cols="30" rows="10"><%=comment%></textarea>
		<br />
		<button type="submit">가입</button>
	</form>
</body>
</html>