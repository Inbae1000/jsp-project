package company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			pstmt.setString(8, dto.getC_except());
			pstmt.setInt(9, dto.getM_id());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		return -1;
	}
	
	public List<CompanyDTO> selectList(){

		List<CompanyDTO> list3 = new ArrayList<>();
		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "Select * from company";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				CompanyDTO tmp = new CompanyDTO();
				tmp.setC_start(rs.getString(1));
				tmp.setC_maintain(rs.getString(2));
				tmp.setC_end(rs.getString(3));
				tmp.setC_name(rs.getString(4));
				tmp.setC_address(rs.getString(5));
				tmp.setC_number(rs.getString(6));
				tmp.setC_manager(rs.getString(7));
				tmp.setC_except(rs.getString(8));
				tmp.setM_id(rs.getInt(9));
				
				list3.add(tmp);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list3;
	}

	
	
	
	
	public CompanyDTO cSelectOne(int m_id) {
		String sql = "select * from company where m_id = ?";
		
		try {
			conn =ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CompanyDTO tmp = new CompanyDTO();
				tmp.setC_start(rs.getString(1));
				tmp.setC_maintain(rs.getString(2));
				tmp.setC_end(rs.getString(3));
				tmp.setC_name(rs.getString(4));
				tmp.setC_address(rs.getString(5));
				tmp.setC_number(rs.getString(6));
				tmp.setC_manager(rs.getString(7));
				tmp.setC_except(rs.getString(8));
				tmp.setM_id(rs.getInt(9));
				
				return tmp;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int cUpdate (CompanyDTO dto) {
		
		
		conn =ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("update company set ");
		query.append("c_start = ?, c_maintain = ?, c_end = ?, c_name = ?, c_address = ?, c_number = ?, c_manager = ?, c_except = ? ");
		query.append("where m_id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dto.getC_start());
			pstmt.setString(2, dto.getC_maintain());
			pstmt.setString(3, dto.getC_end());
			pstmt.setString(4, dto.getC_name());
			pstmt.setString(5, dto.getC_address());
			pstmt.setString(6, dto.getC_number());
			pstmt.setString(7, dto.getC_manager());
			pstmt.setString(8, dto.getC_except());
			
			pstmt.setInt(9, dto.getM_id());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		
		return -1;
	}
	
	public int delete(int m_id) {
		String sql = "delete from company where m_id = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			result = pstmt.executeUpdate();

		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	
}
