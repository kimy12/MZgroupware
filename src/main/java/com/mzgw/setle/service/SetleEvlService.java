package com.mzgw.setle.service;

import java.util.List;
import java.util.Map;

import com.mzgw.dto.EvlVO;
import com.mzgw.dto.SetleEvlVO;
import com.mzgw.util.Criteria;

public interface SetleEvlService {

	
	
	public SetleEvlVO getSetleEvlByEvlNo(int evlNo)throws Exception;
	
	public void registSetleEvl(SetleEvlVO setleEvl)throws Exception;
	
	public void modifySetleEvl(SetleEvlVO setleEvl)throws Exception;
	
	public void removeSetleEvl(SetleEvlVO setleEvl)throws Exception;


	Map<String, Object> getSetleEvlListBySetleNo(int setleNo, Criteria cri) throws Exception;
	
	public Map<String, Object> getEvlResultAll(Criteria cri)throws Exception;
}
