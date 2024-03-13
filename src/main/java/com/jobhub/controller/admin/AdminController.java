package com.jobhub.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobhub.dto.admin.Admin;
import com.jobhub.dto.admin.AdminSearchCondition;
import com.jobhub.service.admin.AdminService;
import com.jobhub.util.LoginManager;

@Controller
//@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	LoginManager loginManager;
	
	@RequestMapping
	public String admin(HttpSession session) {
		return "admin/index";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		loginManager.logout(session);

		return "redirect:/admin/login";
	}

	// 로그인
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}

	@PostMapping("/login")
	public String loginProcess(@ModelAttribute Admin admin, HttpSession session, Model model) {
	    Admin loginAdmin = adminService.isValidAdminLogin(admin);
		System.out.println(admin);

		// 로그인 정보 (id, pw)
		// 로그인 로직처리 - Service
		// log.debug("로그인 시도 : {}", admin);

		if (loginAdmin == null) {
	        model.addAttribute("error", "아이디 또는 비밀번호를 확인해주세요.");
	        return "admin/login";
			// log.info("로그인 실패");
			// id pw 일치 X || 일치O 고객 아이디
		}
		// 로그인 정보 처리
		// session.setAttribute("loginId", loginAdmin.getId()); //로그인한 사용자의 id를 세션에 저장
		loginManager.setSessionLogin(loginAdmin.getAdminId(), session);
		// log.info("로그인 성공");
		return "redirect:/admin";
	}

	@GetMapping("/setting")
	public String adminSetting(Model model, @ModelAttribute AdminSearchCondition adminSearchCondition) {
		System.out.println("Received adminSearchCondition: " + adminSearchCondition);
		List<Admin> adminList;
		
		// 검색 조건이 없을 때 전체 목록을 가져옴

				if (adminSearchCondition != null) {
					adminList = adminService.findAdminListBySearchCondition(adminSearchCondition);
				} else {
					adminList = adminService.findAdminList();
				}
				System.out.println("Size of resumeList: " + adminList.size()); // 리스트사이즈 확인
				model.addAttribute("adminList", adminList);

				return "admin/adminSetting";
			}
	
}
