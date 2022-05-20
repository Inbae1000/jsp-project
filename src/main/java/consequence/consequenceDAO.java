package consequence;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import consequence.ConsequenceDTO;

import db.*;

public class ConsequenceDAO {
	
	private static ConsequenceDAO coDao = new ConsequenceDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
}
