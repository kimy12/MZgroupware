package com.mzgw.manager.service;


import java.util.Map;

import com.mzgw.dto.DclzManagerVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.util.Criteria;

public interface DclzManagerService {
	
	public Map<String, Object> getDclzManagerList(Criteria cri,DclzVO dclz) throws Exception;
	
	public Map<String, Object> getDclzWeekList(DclzManagerVO dmv) throws Exception;
	
	public Map<String, Object> getManagerDclzMediationList(Criteria cri)throws Exception;
	
	public Map<String, Object> getManagerAnnualList(Criteria cri)throws Exception;
	
	public void modifyDclzMediation(DclzMeditationVO dclzmed) throws Exception;
	
	public void removeDclzMediation(DclzMeditationVO dclzmed) throws Exception;
	
}
