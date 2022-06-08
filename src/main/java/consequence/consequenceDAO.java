package consequence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<ConsequenceDTO> selectList(){

		List<ConsequenceDTO> list2 = new ArrayList<>();
		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "Select * from consequence";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				ConsequenceDTO tmp = new ConsequenceDTO();
				tmp.setCo_result(rs.getString(1));
				tmp.setCo_attend(rs.getString(2));
				tmp.setCo_comple(rs.getString(3));
				tmp.setCo_employ(rs.getString(4));
				tmp.setCo_same(rs.getString(5));
				tmp.setCo_insurance(rs.getString(6));
				tmp.setCo_option1(rs.getString(7));
				tmp.setCo_option2(rs.getString(8));
				tmp.setCo_option3(rs.getString(9));
				tmp.setCo_option4(rs.getString(10));
				tmp.setCo_option5(rs.getString(11));
				tmp.setCo_option6(rs.getString(12));
				tmp.setCo_asse(rs.getString(13));
				tmp.setCo_porf(rs.getString(14));
				tmp.setCo_certificate(rs.getString(15));
				
				tmp.setM_id(rs.getInt(16));
				
				list2.add(tmp);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list2;
	}
	
	
	
	
	public ConsequenceDTO coSelectOne(int m_id) {
		String sql = "select * from consequence where m_id = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ConsequenceDTO tmp = new ConsequenceDTO();
				tmp.setCo_result(rs.getString(1));
				tmp.setCo_attend(rs.getString(2));
				tmp.setCo_comple(rs.getString(3));
				tmp.setCo_employ(rs.getString(4));
				tmp.setCo_same(rs.getString(5));
				tmp.setCo_insurance(rs.getString(6));
				tmp.setCo_option1(rs.getString(7));
				tmp.setCo_option2(rs.getString(8));
				tmp.setCo_option3(rs.getString(9));
				tmp.setCo_option4(rs.getString(10));
				tmp.setCo_option5(rs.getString(11));
				tmp.setCo_option6(rs.getString(12));
				tmp.setCo_asse(rs.getString(13));
				tmp.setCo_porf(rs.getString(14));
				tmp.setCo_certificate(rs.getString(15));
				tmp.setM_id(rs.getInt(16));
				
				return tmp;
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int update (ConsequenceDTO dto) {
		
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("update consequence set ");
		query.append("co_result = ?, co_attend =?, co_comple = ?, co_employ = ?, co_same = ?, co_insurance = ?, co_option1 = ?, co_option2 = ?, co_option3 = ?, co_option4 = ?, co_option5 = ?, co_option6 = ?, co_asse = ?, co_porf = ?, co_certificate = ? ");
		query.append("where m_id = ?");
		
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
		} finally {
			close(conn, pstmt, null);
		}
		
		return -1;
	}
	public int delete(int m_id) {
		String sql = "delete from consequence where m_id = ?";
		
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
