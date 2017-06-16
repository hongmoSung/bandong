package kr.co.ggori.repository.vo;

public class DayOffVO {
	
	private int dayoffId;
	private int hospitalId;
	private String offDay;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDayoffId() {
		return dayoffId;
	}
	public void setDayoffId(int dayoffId) {
		this.dayoffId = dayoffId;
	}
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public String getOffDay() {
		return offDay;
	}
	public void setOffDay(String offDay) {
		this.offDay = offDay;
	}
	@Override
	public String toString() {
		return "DayOffVO [dayoffId=" + dayoffId + ", hospitalId=" + hospitalId + ", offDay=" + offDay + "]";
	}
	
}