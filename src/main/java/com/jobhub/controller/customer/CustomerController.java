package com.jobhub.controller.customer;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.customer.Scrap;
import com.jobhub.dto.employee.EmployeeJobsInfo;
import com.jobhub.dto.jobposting.Description;
import com.jobhub.dto.jobposting.FAQs;
import com.jobhub.dto.jobposting.Job;
import com.jobhub.dto.jobposting.Jobposting;
import com.jobhub.dto.jobposting.Notice;
import com.jobhub.dto.jobposting.PostingSearchCondition;
import com.jobhub.dto.resume.Resume;
import com.jobhub.service.admin.AdminService;
import com.jobhub.service.customer.CustomerService;
import com.jobhub.service.jobposting.JobpostingService;
import com.jobhub.util.LoginManager;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@Autowired
	AdminService adminService;

	@Autowired
	JobpostingService jobpostingService;

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	LoginManager loginManager;

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}

	private List<EmployeeJobsInfo> getRandomEmployeeJobsInfos(List<EmployeeJobsInfo> employeeList, int count) {
		List<EmployeeJobsInfo> randomEmployeeInfos = new ArrayList<>();
		Random random = new Random();
		int listSize = employeeList.size();

		// 중복된 인덱스를 방지하기 위한 Set
		Set<Integer> selectedIndices = new HashSet<>();

		for (int i = 0; i < count && i < listSize; i++) {
			int randomIndex;

			do {
				randomIndex = random.nextInt(listSize);
			} while (selectedIndices.contains(randomIndex));

			selectedIndices.add(randomIndex);

			randomEmployeeInfos.add(employeeList.get(randomIndex));
		}
		return randomEmployeeInfos;
	}

	@GetMapping("/")
	public String main(Model model) {

		List<EmployeeJobsInfo> employeeJobsInfoList = jobpostingService.findEmployeeJobsInfoList();
		List<EmployeeJobsInfo> randomEmployeeInfos = getRandomEmployeeJobsInfos(employeeJobsInfoList, 3);

		List<Job> findJobsNameByLevel1List = jobpostingService.findJobsNameByLevel1List();

		model.addAttribute("employeeInfoList",  randomEmployeeInfos);

		model.addAttribute("findJobsName", findJobsNameByLevel1List);

		return "main/mainpage";

	}




	@PostMapping("/login")
	public String loginProcess(@ModelAttribute Customer customer, HttpSession session,  Model model) {

		Customer loginUser = customerService.findLoginCustomer(customer);

		if(loginUser == null || !(customer.getUserId().equals(loginUser.getUserId()))|| 
				!(customer.getPassword().equals(loginUser.getPassword())) || loginUser.getCustomerStatus().equals("WITHDRAWAL")) {


			model.addAttribute("msg", "로그인 정보가 맞지 않습니다");

			return "login/login";


		}else {

			loginManager.setSessionLogin(loginUser.getUserId(), session);

			return "redirect:/";

		}

	}

	@PostMapping("/logout")
	public String logoutProcess(HttpSession session) {

		loginManager.logout(session);

		return  "redirect:/";
	}


	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model, Customer customer) {

		String findCustomer = (String)session.getAttribute("loginId");

		Customer customerInfo = customerService.findCustomerInfo(findCustomer);

		List<Resume> resumeSubmissionList = customerService.findSubmissionResume(findCustomer);

		List<Resume> notSubmissionresume = customerService.findNotSubmissionResume(findCustomer);

		model.addAttribute("resumeList", resumeSubmissionList);
		model.addAttribute("notSubmission", notSubmissionresume);
		model.addAttribute("userId", customerInfo.getUserId());
		model.addAttribute("loginPw", customerInfo.getPassword());
		model.addAttribute("name", customerInfo.getName());
		model.addAttribute("email", customerInfo.getEmail());
		model.addAttribute("birth", customerInfo.getBirth());
		model.addAttribute("phone", customerInfo.getPhone());
		model.addAttribute("gender", customerInfo.getGender());

		return "customer/mypage";

	}

	@GetMapping("/scrap_page")
	public String scrap_page(HttpSession session,Customer customer, 
			Model model,Scrap scrap) {

		String findCustomer = (String)session.getAttribute("loginId");

		session.getAttribute(findCustomer);

		List<Scrap> scrapList = customerService.customerScrapList(findCustomer);
		if (!scrapList.isEmpty()) {
			Scrap firstScrap = scrapList.get(0); 
			String postingId = firstScrap.getPostingId(); 
			List<Notice> noticeList = customerService.scrapNoticeInfo(postingId);
			model.addAttribute("noticeList", noticeList);
		} else {

		}
		model.addAttribute("scrapList",scrapList);

		return "customer/scrap_page";
	}


	@GetMapping("/showScrapNoticeInfo")
	public String scrapNoticeInfo(@RequestParam(name="postingId")String postingId, HttpSession session, Customer customer, Model model) {

		String findCustomer = (String)session.getAttribute("loginId");

		session.getAttribute(findCustomer);

		List<Scrap> scrapList = customerService.customerScrapList(findCustomer);
		List<Notice> noticeList = customerService.scrapNoticeInfo(postingId);
		model.addAttribute("scrapList",scrapList);
		model.addAttribute("noticeList", noticeList);

		return "customer/scrap_page";
	}

	@GetMapping("/scrapNotice")
	public String scrapNotice(@RequestParam(name="postingId")String postingId,
			@RequestParam(name="userId")String userId, Scrap scrap) {

		scrap.setPostingId(postingId);
		scrap.setUserId(userId);
		scrap.setScrapStatus("1");

		int result = customerService.scrapNotice(scrap);

		if(result >0) {
			return "redirect:/jobs";		
		}else {
			return "/";
		}

	}

	@GetMapping("/deleteAllScrap")
	public String deleteAllScrap(HttpSession session,Customer customer, Scrap scrap) {

		String findCustomer = (String)session.getAttribute("loginId");

		scrap.setScrapStatus("2");
		int result = customerService.removeCustomerScrapList(findCustomer);


		if (result > 0) {
			return "redirect:/jobs";
		} else {

			return "/"; 
		}
	}

	@GetMapping("/deleteScrapItem")
	public String deleteScrapItem(@RequestParam(name = "scrapId") String scrapId,
			@RequestParam(name = "postingId") String postingId,
			Scrap scrap) {
		scrap.setScrapStatus("2");
		int result = customerService.removeCustomerScrapItem(scrapId);

		if(result > 0) {
			if(postingId != null) {
				customerService.removeCustomerScrapItemByPostingId(postingId);
			}

			return "redirect:/scrap_page";
		}else {
			return "/";
		}

	}

	@PostMapping("/mypage/modifyCustomerInfo")
	public String modifyCustomerInfo(Customer customer, Model model) {

		int result = customerService.modifyCustomerInfo(customer);

		if(result >0) {

			return "redirect:/mypage";
		}else {


		}
		return "main/mainpage";
	}

	@PostMapping("/mypage/modifyPw")
	public String modifyCustomerPw(HttpSession session, Customer customer, Model model,
			HttpServletRequest request) {


		int result = customerService.modifyCustomerPw(customer);

		if(result > 0) {
			session.removeAttribute("loginId");
			session.removeAttribute("loginPw");
			return "redirect:/login";
		}else {

			model.addAttribute("error", "비밀번호 수정에 실패하였습니다.");
			return "customer/mypage";
		}

	}


	@PostMapping("/mypage/remove")
	public String removeCustomer(HttpSession session, Customer customer, Model model, HttpServletRequest request) {
		customer.setCustomerStatus("WITHDRAWAL");
		int result = customerService.removeCustomer(customer);

		if(result > 0) {
			session.removeAttribute("loginId");
			session.removeAttribute("loginPw");

			return "redirect:/";
		}else {
			model.addAttribute("msg", "삭제 실패");
			return "customer/mypage";
		}

	}

	//jobs category 별로 화면 바뀌는 거
	@GetMapping("/list")
	public String list( Model model , @RequestParam String jobsCateName ) throws UnsupportedEncodingException {

		model.addAttribute("page", "jobs");

		List<Jobposting>  jobpostingList = jobpostingService.findPostingListByjobscatename(jobsCateName);
		List<Job> jobList = jobpostingService.findJobList();

		for(Job job : jobList) {
			job.setJobsNameEncoded(java.net.URLEncoder.encode(job.getJobsName(), "UTF-8"));
		}

		List<Jobposting> jobpostingNameList = jobpostingService.findPostingAndJobNameList();

		model.addAttribute("postingCount",sqlSession.selectOne("jobPosting_mapper.findPostingCountByCate",jobsCateName));

		model.addAttribute("jobpostingList",jobpostingList);
		model.addAttribute("jobList" , jobList);
		model.addAttribute("jobpostingNameList" , jobpostingNameList);

		return "customer/list";
	}

	@GetMapping("/jobs")
	public String showAllNotice(HttpSession session, Jobposting postingId,
			Customer userId, Model model, PostingSearchCondition postingSearchCondition,Scrap scrap) {

		String findCustomer = (String)session.getAttribute("loginId");
		session.getAttribute(findCustomer);
		
		model.addAttribute("page", "jobs");

		List<Job> jobList = jobpostingService.findJobList();
		List<Jobposting> jobpostingList = jobpostingService.findJobpostingList();
		List<Jobposting> jobpostingNameList = jobpostingService.findPostingAndJobNameList();

		model.addAttribute("jobList" , jobList);
		model.addAttribute("jobpostingList" , jobpostingList);
		model.addAttribute("jobpostingNameList" , jobpostingNameList);

		model.addAttribute("postingCount",sqlSession.selectOne("jobPosting_mapper.findPostingCountOpen"));

		if(findCustomer != null) {
			List<Scrap> scrapList = customerService.customerScrapList(findCustomer);
			model.addAttribute("scrapList", scrapList);
		}
		return "customer/jobs";
	}


	//jobs 제목 누르면 상세보기 페이지
	@GetMapping("/jobsDescription")
	public String jobsDescription(@RequestParam String postingId, Model model, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId",loginId);
		Jobposting jobpostingById = jobpostingService.findPostingBypostingId(postingId);
		Description descriptionById = jobpostingService.findDescriptionBypostingId(postingId);


		List<Job> jobList = jobpostingService.findJobList();
		List<Jobposting> jobpostingList = jobpostingService.findJobpostingList();
		List<Jobposting> jobpostingNameList = jobpostingService.findPostingAndJobNameList();

		model.addAttribute("jobList" , jobList);
		model.addAttribute("jobpostingList" , jobpostingList);
		model.addAttribute("jobpostingNameList" , jobpostingNameList);

		model.addAttribute("jobpostingById", jobpostingById);
		model.addAttribute("descriptionById", descriptionById);
		model.addAttribute("postingId", postingId);


		return "customer/jobsDescription";
	}


	//faqs
	//faqs 메인
	@GetMapping("/faqs")
	public String showFaqs(Model model) {
		model.addAttribute("page", "faqs");
		List<FAQs> faqsList = jobpostingService.findFaqsList();
		model.addAttribute("faqsList" , faqsList);
		return "customer/faqs";
	}



}