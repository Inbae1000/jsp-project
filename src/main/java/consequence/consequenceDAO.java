package consequence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionDB;

public class ConsequenceDAO {
	private static ConsequenceDAO coDao = new ConsequenceDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private ConsequenceDAO() {
		super();
	}
	public static ConsequenceDAO getInstance() {
		return coDao;
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
		query.append("SELECT MAX(m_id) ").append("FROM member");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("MAX(m_id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int coInsert(ConsequenceDTO dto) {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("insert into consequence ");
		query.append("values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dto.getCo_result());
			pstmt.setString(2, dto.getCo_attend());
			pstmt.setString(3, dto.getCo_comple());
			pstmt.setString(4, dto.getCo_employ());
			pstmt.setString(5, dto.getCo_same());
			pstmt.setString(6, dto.getCo_insurance());
			pstmt.setString(7, dto.getCo_option1());
			pstmt.setString(8, dto.getCo_option2());
			pstmt.setString(9, dto.getCo_option3());
			pstmt.setString(10, dto.getCo_option4());
			pstmt.setString(11, dto.getCo_option5());
			pstmt.setString(12, dto.getCo_option6());
			pstmt.setString(13, dto.getCo_asse());
			pstmt.setString(14, dto.getCo_porf());
			pstmt.setString(15, dto.getCo_certificate());
			pstmt.setInt(16, dto.getM_id());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		return -1;
	}
	
}
