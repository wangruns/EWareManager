package cn.it.model;

public class Type {
	private int typeId;
	private String typeName;
	private int fatherTypeId;
	private int sonTypeId;

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getFatherTypeId() {
		return fatherTypeId;
	}

	public void setFatherTypeId(int fatherTypeId) {
		this.fatherTypeId = fatherTypeId;
	}

	public int getSonTypeId() {
		return sonTypeId;
	}

	public void setSonTypeId(int sonTypeId) {
		this.sonTypeId = sonTypeId;
	}

}