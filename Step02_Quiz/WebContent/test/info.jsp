<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //DB에 저장된 내용 불러오기
   
   String nick=request.getParameter("nick");
   String email=null;
   String concern=null;
   String lan=null;
   String comment=null;
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   try {
      conn = new DbcpBean().getConn();
      String sql = "SELECT email, concern, lan, comm"
            +" FROM form_test"
            +" WHERE nick=?";
      pstmt = conn.prepareStatement(sql);
      // ? 에 바인딩 할게 있으면 여기서 바인딩
      pstmt.setString(1,nick);
      //select 문 수행하고 ResultSet 받아오기
      rs = pstmt.executeQuery();
      //반복문 돌면서 ResultSet 에서 data 추출
      if(rs.next()) {
         email=rs.getString("email");
         concern=rs.getString("concern");
         lan=rs.getString("lan");
         comment=rs.getString("comm");
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
         try {
             if (rs != null)
                rs.close();
             if (pstmt != null)
                pstmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
             e.printStackTrace();
          }
    }
   
   //lan 은 null이거나 혹은 "Java" or "Java,Python" or "Java,Python,C++"...형식
   String[] language=null;
   
   if(lan!=null){
      language=lan.split(",");
   }
   
   List<String> languageList=new ArrayList<>();
       if(language!=null){
          for(String tmp:language){
             languageList.add(tmp);
       }  
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>DB에서 불러온 내용</h1>
   <form action="signup.jsp" method="post">
      닉네임<input type="text" name="nick" value="<%=nick%>"/><br />
      이메일 수신 여부
      <%if(email.equals("yes")) {%>
      <label>
         <input type="radio" name="email" value="yes" checked />네
      </label>
      <label>
         <input type="radio" name="email" value="no" />아니오
      </label><br /> 
      <%} else {%>
      <label>
         <input type="radio" name="email" value="yes"/>네
      </label>
      <label>
         <input type="radio" name="email" value="no" checked/>아니오
      </label><br /> 
      <%} %>
      이메일수신여부
      
      <label>
         <input type="radio" name="email" value="yes" <%if(email.equals("yes")) {%>checked<%}%>/>네
      </label>
      <label>
         <input type="radio" name="email" value="no"<%if(email.equals("no")) {%>checked<%}%> />아니오
      </label>
      <br /> 
      이메일 수신 여부 
      <label>
         <input type="radio" name="email" value="yes" <%=email.equals("yes") ? "checked" : "" %>/>네
      </label>
      <label>
         <input type="radio" name="email" value="no" <%=email.equals("no") ? "checked" : "" %>/>아니오
      </label>
      
      <br />
      관심사 
      <br />
      <select name="concern">
         <option>선택</option>
         <option value="game" <%if(concern.equals("game"))%>selected>게임</option>
         
         <option value="movie" <%if(concern.equals("movie"))%>selected>영화</option>
         
         <option value="etc" <%if(concern.equals("etc"))%>selected>기타</option>
      </select>
      <br />
      배우고 싶은 언어 
      <label>
         <input type="checkbox" name="language" value="Java" <%=languageList.contains("Java") ? "checked": "" %>/>자바
      </label>
      
      <label>
         <input type="checkbox" name="language" value="C++" <%=languageList.contains("C++") ? "checked": "" %>/>c언어
      </label>

      <label>
         <input type="checkbox" name="language" value="Python" <%=languageList.contains("Python") ? "checked": "" %>/>파이썬
      </label>
      <br />
      남기고 싶은 말
      <br />
      <textarea name="comment"  cols="30" rows="10"><%=comment %></textarea>
      <br />
      <button type="submit">가입</button>
   </form>

</body>
</html>