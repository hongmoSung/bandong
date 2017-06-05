package kr.co.ggori.repository.vo;

public class HospitalVO {
	private int hospitalId;
	private String name;
	private int telNumber;
	private String address;
	private String latitude;
	private String longitude;
	private String MemberId;
	
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(int telNumber) {
		this.telNumber = telNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	@Override
	public String toString() {
		return "HospitalVO [hospitalId=" + hospitalId + ", name=" + name + ", telNumber="
				+ telNumber + ", address=" + address + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", MemberId=" + MemberId + "]";
	}
	
}