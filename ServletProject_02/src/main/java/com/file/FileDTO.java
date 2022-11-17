package com.file;

public class FileDTO {

	private String name;
	private String title;
	private String image;  // �̹��� �̸��� �ִ� ����, multipart��ü�� �޾Ƶ� �ȴ�.
	
	// ������
	public FileDTO(String name, String title, String image) {
		super();
		this.name = name;
		this.title = title;
		this.image = image;
	}
	
	// getter : �����ڸ� ����� ���� setter�� ���� �ʿ�x
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
