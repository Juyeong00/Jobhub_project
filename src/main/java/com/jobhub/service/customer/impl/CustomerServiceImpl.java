package com.jobhub.service.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobhub.dao.customer.CustomerDAO;
import com.jobhub.dto.customer.Customer;
import com.jobhub.dto.customer.CustomerSearchCondition;
import com.jobhub.dto.customer.Scrap;
import com.jobhub.dto.jobposting.Notice;
import com.jobhub.dto.resume.Resume;
import com.jobhub.service.customer.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO customerDAO;
	

	
	@Override
	public Customer findCustomerInfo(String userId) {
		// TODO Auto-generated method stub
		Customer findCustomerInfo = customerDAO.findCustomerInfo(userId);
		
		return findCustomerInfo;
	}

	@Override
	public Customer findLoginCustomer(Customer customer) {
		// TODO Auto-generated method stub
		
		Customer loginCustomer = customerDAO.findLoginCustomer(customer);
		return loginCustomer;
	}

	public int saveUser(Customer customer) {
		// TODO Auto-generated method stub
		int result = customerDAO.saveUser(customer);
		return result;
	}

	@Override
	public int modifyCustomerInfo(Customer customer) {
		// TODO Auto-generated method stub
		
		int result = customerDAO.modifyCustomerInfo(customer);
		
		
		return result;
	}

	@Override
	public int modifyCustomerPw(Customer customer) {
		// TODO Auto-generated method stub
		
		int result = customerDAO.modifyCustomerPw(customer);
		
		return result;
	}

	@Override
	public int removeCustomer(Customer customer) {
		// TODO Auto-generated method stub
		
		int result = customerDAO.removeCustomer(customer);
		return result;
	}

	@Override
	public List<Scrap> customerScrapList(String userId) {
		// TODO Auto-generated method stub
		
		List<Scrap> scrapList = customerDAO.customerScrapList(userId);
		return scrapList;
	}

	@Override
	public int removeCustomerScrapList(String userId) {
		// TODO Auto-generated method stub
		int result = customerDAO.removeCustomerScrapList(userId);
		
		return result;
	}

	@Override
	public List<Notice> scrapNoticeInfo(String scrapId) {
		// TODO Auto-generated method stub
		List<Notice> noticeList = customerDAO.scrapNoticeInfo(scrapId);
		
		return noticeList;
	}

	@Override
	public int removeCustomerScrapItem(String scrapId) {
		// TODO Auto-generated method stub
		int result = customerDAO.removeCustomerScrapItem(scrapId);
		
		return result;
	}

	@Override
	public int removeCustomerScrapItemByPostingId(String postingId) {
		// TODO Auto-generated method stub
		int result = customerDAO.removeCustomerScrapItemByPostingId(postingId);
		
		return result;
	}

	

	@Override
	public int scrapNotice(Scrap scrapId) {
		// TODO Auto-generated method stub
		
		int result = customerDAO.scrapNotice(scrapId);
		
		return result;
	}

	@Override
	public List<Resume> customerResumeList(String userId) {
		// TODO Auto-generated method stub
		
		List<Resume> resumeList = customerDAO.customerResumeList(userId);
		return resumeList;
	}

	@Override
	public String pwCheck(String memberId) throws Exception {
		// TODO Auto-generated method stub
		String pwCheck = customerDAO.pwCheck(memberId);
		return pwCheck;
	}

	@Override
	public void pwUpdate(String memberId, String hashedPw) throws Exception {
		// TODO Auto-generated method stub
		customerDAO.pwUpdate(memberId, hashedPw);
		
	}

	@Override
	public List<Resume> findResumesByUserId(String userId) {
		// TODO Auto-generated method stub
		
		List<Resume> resumeList = customerDAO.customerResumeList(userId);
		return resumeList;
	}

	@Override
	public List<Resume> findSubmissionResume(String userId) {
		// TODO Auto-generated method stub
		
		List<Resume> resumeList = customerDAO.findSubmissionResume(userId);
		return resumeList;
	}

	@Override
	public List<Resume> findSubmissionResumeByPostingId(String postingId) {
		// TODO Auto-generated method stub
		
		List<Resume> resumeList = customerDAO.findSubmissionResumeByPostingId(postingId);
		return resumeList;
	}

	@Override
	public List<Resume> findNotSubmissionResume(String userId) {
		// TODO Auto-generated method stub
		
		List<Resume> resumeList = customerDAO.findNotSubmissionResume(userId);
		return resumeList;
	}
	
	

	@Override
	public List<Customer> findCustomerList() {
		List<Customer> customerList = customerDAO.findCustomerList();
		return customerList;
	}
	@Override
	public List<Customer> findCustomerListBySearchCondition(CustomerSearchCondition customerSearchCondition) {
		List<Customer> customerList = customerDAO.findCustomerListBySearchCondition(customerSearchCondition);
		return customerList;
	}

	
}
