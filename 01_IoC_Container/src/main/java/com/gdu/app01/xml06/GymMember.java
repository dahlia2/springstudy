package com.gdu.app01.xml06;

import java.util.List;

public class GymMember {
	
	// field
	private String name;
	private List<String> course;
	private BmiCalculator bmiCalc;
	
	// constructor
	public GymMember(String name, List<String> course, BmiCalculator bmiCalc) {
		super();
		this.name = name;
		this.course = course;
		this.bmiCalc = bmiCalc;
	}
	
	// method
	public void memberInfo() {
		System.out.println("이름: " + name);
		for(int i = 0; i < course.size(); i++) {
			System.out.println((i + 1) + "번째 종목: " + course.get(i));
		}
		bmiCalc.bmiInfo();

		
	}
	

	
	
	
	
	
}
