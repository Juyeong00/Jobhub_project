package com.jobhub.controller.jobposting;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jobhub.common.CommonCode;
import com.jobhub.dto.jobposting.Description;
import com.jobhub.dto.jobposting.FAQs;
import com.jobhub.dto.jobposting.Job;
import com.jobhub.dto.jobposting.Jobposting;
import com.jobhub.dto.jobposting.PostingSearchCondition;
import com.jobhub.service.jobposting.JobpostingService;


@Controller
public class JobpostingController {

	@Autowired
	JobpostingService jobpostingService;
	
	@Autowired
    private SqlSession sqlSession;


	@GetMapping("/jobposting")
	public String jobsget(Model model ) {
		  List<Job> jobList = jobpostingService.findJobList(); 
		  model.addAttribute("jobList" , jobList);
		return "jobPosting/posting";
	}

	@PostMapping("/jobposting")
	public String jobpostingProcess(@ModelAttribute Jobposting jobposting, @ModelAttribute Description description /*HttpSession session*/) {

		String jobpostingId = sqlSession.selectOne("jobPosting_mapper.findJobpostingId"); //posting id 값 맞춘거
		//String adminId = (String) session.getAttribute("admin_id");
		
		jobposting.setPostingId(jobpostingId);
		//jobposting.setAdminID(adminId);
		
		int result = jobpostingService.saveJobposting(jobposting);

		description.setPostingId(jobpostingId);
		int result2 = jobpostingService.saveDescription(description);

		if(result > 0 && result2 > 0) { 
			System.out.println("성공");
			return "redirect:/jobpostingMain"; 

		} else { 
			System.out.println("실패");
			return "jobPosting/postingMain"; 
		}
	}

	//ajax
	@ResponseBody
	@PostMapping("/jobnameByPid")
	public List<Job> findJobNameListbyPid(@RequestParam int jobLevel1, Model model) {
		
	    List<Job> jobNameList = jobpostingService.findJobNameListbyPid(jobLevel1);
	    model.addAttribute("jobNameList", jobNameList);
	    
	    return jobNameList;
	}
	
	
	@RequestMapping("jobpostingMain")
	public String jobpostingMain(Model model, String keyword ) {
		
//		List<Jobposting> jobpostingList = jobpostingService.findJobpostingList();
		
		List<Jobposting> postingList = jobpostingService.findJobpostingListBySearchCondition(keyword);

//		model.addAttribute("jobpostingList" , jobpostingList);
		
		model.addAttribute("jobpostingList",postingList);
		
		model.addAttribute("postingCount",sqlSession.selectOne("jobPosting_mapper.findPostingCount"));
		
		
		return "jobPosting/postingMain";
	}
	
	
	@GetMapping("/modifyJobposting")
	public String modifyjobpositng(@RequestParam String postingId, Model model) {
		
		
		Jobposting jobposting = jobpostingService.findPostingBypostingId(postingId);
		Description description = jobpostingService.findDescriptionBypostingId(postingId);
		
		model.addAttribute("jobposting", jobposting);
		model.addAttribute("description", description);
		
		return "jobPosting/modifyJobposting";
	}
	
	
	@PostMapping("/modifyJobposting")
	public String  modifyJobpostingProcess(@ModelAttribute Jobposting jobposting , @ModelAttribute Description description) {
		
		int result = jobpostingService.modifyJobposting(jobposting);
		int result2 = jobpostingService.modifyDescription(description);

		if(result > 0 && result2 > 0) { 
			System.out.println("성공");
			return "redirect:jobpostingMain";  

		} else { 
			System.out.println("실패");
			return "jobPosting/modifyJobposting";
		}
		
		
	}
	
	

	//FAQs
	
	@GetMapping("addFaqs")
	public String addFAQs() {
		
		return "FAQs/addFaqs";
	}
	
	
	@PostMapping("addFaqs")
	public String addFAQsProcess(@ModelAttribute FAQs faqs) {
		
		int result = jobpostingService.saveFaqs(faqs);
		
		if(result > 0) { 
			System.out.println("성공");
			return "redirect:faqs";  

		} else { 
			System.out.println("실패");
			return "FAQs/addFaqs"; 
		}
	}
	
	
	@RequestMapping("faqs")
	public String faqsMain(Model model) {
		List<FAQs> faqsList = jobpostingService.findFaqsList();
		model.addAttribute("faqsList" , faqsList);
		model.addAttribute("faqsCount",sqlSession.selectOne("jobPosting_mapper.findFaqsCount"));
		return "FAQs/faqsMain";
	}
	
	@GetMapping("/modifyFaqs")
	public String modifyFaqs(@RequestParam String FAQsId, Model model) {
	
		FAQs faqs = jobpostingService.findFaqsbyId(FAQsId);
		
		model.addAttribute("faqs", faqs);
		
		return "FAQs/modifyFaqs";
	}
	
	
	@PostMapping("/modifyFaqs")
	public String  modifyFaqsProcess(@ModelAttribute FAQs faqs) {
		int result = jobpostingService.modifyFaqs(faqs);
	
		if(result > 0 ) { 
			System.out.println("성공");
			return "redirect:faqs";  

		} else {
			System.out.println("실패");
			return "FAQs/modifyFaqs"; 
		}
		
	}
	
	
	@RequestMapping("/removeFaqs")
	public String removeFaqsProcess(@RequestParam String FAQsId) {
		int result = jobpostingService.removeFaqsById(FAQsId);
		
		if(result > 0 ) {
			System.out.println("성공");
			return "redirect:faqs";
		} else {
			System.out.println("실패");
			return "FAQs/faqsMain";	
		}
	}
}
	
	



	
	

	
	





