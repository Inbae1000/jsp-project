package employment;

public class EmploymentDTO {
	private String year;		//년도
	private String code;		//직종코드
	private double employment_rate;		//목표취업률
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getEmployment_rate() {
		return employment_rate;
	}
	public void setEmployment_rate(double employment_rate) {
		this.employment_rate = employment_rate;
	}
	
}
