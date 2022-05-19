package company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionDB;

public class CompanyDAO {

	private static CompanyDAO cDao = new CompanyDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;

	private CompanyDAO() {
		super();
	}
	
	public static CompanyDAO getInstance() {
		return cDao;
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
	
	public int cInsert(CompanyDTO dto) {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("insert into Company ");
		query.append("values (?,?,?,?,?,?,?,?,?)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dto.getC_start());
			pstmt.setString(2, dto.getC_maintain());
			pstmt.setString(3, dto.getC_end());
			pstmt.setString(4, dto.getC_name());
			pstmt.setString(5, dto.getC_address());
			pstmt.setString(6, dto.getC_number());
			pstmt.setString(7, dto.getC_manager());
			pstmt.setString(8, dto.getC_excep());
			pstmt.setInt(9, dto.getM_id());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		return -1;
	}
	
	
}
