package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.gallery.dto.GalleryDto;
import test.util.DbcpBean;

public class GalleryDao {
	private static GalleryDao dao;
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao==null) {
			dao=new GalleryDao();
		}
		return dao;
	}
	//업로드된 사진 하나의 정보를 저장하는 메소드
	public boolean insert(GalleryDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "INSERT INTO board_gallery"
					+ " VALUES(board_gallery_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getCaption());
			pstmt.setString(3, dto.getImagePath());
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
	
	//업로드된 모든 사진의 정보를 리턴하는 메소드
		public List<GalleryDto> getList(){
			List<GalleryDto> list=new ArrayList<GalleryDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				//select 문 작성
				String sql = "SELECT num,writer,caption,imagePath,regdate"
						+ " FROM board_gallery"
						+ " ORDER BY num DESC";
				pstmt = conn.prepareStatement(sql);
				// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
				//select 문 수행하고 ResultSet 받아오기
				rs = pstmt.executeQuery();
				//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
				while (rs.next()) {
					GalleryDto dto=new GalleryDto();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setCaption(rs.getString("caption"));
					dto.setImagePath(rs.getString("imagePath"));
					dto.setRegdate(rs.getString("regdate"));
					list.add(dto);
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
			return list;
	}//getList END
}
