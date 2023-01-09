package com.mzgw.manager.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AnnualVO;
import com.mzgw.dto.DclzManagerVO;
import com.mzgw.dto.DclzMeditationVO;
import com.mzgw.dto.DclzVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;

public class DclzManagerDAOImpl implements DclzManagerDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<DclzVO> selectDclzList(DclzVO dclz,Criteria cri) throws SQLException {
		
		Map<String, Object> map=null;
		try {
			map = (HashMap<String, Object>)MakeVOToMap.toMap(dclz,cri);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<DclzVO> dclzList=session.selectList("DclzManager-Mapper.selectDclzList",map);

		return dclzList;
	}

	@Override
	public List<DclzVO> selectTotalWork(DclzVO dclz) throws Exception {
		List<DclzVO> totalwork=session.selectList("DclzManager-Mapper.selectTotalWork",dclz);
		return totalwork;
	}

	@Override
	public List<DclzManagerVO> selectDclzWeekList(DclzManagerVO dmv) throws Exception {
		List<DclzManagerVO>weekList =session.selectList("DclzManager-Mapper.selectDclzWeekList",dmv);
		System.out.println(weekList);
		return weekList;
		
	}
	
	public List<EmpVO> selectEmpList(Criteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<EmpVO> empList = session.selectList("DclzManager-Mapper.selectEmpList",cri,rowBounds);
		return empList;
	}
	@Override
	public int selectEmpListCount(Criteria cri) throws Exception {
		int totalCount = session.selectOne("DclzManager-Mapper.selectEmpListCount",cri);
		
		return totalCount;
	}

	@Override
	public List<DclzMeditationVO> selectManagerDclzMediationList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<DclzMeditationVO> dclzMediationList = session.selectList("DclzManager-Mapper.selectDclzMediationList",cri,rowBounds);
		
		return dclzMediationList;
	}

	@Override
	public int selectDclzMediationListCount(Criteria cri) throws SQLException {
		int totalCount = session.selectOne("DclzManager-Mapper.selectDclzMediationListCount",cri);
		
		return totalCount;
	}

	@Override
	public void updateDclzMediation(DclzMeditationVO dclzmed) throws Exception {
		session.update("DclzManager-Mapper.updateDclzMediation",dclzmed);
		
	}

	@Override
	public void updateDclz(DclzMeditationVO dclzmed) throws Exception {
		session.update("DclzManager-Mapper.updateDclz",dclzmed);
	}

	@Override
	public void deleteDclzMediation(DclzMeditationVO dclzmed) throws Exception {

		session.update("DclzManager-Mapper.removeDclzMediation",dclzmed);
		
	}

	@Override
	public List<AnnualVO> selectAnnualList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<AnnualVO> annualList = session.selectList("DclzManager-Mapper.selectAnnualList",cri,rowBounds);
		
		return annualList;
	}

	@Override
	public int selectAnnualListCount(Criteria cri) throws SQLException {
		int totalCount = session.selectOne("DclzManager-Mapper.selectAnnualListCount",cri);
		
		return totalCount;
	}
	
	
	

}
