package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.ConnectionDB;



public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;


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
		query.append ( "INSERT INTO USER VALUES(?,?,?)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, user.getU_email());
			pstmt.setString(2, user.getU_pass());
			pstmt.setString(3, user.getU_name());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//DB오류
	}

	
	
}
