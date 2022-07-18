package note;

public class NoteDTO {
	private int m_id;		// 학생 id
	private int n_id;		// 비고 id
	private String n_note;	// 비고 내용
	private String n_date;	// 비고 입력 날짜
	
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getN_note() {
		return n_note;
	}
	public void setN_note(String n_note) {
		this.n_note = n_note;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}

}
