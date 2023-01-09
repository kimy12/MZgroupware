package com.mzgw.board.service;

import java.sql.SQLException;
import java.util.Map;

import com.mzgw.dto.FaqVO;

public interface FaqService {

	public Map<String, Object> selectAllFaqList(int faqType) throws SQLException;

	void insertFaq(FaqVO faq) throws SQLException;

	void updateFaq(FaqVO faq) throws SQLException;

	void deleteFaq(FaqVO faq) throws SQLException;

}
