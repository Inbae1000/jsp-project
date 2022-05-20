package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
				tmp.setM_sex(rs.getString(8));
				tmp.setM_option1(rs.getString(9));				
				tmp.setM_option2(rs.getString(10));
				tmp.setM_note(rs.getString(12));
				
				list.add(tmp);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
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
			pstmt.setString(3, dto.getM_birth());
			pstmt.setString(4, dto.getM_number());
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
	 
	public MemberDTO selectOne(int m_id) {
		String sql = "Select * from member where m_id = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDTO tmp = new MemberDTO();
				tmp.setM_id(rs.getInt(1));
				tmp.setM_name(rs.getString(2));
				tmp.setM_birth(rs.getString(3));
				tmp.setM_number(rs.getString(4));
				tmp.setM_area(rs.getString(5));
				tmp.setM_age1(rs.getInt(6));
				tmp.setM_age2(rs.getInt(7));	
				tmp.setM_sex(rs.getString(8));
				tmp.setM_option1(rs.getString(9));		
				tmp.setM_option2(rs.getString(10));
				tmp.setM_option3(rs.getString(11));
				tmp.setM_note(rs.getString(12));
					
				return tmp;
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}
		 
		return null;
	}
	public int update (MemberDTO dto) {
		/*
		 * String name = selectOne(dto.getM_id()).getM_name(); String birth =
		 * selectOne(dto.getM_id()).getM_birth(); String number =
		 * selectOne(dto.getM_id()).getM_number(); String area =
		 * selectOne(dto.getM_id()).getM_area(); int age1 =
		 * selectOne(dto.getM_id()).getM_age1(); int age2 =
		 * selectOne(dto.getM_id()).getM_age2(); String sex =
		 * selectOne(dto.getM_id()).getM_sex(); String option1 =
		 * selectOne(dto.getM_id()).getM_option1(); String option2 =
		 * selectOne(dto.getM_id()).getM_option2(); String option3 =
		 * selectOne(dto.getM_id()).getM_option3(); String note =
		 * selectOne(dto.getM_id()).getM_note();
		 */
		
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("update member set ");
		query.append("m_name = ?, m_birth = ?, m_number = ?, m_area = ?, m_age1 = ?, m_age2 = ?, m_sex = ?, m_option1 = ?, m_option2 = ?, m_option3 = ?, m_note= ? ");
		query.append("where m_id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dto.getM_name());
			pstmt.setString(2, dto.getM_birth());
			pstmt.setString(3, dto.getM_number());
			pstmt.setString(4, dto.getM_area());
			pstmt.setInt(5, dto.getM_age1());
			pstmt.setInt(6, dto.getM_age2());
			pstmt.setString(7, dto.getM_sex());
			pstmt.setString(8, dto.getM_option1());
			pstmt.setString(9, dto.getM_option2());
			pstmt.setString(10, dto.getM_option3());
			pstmt.setString(11, dto.getM_note());
			
			pstmt.setInt(12, dto.getM_id());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,null);
		}
		return -1;
	}
	
	public int delete(int m_id) {
		String sql = "delete from member where m_id = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
}
