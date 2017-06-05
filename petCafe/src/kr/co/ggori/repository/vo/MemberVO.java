package kr.co.ggori.repository.vo;

import java.util.Date;

public class MemberVO {
	private String memberId;
	private String pass;
	private String nickName;
	private String email;
	private int phoneNum;
	private String rank;
	private Date regDate;
	private String fileId;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
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
				+ ", phoneNum=" + phoneNum + ", rank=" + rank + ", regDate=" + regDate + ", fileId=" + fileId
				+ ", leave=" + leave + "]";
	}
}
