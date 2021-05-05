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


}