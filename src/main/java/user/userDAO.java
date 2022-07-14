package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionDB;
import member.MemberDTO;
import subject.SubjectDTO;





public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;

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

	public int login(String u_email,String u_pass) {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append( "SELECT u_pass FROM USER WHERE u_email = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, u_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(u_pass)) 
					return 1; //로그인성공
				else
					return 0; //비밀번호 x								
			}
			return -1; //아이디 x
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(UserDTO user) {
		conn = ConnectionDB.getConnection();
		StringBuffer query = new StringBuffer();
		query.append ( "INSERT INTO USER VALUES(?,?,?,?)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, user.getU_email());
			pstmt.setString(2, user.getU_pass());
			pstmt.setString(3, user.getU_name());
			pstmt.setInt(4, user.getU_admin());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//DB오류
	}

	public UserDTO adminType(String id) {		//user 권한 불러오기
		String sql = "select u_admin from user where u_email = ?";

		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserDTO sb = new UserDTO();
				sb.setU_admin(rs.getInt(1));


				return sb;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int userDelete(String id) {		//user 삭제
		String sql = "delete from user where u_email = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	public int adminUpdate(String id) {		//admin 권한 부여
		String sql = "update user set u_admin = 1 where u_email = ?";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	public int userUpdate(String id) {		//admin 권한 삭제
		String sql = "update user set u_admin = 0 where u_email = ?";
	
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, null);
		}
	return result;
	}
	
	public List<UserDTO> userList(){
		  
		 List<UserDTO> list2 = new ArrayList<>();
		 try {
			 conn = ConnectionDB.getConnection();
			 String sql = "select * from user";
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
		while(rs.next()) {
			UserDTO tmp = new UserDTO();
			tmp.setU_email(rs.getString(1)); 
			tmp.setU_pass(rs.getString(2));
			tmp.setU_name(rs.getString(3)); 
			tmp.setU_admin(rs.getInt(4));

			
			list2.add(tmp);
		}
		}catch(SQLException e){ 
			e.printStackTrace(); 
		} finally { 
			close(conn,pstmt,rs); 
		} 
		return list2; 
	}
	
	public UserDTO countEmail(){
		String sql = "select count(u_email) from user";
		
		try {
			conn = ConnectionDB.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				UserDTO tmp = new UserDTO();
				tmp.setCountEmail(rs.getInt(1));
				
				return tmp;
			}

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return null;
	}

}
