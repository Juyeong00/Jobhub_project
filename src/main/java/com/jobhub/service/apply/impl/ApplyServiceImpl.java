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
		// TODO Auto-generated method stub

		int result = applyDAO.saveEducationInfo(eduMap);

		return result;

	}

	@Override
	public int saveCareerInfo(Map<String, Object> hashMap) {
		// TODO Auto-generated method stub

		int result = applyDAO.saveCareerInfo(hashMap);

		return result;
	}

	@Override
	public int saveCertificateInfo(Map<String, Object> hashMap) {
		// TODO Auto-generated method stub

		int result = applyDAO.saveCertificateInfo(hashMap);

		return result;
	}

	@Override
	public int saveAnswerInfo(Map<String, Object> hashMap) {
		// TODO Auto-generated method stub

		int result = applyDAO.saveAnswerInfo(hashMap);

		return result;
	}

	@Override
	public int saveFileInfo(FileInfo fileInfo) {
		// TODO Auto-generated method stub

		int result = applyDAO.saveFileInfo(fileInfo);

		return result;
	}

	@Override
	public int saveResumeInfo(Resume resume) {
		// TODO Auto-generated method stub

		int result = applyDAO.saveResumeInfo(resume);

		return result;
	}


	@Override
	public int saveFileInfo(List<FileInfo> fileInfoList) {
		// 리스트에 있는 각 파일 정보를 반복하여 DAO로 전달
		int result = 0;
		for (FileInfo fileInfo : fileInfoList) {
			System.out.println(fileInfo);
			result += applyDAO.saveFileInfo(fileInfo);
			// 각 파일 정보의 저장 결과를 확인하거나 처리할 수 있습니다.
			// 예를 들어, 저장에 실패한 경우 예외 처리를 할 수 있습니다.
		}
		// 최종적으로 저장 결과 반환
		return result; // 여러 파일 중 하나라도 저장에 실패하면 어떻게 처리할지에 따라 반환값이 달라질 수 있습니다.
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
			return false;  //return 0;
		}else {
			return true;  //return 1;
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
