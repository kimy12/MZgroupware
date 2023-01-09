package com.mzgw.setle.dao;

import java.util.List;

import com.mzgw.dto.SetleFormVO;

public interface SetleFormDAO {

	public SetleFormVO selectSetleFormBySetleFormNo(int setleFormNo);
	
	public List<SetleFormVO> selectSetleFormList() throws Exception;

	public void insertSetleForm(SetleFormVO form) throws Exception;
	
	public int selectSetleFormSeq() throws Exception;
}
