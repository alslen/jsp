package com.jqueryAddress;

import java.util.ArrayList;

public interface JAddressDAO {
	
	public void insert(AddressVO avo); // 추가
	
	public ArrayList<AddressVO> list(); // 전체보기
	
	public AddressVO findByNum(int num); // 상세보기
	
	public int getCount(); // 개수
	
	public void update(AddressVO avo); //수정
	
	public void delete(int num); //삭제
	
	public ArrayList<ZipCodeVO> getZipcode(String dong); 	//우편번호 검색
	
}
