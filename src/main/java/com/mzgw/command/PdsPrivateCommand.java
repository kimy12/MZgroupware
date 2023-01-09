package com.mzgw.command;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mzgw.dto.PdsPrivateVO;
import com.mzgw.dto.RefrnVO;

public class PdsPrivateCommand {
	private String m_writer;
	private String m_title;
	private int m_unityatchmnflno;
	//private int refrn_unity_no;
	private List<MultipartFile> uploadFile;
	
	private String emp_nickname;
	
	
	
	public int getM_unityatchmnflno() {
		return m_unityatchmnflno;
	}
	public void setM_unityatchmnflno(int m_unityatchmnflno) {
		this.m_unityatchmnflno = m_unityatchmnflno;
	}
	public String getEmp_nickname() {
		return emp_nickname;
	}
	public void setEmp_nickname(String emp_nickname) {
		this.emp_nickname = emp_nickname;
	}
	public String getM_writer() {
		return m_writer;
	}
	public void setM_writer(String m_writer) {
		this.m_writer = m_writer;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public PdsPrivateVO toPdsPrivateVO() {
		PdsPrivateVO pdsPrivate = new PdsPrivateVO();
		pdsPrivate.setM_writer(this.m_writer);
		pdsPrivate.setM_title(this.m_title);
		pdsPrivate.setM_unityatchmnflno(this.m_unityatchmnflno);
		return pdsPrivate;
	}
	
	public List<RefrnVO> toRefrnList(){
		List<RefrnVO> refrnList = new ArrayList<RefrnVO>();
		String[] rfeArr = emp_nickname.split(",");
		if(rfeArr.length>0) {
			for(int i =0;i < rfeArr.length; i++) {
				RefrnVO vo = new RefrnVO();
				vo.setEmp_nickname(rfeArr[i]);
				System.out.println("찍히나요????"+rfeArr[i]);
				refrnList.add(vo);
			}
		}
		return refrnList;
	}
	
}
