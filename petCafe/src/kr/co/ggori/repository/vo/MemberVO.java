package kr.co.ggori.repository.vo;

/**
 * @author hongmo
 *
 */
public class MemberVO {
	private String memberId;
	private String pass;
	private String nickName;
	private String email;
	private int phoneNum;
	private String rank;
	private String regDate;
	private String filePath;
	private int leave;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(int phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getLeave() {
		return leave;
	}
	public void setLeave(int leave) {
		this.leave = leave;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", pass=" + pass + ", nickName=" + nickName + ", email=" + email
				+ ", phoneNum=" + phoneNum + ", rank=" + rank + ", regDate=" + regDate + ", filePath=" + filePath
				+ ", leave=" + leave + "]";
	}
}
