package com.mzgw.setle.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.EvlVO;
import com.mzgw.dto.SetleEvlVO;
import com.mzgw.util.Criteria;

public interface SetleEvlDAO {

	
	
	public SetleEvlVO selectSetleEvlByEvlNo(int evlNo)throws Exception;
	
	public int selectSetleEvlSeq()throws Exception;
	
	public void insertSetleEvl(SetleEvlVO setleEvl)throws Exception;

	List<SetleEvlVO> selectSetleEvlListBySetleNo(int setleNo, Criteria cri) throws Exception;
	
	int selectSetleEvlListCountBySetleNo(int setleNo) throws Exception;
	
	public void updateSetleEvl(SetleEvlVO setleEvl)throws Exception;
	
	public void deleteSetleEvl(SetleEvlVO setleEvl)throws Exception;
	
	//전사평가 결과 조회
	public Map<String, Object> selectEvlAll(Criteria cri)throws Exception;
}
