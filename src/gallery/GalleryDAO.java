package gallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GalleryDAO {

	private Connection conn;
	private ResultSet rs;
	final int galleryInPage = 3;

	public GalleryDAO() {
		try {

			 String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; 
			 String dbID ="scott";
			 String dbPassword = "tiger";
			 Class.forName("oracle.jdbc.OracleDriver"); 
			 conn =DriverManager.getConnection(dbURL, dbID, dbPassword);

			System.out.println("갤러리 연결완료");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

	public int getNext() { // 
		String SQL = "select galleryID from gallery order by galleryID DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // if not exist
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB Error
	}

	public int gallerywrite(String userId, String galleryTitle, String galleryContent, String galleryImagename) {
		String SQL = "insert into gallery values (?,?,to_date(sysdate,'yyyy-mm-dd hh24:mi'),?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userId);
			pstmt.setString(3, galleryTitle);
			pstmt.setString(4, galleryContent);
			pstmt.setString(5, galleryImagename);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return -1; // DB Error
	}
	
	public ArrayList<Gallery> getList(String userId, int pageNumber) {
		// user, pageNumber
		String SQL = String.format("select * from gallery where userId = ? and galleryId < ? and galleryAvailable = 1 and ROWNUM <=%d order by galleryId desc", galleryInPage);

		ArrayList<Gallery> list = new ArrayList<Gallery>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setInt(2, getNext() - (pageNumber - 1) * galleryInPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Gallery gallery = new Gallery();
				
				gallery.setGalleryId(rs.getInt(1));
				gallery.setUserId(rs.getString(2));
				gallery.setGalleryDate(rs.getString(3));
				gallery.setGalleryTitle(rs.getString(4));
				gallery.setGalleryContent(rs.getString(5));
				gallery.setGalleryImagename(rs.getString(6));
				gallery.setGalleryAvailable(rs.getInt(7));
				
				
				list.add(gallery);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // DB Error
	}

	public boolean nextPage(String userId, int pageNumber) {
		String SQL = "select count(*) from gallery where userId = ? and galleryAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			int numGallery = rs.getInt(1);
			
			if(numGallery > (pageNumber-1) * galleryInPage) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // if not exist next page
	}	
		
	public Gallery getGallery(int galleryID) {
		String SQL = "select * from gallery where galleryId = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, galleryID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Gallery gallery = new Gallery();
				
				gallery.setGalleryId(rs.getInt(1));
				gallery.setUserId(rs.getString(2));
				gallery.setGalleryDate(rs.getString(3));
				gallery.setGalleryContent(rs.getString(4));
				gallery.setGalleryContent(rs.getString(5));
				gallery.setGalleryImagename(rs.getString(6));
				gallery.setGalleryAvailable(rs.getInt(7));			
				
				return gallery;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // Invalid
	}

	public int galleryupdate(int galleryID, String galleyrTitle, String galleryContent, String galleryImagename) {
		String sql = "update gallery set galleryTitle = ?, galleryContent = ? , galleryImagename= ? where galleryID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, galleyrTitle);
			pstmt.setString(2, galleryContent);
			pstmt.setString(3, galleryImagename);
			pstmt.setInt(4, galleryID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return -1; // DB Error
	}

	public int gallerydelete(int galleryID) {
		String sql = "update gallery set galleryAvailable = 0 where galleryID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, galleryID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB Error
	}

}
