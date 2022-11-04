package com.exam;

public class ScoreBean {
	private String name;  // 뷰에 지정된 이름과 멤버변수의 이름이 같아야함
	private int kor; // <input type="text" name="kor" id="kor"> 와 변수 이름(kor)이 같아야한다.
	private int eng;
	private int math;
	
	//getter, setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	//총점
	public int getTotal() {
		
		return kor+eng+math;
	}
	
	// 평균
	public float getAvg() {
		return (kor+eng+math)/3.0f;
	}
	
	//학점
	public String getGrade() {
		String grade="";
		// switch(getTotal()/3/10) {
		switch((int)getAvg()/10) {
		case 10:
		case 9: grade="A"; break;
		case 8: grade="B"; break;
		case 7: grade="C"; break;
		default:  grade="F";
		}
		return grade;
	}
}
