package com.jobhub.dao.customer;

import java.util.List;

import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.customer.Scrap;
import com.jobhub.dto.jobposting.Job;
import com.jobhub.dto.jobposting.Notice;
import com.jobhub.dto.resume.Resume;

public interface CustomerDAO {

	public int saveUser(Customer customer);

	public Customer findCustomerInfo(String userId);
	
	public Customer findLoginCustomer (Customer customer);
	
	public int modifyCustomerInfo(Customer customer);
	
	public String pwCheck(String userId)throws Exception;
	
	public void pwUpdate(String userId, String hashedPw)throws Exception;
	
	
	public int modifyCustomerPw(Customer customer);
	
	public int removeCustomer(Customer customer);
	
	public int scrapNotice(Scrap scrapId);
	
	public List<Scrap> customerScarpList(String userId);
	
	public int removeCustomerScrapList(String userId);
	
	public int removeCustomerScrapItem(String scrapId);
	
	public int removeCustomerScrapItemByPostingId(String postingId);
	
	public List<Notice> scrapNoticeInfo(String scrapId);
	
	public List<Resume> customerResumeList(String userId);
	
//	public int scrapCheck(String id, String postingId);
//	
//	public int scrapCancel(String id, String postingId);
	

}
