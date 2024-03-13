package com.jobhub.service.customer;
import java.util.List;

import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.customer.Scrap;
import com.jobhub.dto.customer.CustomerSearchCondition;
import com.jobhub.dto.jobposting.Notice;
import com.jobhub.dto.resume.Resume;
public interface CustomerService {

	//customer 계정생성, 로그인, 목록, 검색, 비밀번호 찾기, 정보 수정
	
	public Customer findCustomerInfo(String userId);
	
	public Customer findLoginCustomer (Customer customer);

	public int saveUser(Customer customer);
	
	public int modifyCustomerInfo(Customer customer);
	
	public String pwCheck(String memberId)throws Exception;
	
	public void pwUpdate(String memberId, String hashedPw)throws Exception;
	
	public int modifyCustomerPw(Customer customer);
	
	public int removeCustomer(Customer customer);
	
	public int scrapNotice(Scrap scrapId);
	
	public List<Scrap> customerScrapList(String userId);
	
	public int removeCustomerScrapList(String userId);
	
	public int removeCustomerScrapItem(String scrapId);
	
	public int removeCustomerScrapItemByPostingId(String postingId);
	
	public List<Notice> scrapNoticeInfo(String scrapId);
	
	public List<Resume> customerResumeList(String userId);
	
	public List<Resume> findResumesByUserId(String userId);
	
	public List<Resume> findSubmissionResume(String userId);
	
	public List<Resume> findSubmissionResumeByPostingId(String postingId);
	
	public List<Resume> findNotSubmissionResume(String userId);
	
	public List<Customer> findCustomerList();
	
	public List<Customer> findCustomerListBySearchCondition(CustomerSearchCondition customerSearchCondition);

}
