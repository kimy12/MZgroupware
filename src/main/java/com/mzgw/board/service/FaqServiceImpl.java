package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.board.dao.FaqDAO;
import com.mzgw.dto.FaqVO;

public class FaqServiceImpl implements FaqService {
	
	private FaqDAO faqDAO;

	public void setFaqDAO(FaqDAO faqDAO) {
		this.faqDAO = faqDAO;
	}

	@Override
	public Map<String, Object> selectAllFaqList(int faqType ) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<FaqVO> selectAllFaqList = faqDAO.selectAllFaqList(faqType);	
		System.out.println(selectAllFaqList.size());
		dataMap.put("faqList", selectAllFaqList);
		
		return dataMap;
	}



	@Override
	public void insertFaq(FaqVO faq) throws SQLException {
		
		System.out.println("faq.getFaq_writer() : "+ faq.getFaq_writer());
		System.out.println("faq.getFaq_type() : "+ faq.getFaq_type());
		System.out.println("faq.getFaq_que() : "+ faq.getFaq_que());
		System.out.println("faq.getFaq_ans() : "+ faq.getFaq_ans());
		faqDAO.insertFaq(faq);
	}

	@Override
	public void updateFaq(FaqVO faq) throws SQLException {

		faqDAO.updateFaq(faq);
	}

	@Override
	public void deleteFaq(FaqVO faq) throws SQLException {
		
		faqDAO.deleteFaq(faq);
	}

	
}
