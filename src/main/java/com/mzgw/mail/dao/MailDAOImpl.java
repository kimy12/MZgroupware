package com.mzgw.mail.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.MailVO;
import com.mzgw.dto.ReceVO;
import com.mzgw.dto.RefeVO;
import com.mzgw.util.Criteria;
import com.mzgw.util.MakeVOToMap;
import com.mzgw.util.PageMaker;

public class MailDAOImpl implements MailDAO{
	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	/* 보낸메일 리스트 조회 */
	@Override
	public int mailTotalCount() throws SQLException {
		return session.selectOne("Mail-Mapper.mailTotal");
	}

	
	/* 보낸메일 리스트 조회 */
	@Override
	public Map<String, Object> sendMailList(EmpVO loginEmp, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, loginEmp);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<MailVO> sendMailList = session.selectList("Mail-Mapper.selectSendMail",  map, rowBounds);
		
		List<MailVO> totalCount = session.selectList("Mail-Mapper.selectSendMail",  map);
		
		pageMaker.setTotalCount(totalCount.size());
		
		dataMap.put("sendMailList", sendMailList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}
	

	/* 받은메일 리스트 조회 */
	@Override
	public Map<String, Object> receMailList(EmpVO loginEmp, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, loginEmp);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<MailVO> receMailList = session.selectList("Mail-Mapper.selectReceMail",  map, rowBounds);
		
		List<MailVO> totalCount = session.selectList("Mail-Mapper.selectReceMail",  map);
		
		pageMaker.setTotalCount(totalCount.size());
		
		dataMap.put("receMailList", receMailList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}

	/* 임시저장 리스트 조회 */
	@Override
	public Map<String, Object> storegeMailList(EmpVO loginEmp, String nowSort, Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		Map<String, Object> map = (HashMap<String, Object>) MakeVOToMap.toMap(cri, loginEmp);
		map.put("nowSort", nowSort);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<MailVO> storageMailList = session.selectList("Mail-Mapper.storageMail", map, rowBounds);
		
		List<MailVO> totalCount = session.selectList("Mail-Mapper.storageMail",  map);
		
		pageMaker.setTotalCount(totalCount.size());
		
		dataMap.put("storageMailList", storageMailList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}
	
	/* 작성페이지 메일 리스트  */
	@Override
	public List<EmpVO> empMailList() throws SQLException {
		return session.selectList("Mail-Mapper.mailAddressList");
	}

	/* 메일 작성  */
	@Override
	public int insertMail(MailVO vo) throws SQLException {
		 return session.insert("Mail-Mapper.insertMail", vo); 
	}

	/* 첨부파일 시퀀스 가져오기  */
	@Override
	public int getSeqNextValue() throws SQLException {
		return session.selectOne("Mail-Mapper.selectMailSeqNext");
	}

	/* 메일번호 가져오기 */
	@Override
	public int getEmailNoSeqNextValue() throws SQLException {
		return session.selectOne("Mail-Mapper.selectMailEno");
	}

	/* 받는사람 저장하기 */
	@Override
	public int insertReceEmp(ReceVO rvo) throws SQLException {
		return session.insert("Mail-Mapper.insertReceEmp", rvo);
	}

	
	/* 참조자 넣기 */
	@Override
	public int insertRefeEmp(RefeVO rfo) throws SQLException {
		return session.insert("Mail-Mapper.insertRefeEmp", rfo);
	}

	/* 메일 상세 페이지 */
	@Override
	public MailVO selectMailByEno(int eno) throws SQLException {
		return session.selectOne("Mail-Mapper.selectMailByEno", eno);
	}

	/* 받은사람 이름 리스트 가져오기 */
	@Override
	public List<ReceVO> receEmpList() throws SQLException {
		return session.selectList("Mail-Mapper.selectReceEmpList");
	}

	/* 참조자 리스트 가져오기 */
	@Override
	public List<RefeVO> refeEmpList() throws SQLException {
		return session.selectList("Mail-Mapper.selectRefeEmpList");
	}

	/* 메일에 업로드한 파일 리스트 가져오기 */
	@Override
	public List<AttachVO> fileUploadList() throws SQLException {
		return session.selectList("Mail-Mapper.mailAttachList");
	}

	/* 보낸 메일 휴지통 조회 */
	@Override
	public List<MailVO> removeSendMailList(EmpVO loginEmp) throws SQLException {
		return session.selectList("Mail-Mapper.removeSendMail", loginEmp);
	}

	/* 받은 메일 휴지통 조회 */
	@Override
	public List<MailVO> removeReceMailList(EmpVO loginEmp) throws SQLException {
		return session.selectList("Mail-Mapper.removeReceMail", loginEmp);
	}

	/* 받은사람 휴지통 이동 */
	@Override
	public void ReceUpdateRemoveCode(int eno) throws SQLException {
		session.update("Mail-Mapper.ReceRemoveCodeChange", eno);
	}

	/* 보낸사람 휴지통 이동 */
	@Override
	public void SendUpdateRemoveCode(int eno) throws SQLException {
		session.update("Mail-Mapper.SendRemoveCodeChange", eno);
	}

	/* 읽음 표시 */
	@Override
	public void StateUpdate(int eno) throws SQLException {
		session.update("Mail-Mapper.sttusNumUpdate", eno);
	}

	
	/* 보낸 메일 상세 */
	@Override
	public void sendDeleteMail(MailVO sendVo) throws SQLException {
		
		session.update("Mail-Mapper.deleteSendMail", sendVo);
	}

	/* 받은 메일 상세 */
	@Override
	public void receDeleteMail(ReceVO receVo) throws SQLException {
		session.update("Mail-Mapper.deleteReceMail", receVo);
	}

	/* 임시저장 업데이트 */
	@Override
	public void storageUpdate(int eno) throws SQLException {
		session.update("Mail-Mapper.storageSendMail", eno);
		
	}

	/* 받은 메일 복원 */
	@Override
	public void sendReturnMail(int eno) throws SQLException {
		session.update("Mail-Mapper.returnSendMail", eno);
	}

	/* 보낸 메일 복원 */
	@Override
	public void receReturnMail(int eno) throws SQLException {
		session.update("Mail-Mapper.returnReceMail", eno);
	}


	@Override
	public List<MailVO> dashboardAll(EmpVO loginEmp) throws SQLException {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds(0,4);
		Map<String, Object> map = null;
		try {
			map = (HashMap<String, Object>) MakeVOToMap.toMap(loginEmp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return session.selectList("Mail-Mapper.dashboardAll", map, rowBounds);
	}


	@Override
	public List<MailVO> dashboardTrash(EmpVO loginEmp) throws SQLException {
		RowBounds rowBounds = new RowBounds(0,4);
		Map<String, Object> map = null;
		try {
			map = (HashMap<String, Object>) MakeVOToMap.toMap(loginEmp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return session.selectList("Mail-Mapper.dashboardTrash", map, rowBounds);
	}


	@Override
	public Map<String, Object> selectMailListCount(EmpVO loginEmp) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> datamap = session.selectOne("Mail-Mapper.selectMailListCount",loginEmp.getEmpl_no());
		return datamap;
	}


	@Override
	public List<ReceVO> recentlyList(EmpVO loginEmp) throws SQLException {
		return session.selectList("Mail-Mapper.recentlyList", loginEmp);
	}








	




	



}
