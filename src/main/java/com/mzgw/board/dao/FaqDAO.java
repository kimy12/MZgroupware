package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.mzgw.dto.FaqVO;

public interface FaqDAO {
	
List<FaqVO> selectAllFaqList(int faqType) throws SQLException;

void insertFaq (FaqVO faq) throws SQLException;

void updateFaq (FaqVO faq) throws SQLException;

void deleteFaq (FaqVO faq) throws SQLException;



}
