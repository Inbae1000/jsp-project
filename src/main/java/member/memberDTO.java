package member;

public class MemberDTO {
	private int m_id;			//학생id
	private String m_name;		//이름
	private String m_birth;		//생년월일
	private String m_number;	//전화번호
	private String m_area;		//지역
	private int m_age1;			//나이 안씀 저장은 되어 있는데 list에서 보여줄땐 따로 수식으로 계산함 
	private int m_age2;			//만나이 지금 안씀 나이-1한 값만 들어가게 해놨음
	private String m_sex;		//성별
	private String m_option1;	//유형
	private String m_option2;	//구분
	private String m_option3;	//대상구분
	private String asse;		//asse 가중치 값 db에서 뽑아온거
	private int s_id;			//과목id
	
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_number() {
		return m_number;
	}
	public void setM_number(String m_number) {
		this.m_number = m_number;
	}
	public String getM_area() {
		return m_area;
	}
	public void setM_area(String m_area) {
		this.m_area = m_area;
	}
	public int getM_age1() {
		return m_age1;
	}
	public void setM_age1(int m_age1) {
		this.m_age1 = m_age1;
	}
	public int getM_age2() {
		return m_age2;
	}
	public void setM_age2(int m_age2) {
		this.m_age2 = m_age2;
	}
	public String getM_sex() {
		return m_sex;
	}
	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}
	public String getM_option1() {
		return m_option1;
	}
	public void setM_option1(String m_option1) {
		this.m_option1 = m_option1;
	}
	public String getM_option2() {
		return m_option2;
	}
	public void setM_option2(String m_option2) {
		this.m_option2 = m_option2;
	}
	public String getM_option3() {
		return m_option3;
	}
	public void setM_option3(String m_option3) {
		this.m_option3 = m_option3;
	}
	public String getAsse() {
		return asse;
	}
	public void setAsse(String asse) {
		this.asse = asse;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
}
