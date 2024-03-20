package com.jobhub.service.apply.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobhub.dao.apply.ApplyDAO;
import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.employee.Employee;
import com.jobhub.dto.jobposting.Jobposting;
import com.jobhub.dto.resume.Resume;
import com.jobhub.dto.util.FileInfo;
import com.jobhub.service.apply.ApplyService;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	ApplyDAO applyDAO;

	//	@Override
	//	public int saveEducationInfo(List<ApplyResumeForm> educationForm) {
	//		// TODO Auto-generated method stub
	//		//service
	//		for(Resume rsm : resumeList) {
	//			dao.saveResume(rsm);
	//		}
	//		
	//		int result = resumeDAO.saveEducationInfo(educationForm);
	//		
	//		return result;
	//	}

	@Override
	public int saveEducationInfo(Map<String, Object> eduMap) {
		int result = applyDAO.saveEducationInfo(eduMap);

		return result;

	}

	@Override
	public int saveCareerInfo(Map<String, Object> hashMap) {
		int result = applyDAO.saveCareerInfo(hashMap);

		return result;
	}

	@Override
	public int saveCertificateInfo(Map<String, Object> hashMap) {
		int result = applyDAO.saveCertificateInfo(hashMap);

		return result;
	}

	@Override
	public int saveAnswerInfo(Map<String, Object> hashMap) {
		int result = applyDAO.saveAnswerInfo(hashMap);

		return result;
	}

	@Override
	public int saveFileInfo(FileInfo fileInfo) {
		int result = applyDAO.saveFileInfo(fileInfo);

		return result;
	}

	@Override
	public int saveResumeInfo(Resume resume) {
		int result = applyDAO.saveResumeInfo(resume);

		return result;
	}


	@Override
	public int saveFileInfo(List<FileInfo> fileInfoList) {
		int result = 0;
		for (FileInfo fileInfo : fileInfoList) {
			result += applyDAO.saveFileInfo(fileInfo);
		}
		return result;
	}

	@Override
	public int saveFileInfo(Map<String, Object> hashMap) {
		int result = applyDAO.saveFileInfo(hashMap);

		return result;
	}

	@Override
	public Jobposting findQuestions(String postingId) {
		Jobposting questList = applyDAO.findQuestions(postingId);
		return questList;
	}

	@Override
	public boolean isDuplicatedId(String id) {

		Customer user = applyDAO.findUserById(id);
		if(user == null) {
			return false;
		}else {
			return true;
		}
	}
	
	@Override
	public List<Employee> findEmployeeList() {
		List<Employee> employeeList = applyDAO.findEmployeeList();
		return employeeList;
	}

	@Override
	public List<Employee> findEmployeeByJobsname(String cate) {
		List<Employee> empNameList = applyDAO.findEmployeeByJobsname(cate);
		return empNameList;
	}

}
