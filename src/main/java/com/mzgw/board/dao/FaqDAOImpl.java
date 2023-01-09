package com.mzgw.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.FaqVO;

public class FaqDAOImpl implements FaqDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<FaqVO> selectAllFaqList(int faqType) throws SQLException {
		return session.selectList("Faq-Mapper.selectAllFaqList", faqType);
	}


	@Override
	public void insertFaq(FaqVO faq) throws SQLException {
		session.update("Faq-Mapper.insertFaq", faq);
		System.out.println("찍힐까");
		
	}

	@Override
	public void updateFaq(FaqVO faq) throws SQLException {

		session.update("Faq-Mapper.updateFaq", faq);
	}

	@Override
	public void deleteFaq(FaqVO faq) throws SQLException {

		session.delete("Faq-Mapper.deleteFaq", faq);
	}
	
}
