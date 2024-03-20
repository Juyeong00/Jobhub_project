package com.jobhub.controller.customer;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobhub.dto.customer.Customer;
import com.jobhub.service.apply.ApplyService;
import com.jobhub.service.customer.CustomerService;

@Controller
public class UserLoginController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	ApplyService applyService;

	@RequestMapping("/sign-up")
	public String signUp() {
		return "login/signup";
	}
	
	@PostMapping("/sign-up")
	public String signUpProcess(@ModelAttribute Customer customer) {
		
		int result = customerService.saveUser(customer);
		
		if(result > 0) {
			return "redirect:/login";
		}else {
			return "login/sign-up";
		}
		
	}
	
	@PostMapping("/sign-up/isDuplicatedId")
    @ResponseBody
    public Map<String, Object> isDuplicatedId(@RequestParam String id) {
        Map<String, Object> response = new HashMap<>();

        try {
            boolean isDuplicated = applyService.isDuplicatedId(id);

            if (isDuplicated) {
                response.put("resultCode", 409);
                response.put("msg", "아이디가 중복됩니다.");
            } else {
                response.put("resultCode", 200);
                response.put("msg", "사용 가능한 아이디입니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("resultCode", 500);
            response.put("msg", "서버 오류가 발생했습니다.");
        }

        return response;
    }
	
	
}
