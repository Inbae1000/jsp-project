package employment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionDB;
import subject.SubjectDTO;


public class EmploymentDAO {
	
	private static EmploymentDAO eDao = new EmploymentDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private EmploymentDAO() {
		super();
	}
	public static EmploymentDAO getInstance() {
		return eDao;
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
	
	
	public List<EmploymentDTO> employmentList(String ee){		//해당 년도의 직종코드 및 목표취업률 불러옴

		List<EmploymentDTO> list = new ArrayList<>();
		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "select * from employment where year = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ee);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				EmploymentDTO tmp = new EmploymentDTO();
				tmp.setYear(rs.getString(1));
				tmp.setCode(rs.getString(2));
				tmp.setEmployment_rate(rs.getDouble(3));
			
				list.add(tmp);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
		
	}
	
	public int insert(EmploymentDTO dto) {		//목표취업률 입력

		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("insert into employment ");
		query.append("values (?,?,?)");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dto.getYear());
			pstmt.setString(2, dto.getCode());
			pstmt.setDouble(3, dto.getEmployment_rate());

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return -1;
	}
	
	public int employmentDelete(String ee) {		//목표취업률 삭제 개별삭제 없음 삭제할땐 해당년도 다 삭제됨
		String sql = "delete from employment where year = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ee);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	
	
}
