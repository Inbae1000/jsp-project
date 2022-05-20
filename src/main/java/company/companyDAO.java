package company;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import company.CompanyDTO;

import db.*;

public class CompanyDAO {
	
	private static CompanyDAO cDao = new CompanyDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
				tmp.setC_excep(rs.getString(8));
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
}
