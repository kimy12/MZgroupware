package com.mzgw.work.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.WorkMemVO;
import com.mzgw.dto.WorkVO;
import com.mzgw.util.Criteria;

public interface WorkDAO {

	/* 업무코드 가져오기 */
	public int getSelectWorkJno() throws SQLException;
	
	/* 첨부파일 코드 번호 */
	public int getSeqNextValue() throws SQLException;
	
	/* 업무 작성하기 */
	public int insertWork(WorkVO vo) throws SQLException;
	
	/* 할당자 넣기 */
	public int workMember(WorkMemVO mvo) throws SQLException;
	
	/* 공통업무 리스트 뽑아오기 */
	List<WorkVO> commonList(Criteria cri) throws SQLException;
	
	/* 개인업무 리스트 뽑아오기 */
	Map<String, Object> indivList(EmpVO loginEmp,String nowSort, Criteria cri) throws Exception;
	
	/* 할당자 리스트 뽑기 */
	List<WorkMemVO> assignMemList() throws SQLException;
	
	/* 업무 상세페이지 */
	WorkVO selectWorkByWno(int wno) throws SQLException;
	
	/* 업무에 업로드한 파일 리스트 전체 */
	List<AttachVO> fileUploadList() throws SQLException;
	
	/* 업무 수정 */
	public void updateWork(WorkVO wvo) throws SQLException;
	
	/* 할당자 삭제 */
	public void assMemDelete(WorkMemVO mvo) throws SQLException;
	
	/* 공통업무 전체 토탈 갯수*/
	public int selectWorkListCount(Criteria cri) throws SQLException;
	
	/* 업무 삭제 */
	public void deleteWork(int wno) throws SQLException;
	
	/* 업무삭제 동시*/
	public void deleteJobEmp(int wno) throws SQLException;
	
	List<WorkVO> selectJobBySttus(int jobSttus, EmpVO loginEmp) throws Exception;
	
	
}
