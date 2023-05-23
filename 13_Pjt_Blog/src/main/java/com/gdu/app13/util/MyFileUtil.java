package com.gdu.app13.util;

import java.io.File;
import java.time.LocalDate;
import java.util.UUID;
import java.util.regex.Matcher;

import org.springframework.stereotype.Component;

@Component
public class MyFileUtil {  // 경로와 파일명 지정  // 파일명은 인코딩과 중복 제거 기능

	// 경로 구분자 (슬래시 기준으로 분리해준 "/" 문자를 객체로 저장)
	private String sep = Matcher.quoteReplacement(File.separator);

	
	// String의 path 만들기
	public String getPath() {
		LocalDate now = LocalDate.now();
		
		// 루트/storage/2023/05/23
		return "/storage" + sep + now.getYear() + sep + String.format("%02d", now.getMonthValue())+ sep + String.format("%02d", now.getDayOfMonth());	
	}
	
	// String summbernoteImagePath 만들기
	public String getSummbernoteImagePath() {
	  return "/storage" + sep + "summernote";
	}
	
	// String filesystemName 만들기
	public String getFilesystemName(String originName) {   // 확장자를 가져오기 위해
		// 원래 첨부 파일의 확장자 꺼내기
		String extName = null; 
		
		// 확장자에 마침표(.)가 포함된 예외 상황 처리
		if(originName.endsWith("tar.gz")) {   // tar.gz은 리눅스 압축 파일
			extName = "tar.gz";
		} else {
			// split(정규식)
			// 정규식에서 마침표(.)는 모든 문자를 의미하므로 이스케이프 처리하거나 문자 클래스로 처리한다.
			// 이스케이프 처리 : \.
			// 문자클래스 처리 : [.]
			String[] array = originName.split("\\.");
			extName = array[array.length - 1];   // array의 마지막 글자
		}
		
		// 결과 반환
		// UUID.extName
		return UUID.randomUUID().toString().replace("-", "") + "." + extName;    // 하이픈을 제거한 uuid값에 확장자를 덧붙임
	}
	
	// String tempPath 만들기
	public String getTempPath() {
		return "/storage" + sep + "temp";  // C드라이브 > temp 폴더 생성
	}

	// String tempfileName 만들기 (zip 파일)
	public String getTempFileName() {
		return UUID.randomUUID().toString().replace("-", "") + "." + "zip";  // 새로 zip파일을 만드는 것이기 때문에 확장자 꺼내올 필요 x 그냥 zip만 덧붙임
	}
	
	// String yesterdayPath 만들기
	public String getYesterdayPath() {
		LocalDate date = LocalDate.now();
		date.minusDays(1);  // 1일 전
		return "/storage" + sep + date.getYear() + sep + String.format("%02d", date.getMonthValue())+ sep + String.format("%02d", date.getDayOfMonth());
	}

}
