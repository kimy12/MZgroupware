package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.util.Criteria;

public interface PdsPrivateDAO {
		//pds_seq.nextval 가져오기
		public int getSeqNextValue() throws SQLException;
		
		public void insertPdsPrivate(PdsPrivateVO pds)throws SQLException;
		
		public void updatePdsPrivate (PdsPrivateVO pds)throws SQLException;
		
		public Map<String, Object> pdsPrivateList(EmpVO ncnm, String nowSort, Criteria cri) throws Exception;
		
		public PdsPrivateVO pdsPrivateListByM(PdsPrivateVO pds)throws SQLException;
		
		public List<PdsPrivateVO> pdsBinList(EmpVO ncnm)throws SQLException;
		
		
		//폴더 제목 변경
		public void updateTitle(PdsPrivateVO pds)throws SQLException;
		
		//휴지통이동
		public void toBin(int no)throws SQLException;
		
		//복구
		public void recoverFromBin(int no)throws SQLException;
		
		public int getRefrnSeqNextValue() throws SQLException ;
		
		//참조당한 리스트
		public List<PdsPrivateVO> refrnPrivateList(EmpVO ncnm) throws SQLException;
		
		//폴더 삭제
		public void deleteFolder(int no)throws SQLException;
		
}
