package com.mzgw.work.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.SetleVO;
import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class WorkDAOImpl implements WorkDAO{
	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int getSelectWorkJno() throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkJno");
	}

	@Override
	public int insertWork(WorkVO vo) throws SQLException {
		return session.update("Work-Mapper.insertWork", vo);
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkFileSeqNext");
	}

	@Override
	public int workMember(WorkMemVO mvo) throws SQLException {
		return session.update("Work-Mapper.workMember", mvo);
	}

	@Override
	public List<WorkVO> commonList(Criteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("Work-Mapper.selectCommonList", cri, rowBounds);
	}

	@Override
	public List<WorkMemVO> assignMemList() throws SQLException {
		return session.selectList("Work-Mapper.assignMemList");
	}

	@Override
	public WorkVO selectWorkByWno(int wno) throws SQLException {
		return session.selectOne("Work-Mapper.selectDetailWno", wno);
	}

	@Override
	public List<AttachVO> fileUploadList() throws SQLException {
		return session.selectList("Work-Mapper.workAttachList");
	}

	@Override
	public void updateWork(WorkVO wvo) throws SQLException {
		session.update("Work-Mapper.workModify", wvo);
	}

	@Override
	public void assMemDelete(WorkMemVO mvo) throws SQLException {
		session.delete("Work-Mapper.assMemDelete", mvo);
	}

	@Override
	public int selectWorkListCount(Criteria cri) throws SQLException {
		return session.selectOne("Work-Mapper.selectWorkTotalCount", cri);
	}

	@Override
	public Map<String, Object> indivList(EmpVO loginEmp, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, loginEmp);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		
		List<WorkVO> workList = session.selectList("Work-Mapper.selectIndivList", map, rowBounds);
		
		int totalCount = workList.size();
		
		pageMaker.setTotalCount(totalCount);
		
		
		dataMap.put("workList", workList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void deleteWork(int wno) throws SQLException {
		session.delete("Work-Mapper.deleteWork", wno);
		
	}

	@Override
	public void deleteJobEmp(int wno) throws SQLException {
		session.delete("Work-Mapper.deleteJobEmp", wno);
	}

	@Override
	public List<WorkVO> selectJobBySttus(int jobSttus, EmpVO loginEmp) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = MakeVOToMap.toMap(loginEmp);
		map.put("jobSttus", jobSttus);

		RowBounds rowBounds = new RowBounds(0,4);
		
		return session.selectList("Work-Mapper.selectJobBySttus", map,rowBounds);
	}

	
	
	
}
