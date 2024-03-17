package com.jobhub.dto.employee;

import lombok.Data;

@Data
public class Employee {
	//직원
	
	/*
	employee_id		varchar2	직원ID
	image_path		varchar2	이미지 경로
	jobs_id			varchar2	직무 ID
	name			varchar2	이름
	phone			varchar2	휴대폰번호(하이픈 포함)
	tel				varchar2	전화번호(내선)
	birth			date		생년월일
	gender			char		성별(M/F)
	address			varchar2	주소(시, 구까지만)
	hire_date		date		입사일자
	email			varchar2	이메일
	 */
	
	String employeeId;
	String imagePath;
	String jobsId;
	String name;
	String phone;			
	String tel;
	String birth;
	char gender;
	String address;
	String hireDate;
	String email;
	String jobsName;
	int fileId;
	String fileName;
	String originalFileName;
	String filePath;
	String fileExtension;
	long fileSize;
	
}
