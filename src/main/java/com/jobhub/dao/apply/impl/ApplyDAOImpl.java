package com.jobhub.dao.apply.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jobhub.dao.apply.ApplyDAO;
import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.employee.Employee;
import com.jobhub.dto.jobposting.Jobposting;
import com.jobhub.dto.resume.Resume;
import com.jobhub.dto.util.FileInfo;

@Repository
public class ApplyDAOImpl implements ApplyDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int saveEducationInfo(Map<String, Object> eduMap) {
		int result = sqlSessionTemplate.insert("apply_mapper.saveEducationInfo", eduMap);

		return result;
	}

	@Override
	public int saveCareerInfo(Map<String, Object> hashMap) {
		
		int result = sqlSessionTemplate.insert("apply_mapper.saveCareerInfo", hashMap);
		return result;
	}

	@Override
	public int saveCertificateInfo(Map<String, Object> hashMap) {

		int result = sqlSessionTemplate.insert("apply_mapper.saveCertificateInfo", hashMap);
		return result;
	}

	@Override
	public int saveAnswerInfo(Map<String, Object> hashMap) {

		int result = sqlSessionTemplate.insert("apply_mapper.saveAnswerInfo", hashMap);
		return result;
	}

	@Override
	public int saveFileInfo(FileInfo fileInfo) {
		
		int result = sqlSessionTemplate.insert("apply_mapper.saveFileInfo", fileInfo);
		return result;
	}

	@Override
	public int saveResumeInfo(Resume resume) {

		int result = sqlSessionTemplate.insert("apply_mapper.saveResume", resume);
		return result;
	}

	@Override
	public int saveFileInfo(Map<String, Object> hashMap) {
		int result = sqlSessionTemplate.insert("apply_mapper.saveFileInfo", hashMap);
		return result;
	}

	@Override
	public List<Employee> findEmployeeList() {
		List<Employee> employeeList = sqlSessionTemplate.selectList("apply_mapper.findEmployeeList");
		return employeeList;
	}

	@Override
	public Jobposting findQuestions(String postingId) {
		Jobposting questList = sqlSessionTemplate.selectOne("apply_mapper.findQuestions", postingId);
		return questList;
	}

	@Override
	public Customer findUserById(String id) {
		Customer user = sqlSessionTemplate.selectOne("login_mapper.findUserById", id);

		return user;
	}

	@Override
	public List<Employee> findEmployeeByJobsname(String cate) {
		
		List<Employee> empNameList = sqlSessionTemplate.selectList("apply_mapper.findEmployeeByJobsname", cate);
		return empNameList;
	}

}
