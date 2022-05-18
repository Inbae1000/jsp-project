package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.*;
import member.MemberDTO;

public class MemberDAO {
	
	private static MemberDAO mDao = new MemberDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private MemberDAO() {
		super();
	}
	
	public static MemberDAO getInstance() {
		return mDao;
	}
	
	
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int nextval() {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT MAX(id) ").append("FROM member");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("MAX(id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	 public int insert(MemberDTO dto) {
		 
		 conn = ConnectionDB.getConnection();
		 StringBuffer query = new StringBuffer();
		 query.append("insert into Member ");
		 query.append("values (?,?,?,?,?,?,?,?,?,?,?,?)");
		 
		 try {
			 pstmt = conn.prepareStatement(query.toString());
			 pstmt.setInt(1, dto.getM_id());
			 pstmt.setString(2, dto.getM_name());
			 pstmt.setString(3, dto.getM_number());
			 pstmt.setString(4, dto.getM_area());
			 pstmt.setString(5, dto.getM_area());
			 pstmt.setInt(6, dto.getM_age1());
			 pstmt.setInt(7, dto.getM_age2());
			 pstmt.setString(8, dto.getM_sex());
			 pstmt.setString(9, dto.getM_option1());
			 pstmt.setString(10, dto.getM_option2());
			 pstmt.setString(11, dto.getM_option3());
			 pstmt.setString(12, dto.getM_note());
			 

			 return pstmt.executeUpdate();
			 
		 } catch(SQLException e) {
			 e.printStackTrace();
		 } finally {
			 close(conn, pstmt, null);
		 }
		 return -1;
	}
	
	
}
