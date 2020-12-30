package test.friend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import test.friend.dto.FriendDto;
import test.util.DbcpBean;

public class FriendDao {
	  private static FriendDao dao;
	  private FriendDao() {}
	  public static FriendDao getInstance() {
		if(dao==null) { 
			dao=new FriendDao(); 
		}
		return dao;
	  }
	  
	  public boolean insert(FriendDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag=0;
			try {
				conn = new DbcpBean().getConn();
				
				String sql = "INSERT INTO friend"
						+ " (num, name, phone)"
						+ " VALUES(friend_seq.NEXTVAL, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getPhone());
				flag=pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				try{
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception e) {}
			}
			if(flag>0) {
				return true;
			}else {
				return false;
			}
		}
}
