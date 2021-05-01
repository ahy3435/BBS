package mini;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class miniUserDAO {

	public miniUserDAO() {}

	public int joinUser(MiniUser user) {
		String sql = null;
		int result = 0;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();
			sql = "insert into miniuser (userid,userpwd,username,email,gender) values(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getGender());
		    result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();			
		}catch (Exception e) {
			e.printStackTrace();
		}return result;

	}

	public int loginUser(String userId, String userPwd) {
		int result = 0;
		String sql = null;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();
			sql = "select userId, userPwd from miniuser";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(userId.equals(rs.getString(1))&&userPwd.equals(rs.getString(2))){
					result = 1;
				}
				else if(!userId.equals(rs.getString(1))||!userPwd.equals(rs.getString(2))) {
					result=2;
				}

			}	
			pstmt.close(); rs.close(); conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}return result;


	}
	public MiniUser isUser(String userId) {
		String sql = null;
		
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();
			MiniUser user = new MiniUser();
			sql = "SELECT * FROM MINIUSER WHERE USERID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				user.setUserId(rs.getString(1));
				user.setUserPwd(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setImg(rs.getString(6));
				user.setInfotext(rs.getString(7));
				
			}
			return user;
			
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
		
	}
}