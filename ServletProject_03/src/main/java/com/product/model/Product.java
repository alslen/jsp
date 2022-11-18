package com.product.model;

public class Product {
	private long productId;  // 상품아이디
	private String pname;  // 상품명
	private Integer unitPrice; // 상품가격
	private String description; // 상품설명
	private String manufacturer;  //제조사
	private String category;  // 분류
	private long unitsInStcok;  // 재고 수
	private String condition;  // 신상품, 중고품, 재생품
	private String filename;  // 파일이름
	
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
