package kr.co.ggori.repository.vo;

public class ReservationVO {
	
	private int reserId;
	private String reserDate;
	private String reserTime;
	private String detail;
	private String reserName;
	private int hospitalId;
	private String memberId;
	private String careTypeId;
	
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
	public String getReserTime() {
		return reserTime;
	}
	public void setReserTime(String reserTime) {
		this.reserTime = reserTime;
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
	public String getCareTypeId() {
		return careTypeId;
	}
	public void setCareTypeId(String careTypeId) {
		this.careTypeId = careTypeId;
	}

}