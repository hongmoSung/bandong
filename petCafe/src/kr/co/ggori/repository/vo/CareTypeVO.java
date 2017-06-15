package kr.co.ggori.repository.vo;

public class CareTypeVO {
	
	private int careTypeId;
	private int hospitalId;
	private String typeName;
	
	public int getCareTypeId() {
		return careTypeId;
	}
	public void setCareTypeId(int careTypeId) {
		this.careTypeId = careTypeId;
	}
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "{careTypeId=" + careTypeId + ", hospitalId=" + hospitalId + ", typeName=\"" + typeName + "\"}";
	}
}