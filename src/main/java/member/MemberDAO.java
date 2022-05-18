package member;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.MemberDTO;

import db.*;

public class MemberDAO {
	
	private static MemberDAO mDao = new MemberDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
	
	public List<MemberDTO> selectList(){

		List<MemberDTO> list = new ArrayList<>();
		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "Select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				MemberDTO tmp = new MemberDTO();
				tmp.setM_id(rs.getInt(1));
				tmp.setM_name(rs.getString(2));
				tmp.setM_birth(rs.getString(3));
				tmp.setM_number(rs.getString(4));
				tmp.setM_area(rs.getString(5));
				tmp.setM_age1(rs.getInt(6));
				//tmp.setM_age2(rs.getInt(7));
				tmp.setM_sex(rs.getString(7));
				tmp.setM_option1(rs.getString(8));
				//tmp.setM_option2(rs.getString(10));
				//tmp.setM_option3(rs.getString(11));
				tmp.setM_note(rs.getString(9));
				
				list.add(tmp);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}
}
