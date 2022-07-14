package user;

public class UserDTO {
	
	private String u_email;
	private String u_pass;
	private String u_name;
	private int u_admin;
	private int countEmail;
	
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getU_admin() {
		return u_admin;
	}
	public void setU_admin(int u_admin) {
		this.u_admin = u_admin;
	}
	public int getCountEmail() {
		return countEmail;
	}
	public void setCountEmail(int countEmail) {
		this.countEmail = countEmail;
	}

}
