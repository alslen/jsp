package com.file;

public class FileDTO {

	private String name;
	private String title;
	private String image;  // 이미지 이름만 넣는 변수, multipart객체로 받아도 된다.
	
	// 생성자
	public FileDTO(String name, String title, String image) {
		super();
		this.name = name;
		this.title = title;
		this.image = image;
	}
	
	// getter : 생성자를 만들면 굳이 setter를 만들 필요x
	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public String getImage() {
		return image;
	}

}
