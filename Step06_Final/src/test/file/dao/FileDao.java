package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	//static필드
	private static FileDao dao;	
	//외부에서 객체 생성하지 못하도록 생성자를 private 로
	private FileDao() {}
	//자신의 참조값을 리턴해주는 메소드
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	
	public List<FileDto> getList(FileDto dto){
		List<FileDto> list=new ArrayList<FileDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT *" + 
					"		FROM" + 
					"		    (SELECT result1.*, ROWNUM AS rnum" + 
					"		    FROM" + 
					"		        (SELECT num,writer,title,orgFileName,fileSize,regdate" + 
					"		        FROM board_file" + 
					"		        ORDER BY num DESC) result1)" + 
					"		WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			while (rs.next()) {
				FileDto dto2=new FileDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setOrgFileName(rs.getString("orgFileName"));
				dto2.setFileSize(rs.getLong("FileSize"));
				dto2.setRegdate(rs.getString("regdate"));
				list.add(dto2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}//getList END
	
	//<제목 파일명> 검색인 경우에 파일 목록 리턴
	public List<FileDto> getListTF(FileDto dto){
		List<FileDto> list=new ArrayList<FileDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT *" + 
					"		FROM" + 
					"		    (SELECT result1.*, ROWNUM AS rnum" + 
					"		    FROM" + 
					"		        (SELECT num,writer,title,orgFileName,fileSize,regdate" + 
					"		        FROM board_file"+ 
					"               WHERE title LIKE '%'||?||'%'"+ 
					"               OR orgFileName LIKE '%'||?||'%'" + 
					"		        ORDER BY num DESC) result1)" + 
					"		WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOrgFileName());
			pstmt.setInt(3, dto.getStartRowNum());
			pstmt.setInt(4, dto.getEndRowNum());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			while (rs.next()) {
				FileDto dto2=new FileDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setOrgFileName(rs.getString("orgFileName"));
				dto2.setFileSize(rs.getLong("FileSize"));
				dto2.setRegdate(rs.getString("regdate"));
				list.add(dto2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}//getListTF END

	//<제목> 검색인 경우에 파일 목록 리턴
	public List<FileDto> getListT(FileDto dto){
		List<FileDto> list=new ArrayList<FileDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT *" + 
					"		FROM" + 
					"		    (SELECT result1.*, ROWNUM AS rnum" + 
					"		    FROM" + 
					"		        (SELECT num,writer,title,orgFileName,fileSize,regdate" + 
					"		        FROM board_file"+ 
					"               WHERE title LIKE '%'||?||'%'"+ 
					"		        ORDER BY num DESC) result1)" + 
					"		WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getTitle());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			while (rs.next()) {
				FileDto dto2=new FileDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setOrgFileName(rs.getString("orgFileName"));
				dto2.setFileSize(rs.getLong("FileSize"));
				dto2.setRegdate(rs.getString("regdate"));
				list.add(dto2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}//getListT END
	
	//<작성자> 검색인 경우에 파일 목록 리턴
	public List<FileDto> getListW(FileDto dto){
		List<FileDto> list=new ArrayList<FileDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT *" + 
					"		FROM" + 
					"		    (SELECT result1.*, ROWNUM AS rnum" + 
					"		    FROM" + 
					"		        (SELECT num,writer,title,orgFileName,fileSize,regdate" + 
					"		        FROM board_file"+ 
					"               WHERE writer LIKE '%'||?||'%'"+ 
					"		        ORDER BY num DESC) result1)" + 
					"		WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			while (rs.next()) {
				FileDto dto2=new FileDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setOrgFileName(rs.getString("orgFileName"));
				dto2.setFileSize(rs.getLong("FileSize"));
				dto2.setRegdate(rs.getString("regdate"));
				list.add(dto2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}//getListW END
	
	//업로드된 파일 정보를 저장하는 메소드
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "INSERT INTO board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}//insert END
	
	//파일 하나의 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		//파일정보를 담을 FileDto 지역변수 선언
		FileDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT writer, title, orgFileName,saveFileName,"
					+ " fileSize, regdate"
					+ " FROM board_file"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setInt(1, num);
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			if (rs.next()) {
				dto=new FileDto();
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}//getData END
	
	//파일 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "DELETE FROM board_file"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}//delete END
	
	//<제목 파일명> 검색인 경우의 row 의 개수
	public int getCountTF(FileDto dto) {
		//글의 갯수를 담을 지역변수 
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
					+ " FROM board_file"
					+ " WHERE title LIKE '%'||?||'%'"
					+ " OR orgFileName LIKE '%'||?||'%'";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			/*
			  	[ title 검색 키워드가 "kim" 이라고 가정하면 ]
			  	
			  	1. title LIKE '%' ||?|| '%'
			  	값 바인딩 후
			  	2. title LIKE '%' ||'kim'|| '%'
			  	연결연산 후 아래와 같은 SELECT 문이 구성된다.
			  	3. title LIKE '%kim%'
			  	
			  	따라서 제목에 kim 이라는 문자열이 포함된 row 가 SELECT 된다.
			 */
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOrgFileName());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			if (rs.next()) {
				count=rs.getInt("num");
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
			}
		}
		return count;
	}//getCountTF END 
	
	//제목 검색인 경우의 row 개수
	public int getCountT(FileDto dto) {
		//글의 갯수를 담을 지역변수 
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
					+ " FROM board_file"
					+ " WHERE title LIKE '%'||?||'%'";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getTitle());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			if (rs.next()) {
				count=rs.getInt("num");
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
			}
		}
		return count;
	}//getCountT END
	
	//작성자 검색인 경우의 row 개수
	public int getCountW(FileDto dto) {
		//글의 갯수를 담을 지역변수 
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
					+ " FROM board_file"
					+ " WHERE writer LIKE '%'||?||'%'";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			if (rs.next()) {
				count=rs.getInt("num");
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
			}
		}
		return count;
	}//getCountW END
	
	public int getCount() {
		//글의 갯수를 담을 지역변수 
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
					+ " FROM board_file";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.

			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			if (rs.next()) {
				count=rs.getInt("num");
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
			}
		}
		return count;
	}//getCount END
	
}//class END
