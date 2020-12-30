<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="test.util.DbcpBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	
	//DB 에 저장하기
	
	//체크 박스에 체크된 내용을 DB에 저장하기 위해서 가공하기
	String lan=null;
	if(language !=null){
		//일단 빈 문자열을 넣어주고
		lan="";
		for(int i=0; i<language.length; i++){
			//만일 i 가 배열의 마지막 인덱스가 아니라면
			if(i!=language.length-1){
				//lan 에 문자열을 이어 붙이고 뒤에 , 를 붙인다.
				lan+=language[i]+",";
			}else{
				//마지막 인덱스이면 lan 에 문자열을 이어 붙이고 뒤에, 는 붙이지 않는다.
				lan+=language[i];
			}
		}
	}

		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "INSERT INTO form_test"
					+ " (nick, email, concern, lan, comm)"
					+ " VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, nick);
			pstmt.setString(2, email);
			pstmt.setString(3, concern);
			pstmt.setString(4, lan);
			pstmt.setString(5, comment);
			flag=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try{
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="info.jsp">DB에 저장된 내용 불러오기</a>

	<h1>폼에 입력한 내용</h1>
	<form action="signup.jsp" method="post">
		닉네임<input type="text" name="nick"/><br />		
		이메일 수신여부
			<label>
				<input type="radio" name="email" value="yes" /> 네
			</label>			
			<label>
				<input type="radio" name="email" value="no"/> 아니요
			</label>
		<br />
		
		관심사 <select name="concern">
			<option value="">선택</option>
			<option value="game">게임</option>
			<option value="movie">영화</option>
			<option value="etc">기타</option>
		</select>
		<br />
		
		배우고 싶은 언어 체크
		<label>
			<input type="checkbox" name="language" value="Java"/> 자바
		</label>
		<label>
			<input type="checkbox" name="language" value="Python"/> 파이썬
		</label>
		<label>
			<input type="checkbox" name="language" value="C++"/> C++
		</label>
		<br />
		
		남기고 싶은 말
		<textarea name="comment" cols="30" rows="10"></textarea>
		<br />
		<button type="submit">가입</button>
	</form>
</body>
</html>