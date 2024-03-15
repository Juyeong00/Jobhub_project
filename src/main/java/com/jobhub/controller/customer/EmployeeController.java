package com.jobhub.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobhub.dto.employee.Employee;
import com.jobhub.dto.jobposting.Job;
import com.jobhub.service.apply.ApplyService;
import com.jobhub.service.jobposting.JobpostingService;

@Controller
public class EmployeeController {

	@Autowired
	ApplyService applyService;
	
	@Autowired
	JobpostingService jobpostingService;

	@RequestMapping("/people")
	public String people(@RequestParam(required = false, defaultValue="") String jobsName, Model model, Employee emp) {
		List<Job> jobList = jobpostingService.findJobList(); //카테고리 조회
		model.addAttribute("jobList" , jobList);
		
		
		if(jobsName.isEmpty()) {
			List<Employee> empList = applyService.findEmployeeList(); //전체 직원 조회
			model.addAttribute("empList", empList);
		}else {
			List<Employee> empNameList = applyService.findEmployeeByJobsname(jobsName);
			model.addAttribute("empList", empNameList);
		}
		
		return "employee/people";
	}
}
