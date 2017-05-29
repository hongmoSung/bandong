package kr.co.ggori.repository.vo;

public class ReservationVO {
	
	private int reserId;
	private String reserDate;
	private int reserTime;
	private String careType;
	private String detail;
	private String reserName;
	private int hospitalId;
	private String memberId;

	public int getReserId() {
		return reserId;
	}
	public void setReserId(int reserId) {
		this.reserId = reserId;
	}
	public String getReserDate() {
		return reserDate;
	}
	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}
	public int getReserTime() {
		return reserTime;
	}
	public void setReserTime(int reserTime) {
		this.reserTime = reserTime;
	}
	public String getCareType() {
		return careType;
	}
	public void setCareType(String careType) {
		this.careType = careType;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getReserName() {
		return reserName;
	}
	public void setReserName(String reserName) {
		this.reserName = reserName;
	}
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}