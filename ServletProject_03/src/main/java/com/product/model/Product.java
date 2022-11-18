package com.product.model;

public class Product {
	private long productId;  // ��ǰ���̵�
	private String pname;  // ��ǰ��
	private Integer unitPrice; // ��ǰ����
	private String description; // ��ǰ����
	private String manufacturer;  //������
	private String category;  // �з�
	private long unitsInStcok;  // ��� ��
	private String condition;  // �Ż�ǰ, �߰�ǰ, ���ǰ
	private String filename;  // �����̸�
	
	// getter, setter
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStcok() {
		return unitsInStcok;
	}
	public void setUnitsInStcok(long unitsInStcok) {
		this.unitsInStcok = unitsInStcok;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

}
