package com.jobhub.controller.resume;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.jobposting.Jobposting;
import com.jobhub.dto.resume.ApplyAnswerForm;
import com.jobhub.dto.resume.ApplyCareerForm;
import com.jobhub.dto.resume.ApplyCertificateForm;
import com.jobhub.dto.resume.ApplyEducationForm;
import com.jobhub.dto.resume.Resume;
import com.jobhub.dto.util.FileInfo;
import com.jobhub.service.apply.ApplyService;
import com.jobhub.service.customer.CustomerService;
import com.jobhub.service.resume.ResumeService;
import com.jobhub.util.FileManager;

@Controller
public class ApplyController {

	@Autowired
	ResumeService resumeService;

	@Autowired
	ApplyService applyService;

	@Autowired
	FileManager fileManager;
	
	@Autowired
	CustomerService customerService;


	@GetMapping("/apply")
	public String apply(@RequestParam String postingId, Model model, HttpSession session, Customer customer) {
		
		String loginId = (String)session.getAttribute("loginId");
		
		Customer customerInfo = customerService.findCustomerInfo(loginId);
		
		model.addAttribute("userId", customerInfo.getUserId());
		model.addAttribute("name", customerInfo.getName());
		model.addAttribute("email", customerInfo.getEmail());
		model.addAttribute("birth", customerInfo.getBirth());
		model.addAttribute("phone", customerInfo.getPhone());
		model.addAttribute("gender", customerInfo.getGender());

		model.addAttribute("postingId", postingId);
		Jobposting question = applyService.findQuestions(postingId);
		model.addAttribute("title", question.getTitle());
		model.addAttribute("question1", question.getQuestion1());
		model.addAttribute("question2", question.getQuestion2());
		model.addAttribute("question3", question.getQuestion3());
		
		return "apply/apply";
		
	}

	@PostMapping("/apply")
	public String applyProcess(HttpSession session, @RequestParam String postingId, ApplyEducationForm eduForm, ApplyCareerForm careerForm, 
			ApplyCertificateForm certForm, ApplyAnswerForm answerForm,@RequestParam("data") List<MultipartFile> files, Resume resume) {

		//여기는 학력 정보를 테이블에 저장하는 코드입니다.
		List<Resume> eduList = new ArrayList<Resume>();
		for(int i=0; i<eduForm.getSchoolName().length; i++) {
			Resume rsm = new Resume();
			rsm.setSchoolName(eduForm.getSchoolName()[i]);
			rsm.setEduSortation(eduForm.getEduSortation()[i]);
			rsm.setAdmission(eduForm.getAdmission()[i]);
			rsm.setGraduation(eduForm.getGraduation()[i]);
			rsm.setMajor(eduForm.getMajor()[i]);
			rsm.setMinor(eduForm.getMinor()[i]);
			rsm.setGrade(eduForm.getGrade()[i]);
			rsm.setTotalScore(eduForm.getTotalScore()[i]);
			rsm.setGraduationStatus(eduForm.getGraduationStatus()[i]);

			eduList.add(rsm);
		}

		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("eduList", eduList);

		int eduresult = applyService.saveEducationInfo(hashMap);


		//여기는 경력 정보를 테이블에 저장하는 코드입니다.
		List<Resume> careerList = new ArrayList<Resume>();

		if (careerForm.getCompanyName() != null) {
			for (int i=0; i<careerForm.getCompanyName().length; i++) {
				Resume rsm = new Resume();
				rsm.setCompanyName(careerForm.getCompanyName()[i]);
				rsm.setDepartmentName(careerForm.getDepartmentName()[i]);
				rsm.setJoinDate(careerForm.getJoinDate()[i]);
				rsm.setResignationDate(careerForm.getResignationDate()[i]);
				rsm.setDuty(careerForm.getDuty()[i]);
				rsm.setPosition(careerForm.getPosition()[i]);
				rsm.setDetailWork(careerForm.getDetailWork()[i]);

				careerList.add(rsm);
			}
		} else {
			Resume rsm = new Resume();
			rsm.setCompanyName("null");
			rsm.setDepartmentName("null");
			rsm.setJoinDate("null");
			rsm.setResignationDate("null");
			rsm.setDuty("null");
			rsm.setPosition("null");
			rsm.setDetailWork("null");

			careerList.add(rsm);
		}

		hashMap.clear();
		hashMap.put("careerList", careerList);

		int careerResult = applyService.saveCareerInfo(hashMap);


		//여기는 자격 정보를 테이블에 저장하는 코드입니다.
		List<Resume> certList = new ArrayList<Resume>();

		if (certForm.getCertSortation() != null) {
			for(int i=0; i<certForm.getCertSortation().length; i++) {
				Resume rsm = new Resume();
				rsm.setCertSortation(certForm.getCertSortation()[i]);
				rsm.setCertType(certForm.getCertType()[i]);
				rsm.setCertLevel(certForm.getCertLevel()[i]);
				rsm.setAcquisition(certForm.getAcquisition()[i]);
				rsm.setLssuingAuthority(certForm.getLssuingAuthority()[i]);
				rsm.setLanguage(certForm.getLanguage()[i]);
				rsm.setTest(certForm.getTest()[i]);
				rsm.setLanguageGrade(certForm.getLanguageGrade()[i]);

				certList.add(rsm);
			}
		}else {
			Resume rsm = new Resume();
			rsm.setCertSortation("null");
			rsm.setCertType("null");
			rsm.setCertLevel("null");
			rsm.setAcquisition("null");
			rsm.setLssuingAuthority("null");
			rsm.setLanguage("null");
			rsm.setTest("null");
			rsm.setLanguageGrade("null");

			certList.add(rsm);
		}

		hashMap.clear();
		hashMap.put("certList", certList);

		int certResult = applyService.saveCertificateInfo(hashMap);

		//여기는 직무질문 정보를 테이블에 저장하는 코드입니다.
		List<Resume> ansList = new ArrayList<Resume>();
		if (answerForm.getContent1() != null) {
			for(int i=0; i<answerForm.getContent1().length; i++) {
				Resume rsm = new Resume();
				rsm.setContent1(answerForm.getContent1()[i]);
				rsm.setContent2(answerForm.getContent2()[i]);
				rsm.setContent3(answerForm.getContent3()[i]);

				ansList.add(rsm);
			}
		}else {
				Resume rsm = new Resume();
				rsm.setContent1("null");
				rsm.setContent2("null");
				rsm.setContent3("null");

				certList.add(rsm);
			}

			hashMap.clear();
			hashMap.put("ansList", ansList);

			int ansResult = applyService.saveAnswerInfo(hashMap);


			//일단 이력서 테이블 저장
			String loginId = (String)session.getAttribute("loginId");
			resume.setUserId(loginId);

			int resumeResult = applyService.saveResumeInfo(resume);


			//여기는 첨부파일 정보를 테이블에 저장하는 코드입니다.
			if(files != null) {
				try {

					List<FileInfo> fileList = fileManager.storeFiles(files);

					for (FileInfo fileInfo : fileList) {
						int result = applyService.saveFileInfo(fileInfo);
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileName("null");
				fileInfo.setOriginalFileName("null");
				fileInfo.setFilePath("null");
				fileInfo.setFileExtension("null");
				fileInfo.setFileSize(0);
			}

			return "redirect:/";

		}

	}