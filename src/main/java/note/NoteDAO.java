package note;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionDB;

public class NoteDAO {
	private static NoteDAO nDao = new NoteDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private NoteDAO() {
		super();
	}
	public static NoteDAO getInstance() {
		return nDao;
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
	
	public int nextval1() {		// 처음입력시 학생 id에 맞게 자동으로 입력해줌
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
	
	
	public int nextval2(int m_id) {		// 학생 수정 페이지에서 입력시 작동
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT MAX(n_id) ").append("FROM note WHERE m_id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("MAX(n_id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int insert(NoteDTO dto) {	//비고 입력
		 
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("insert into note ");
		query.append("values (?,?,?,curdate())");
		 
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, dto.getM_id());
			pstmt.setInt(2, dto.getN_id());
			pstmt.setString(3, dto.getN_note());
			
			return pstmt.executeUpdate();
			 
		 } catch(SQLException e) {
			 e.printStackTrace();
		 } finally {
			 close(conn, pstmt, null);
		 }
		 return -1;
	}
	
	public int delete1(int n_id, int m_id) {		// 비고 삭제 개별 삭제
		String sql = "delete from note where n_id = ? and m_id = ? ";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n_id);
			pstmt.setInt(2, m_id);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	public int delete2(int m_id) {		// 학생 삭제시 해당 학생의 비고 삭제
		String sql = "delete from note where m_id = ? ";
		
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
	
	
	public List<NoteDTO> selectList(int m_id){		//해당 학생 비고 리스트

		List<NoteDTO> list = new ArrayList<>();
		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "select * from note where m_id = ? order by n_id desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				NoteDTO dto = new NoteDTO();
				dto.setM_id(rs.getInt(1));
				dto.setN_id(rs.getInt(2));
				dto.setN_note(rs.getString(3));
				dto.setN_date(rs.getString(4));
				
				list.add(dto);
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	public NoteDTO selectNewList(int m_id){		// 과목 세부페이지 최신 비고 보여줌

		
		try {
			conn = ConnectionDB.getConnection();
			String sql = "select * from note where m_id = ? order by n_id desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				NoteDTO dto = new NoteDTO();
				dto.setN_note(rs.getString(3));

				return dto;
				
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return null;
	}


}
