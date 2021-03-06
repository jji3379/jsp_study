<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/ajax05.jsp</title>
</head>
<body>
	<h1>ajax POST 전송 예제 </h1>
	<input type="text" id="inputName" placeholder="이름 입력..." />
	<input type="text" id="inputAddr" placeholder="주소 입력..." />
	<button id="sendBtn">전송</button>
	<script>
		/*
			1. 전송버튼을 누르면 이름과 주소를 읽어와서
			
			2. add.jsp 페이지에 ajax 전송하고
			
			3. add.jsp 페이지에서는 전송된 내용을 콘솔에 출력하고
			
			4. added! 라는 문자열을 add.jsp 페이지에서 응답하는 프로그래밍을 해보세요.
		*/
			document.querySelector("#sendBtn")
			.addEventListener("click",function(){
				//입력한 문자열 읽어오기
				let name=document.querySelector("#inputName").value;
				let addr=document.querySelector("#inputAddr").value;
				//query 문자열 구성하기 (임시)
				let queryString="name="+encodeURIComponent(name)
					+"&addr="+encodeURIComponent(addr);
				//fetch() 함수를 이용해서 ajax POST 방식 파라미터로 전달하기
				/*
					[ POST ] 방식으로 전송하기 위해서는
					1. method 를 "POST"
					2. 요청 헤더 정보 제공
					3. 전송할 데이터를 query 문자열로 구성해서 요청의 몸통(body) 에 전달한다.
				*/
				fetch("add.jsp",{
					method:"POST",
					headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
					body:queryString
				})
				.then(function(response){
					return response.text();
				})
				.then(function(data){
					console.log(data);
				});
			});
	</script>
</body>
</html>