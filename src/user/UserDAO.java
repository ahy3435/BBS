package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {

	private Connection conn; //자바와 데이터베이스를 연결하는 하나의 체
	private PreparedStatement pstmt; //하나의 정보를 담을 수 있는 하나의 객체
	private ResultSet rs; //결과값 받아오기

	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부분

	public UserDAO() { //mysql에 접속할 수 있도록 도와줌
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root"; //db계정
			String dbPassword = "suho0522"; //db비번
			//driver는 mysql에 접속할 수 있도록 도와주는 하나의 매개체
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace(); //오류가 무엇인지 출력
		}
	}

	//실제로 로그인을 시도하는 함수
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치			 
			}
			return -1; //아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류 의미
	}
	
	//회원가입 기능 담당하는 join 메소드 추가
	public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
	
	
	
}