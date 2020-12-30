package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *	오늘의 운세를 html 형식으로 출력하는 서블릿을 만들어 보세요. 
 * 	오늘의 운세는 필드에 저장된 배열의 내용중에서 1개가 랜덤하게 출력되도록 하세요.
 * 	hint
 * 	Random ran=new Random();
 * 	int index=ran.nextInt(5);
 */

@WebServlet("/sub/fortune")
public class FortuneServlet extends HttpServlet{
	String[] list= {
		"동쪽으로 가면 2 동렬을 만나요",	
		"서쪽으로 가면 3 동렬을 만나요",	
		"남쪽으로 가면 4 동렬을 만나요",	
		"북쪽으로 가면 5 동렬을 만나요",	
		"로또를 사면 2등이 당첨되요",	
	};
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐츠 type 설정(웹브라우저에 어떤 컨텐츠를 응답할 것인지 알려서 준비를 시킨다)
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>오늘의 운세</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		Random ran = new Random();
		int index=ran.nextInt(5);
		
		//얻어낸 문자열을 html 문서에 끼워넣어서 출력한다.
		pw.println("<p> 오늘의 운세 : "+list[index]+" </p>");
		//상대경로로 kim1.png 이미지를 출력하도록 해 보세요.
		pw.println("<img src='../images/kim1.png'/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
