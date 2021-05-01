package diary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class DiaryDAO {// 데이터 베이스 접근 객체의 약자
	private Connection conn;// connection db에 접근하게 해주는 객체
	private ResultSet rs;
	public DiaryDAO() {
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//현재의 시간을 가져오는 함수
	public String getDate() {
		
		String SQL = "SELECT SYSDATE FROM DIARY";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";// 데이터베이스 오류
	}
//DiaryID 게시글 번호 가져오는 함수
	public int getNext() {

		String SQL = "SELECT DIARYNO FROM DIARY ORDER BY DIARYNO DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	public int write(String diaryTitle, String userId, String diaryContent) {
		String SQL = "INSERT INTO DIARY VALUES(?,?,?,to_char(sysdate,'yyyy-mm-dd hh24:mi'),?,?)";
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, diaryTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, diaryContent);
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<Diary> getList(int pageNumber) {
		
		String SQL = "SELECT * FROM (SELECT * FROM DIARY WHERE diaryNo <? and diaryAvailable=1 ORDER BY diaryNo DESC) WHERE ROWNUM<=10";
		
		//Diary에서 나오는 걸 보관할수 있는 인스턴스를 생성
		ArrayList<Diary> list = new ArrayList<Diary>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Diary Diary = new Diary();
				Diary.setDiaryNo(rs.getInt(1));
				Diary.setDiaryTitle(rs.getString(2)); 
				Diary.setUserID(rs.getString(3));
				Diary.setDiaryDate(rs.getString(4));
				Diary.setDiaryContent(rs.getString(5));
				Diary.setDiaryAvailable(rs.getInt(6));
				list.add(Diary);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		  String SQL = "select * from (select * from diary where diaryNo <? and diaryAvailable=1 order by diaryNo desc) where rownum<=10";
		ArrayList<Diary> list = new ArrayList<Diary>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Diary getDiary(int diaryNo) {
		
		String SQL = "SELECT * FROM DIARY WHERE DIARYNO = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, diaryNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Diary Diary = new Diary();
				Diary.setDiaryNo(rs.getInt(1));
				Diary.setDiaryTitle(rs.getString(2));
				Diary.setUserID(rs.getString(3));
				Diary.setDiaryDate(rs.getString(4));
				Diary.setDiaryContent(rs.getString(5));
				Diary.setDiaryAvailable(rs.getInt(6));

				return Diary;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	// 수정 함수
		public int update(int diaryNo, String diaryTitle, String diaryContent) {
			String SQL = "UPDATE diary SET diaryTitle = ?, diaryContent = ? WHERE diaryNo = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, diaryTitle);
				pstmt.setString(2, diaryContent);
				pstmt.setInt(3, diaryNo);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		
		// 삭제 함수
		public int delete(int diaryNo) {
			String SQL = "UPDATE DIARY SET diaryAvailable = 0 WHERE DiaryNo = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, diaryNo);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
	}