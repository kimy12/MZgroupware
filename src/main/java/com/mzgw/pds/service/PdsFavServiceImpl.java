package com.mzgw.pds.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FavVO;
import com.mzgw.pds.dao.PdsFavDAO;
import com.mzgw.util.Criteria;

public class PdsFavServiceImpl implements PdsFavService{

	private PdsFavDAO pdsFavDAO;
	public void setPdsFavDAO(PdsFavDAO pdsFavDAO) {
		this.pdsFavDAO = pdsFavDAO;
	}
	
	@Override
	public void insertFav(FavVO fav) throws SQLException {
		pdsFavDAO.insertFav(fav);
	}

	@Override
	public Map<String, Object> getFavList(EmpVO ncnm) throws SQLException {
		
		Map<String, Object> dataMapForFav = new HashMap<String, Object>();
		
		List<FavVO> favList = pdsFavDAO.favList(ncnm);
		dataMapForFav.put("favList", favList);
		
		return dataMapForFav;
	}

	@Override
	public void deleteFav(FavVO fav) throws SQLException {
		pdsFavDAO.deleteFav(fav);
	}
	
	@Override
	public Map<String, Object> MyFavListAll(EmpVO ncnm, Criteria cri, String nowSort) throws Exception {
		Map<String, Object> dataMap = pdsFavDAO.myFavListAll(ncnm,nowSort,cri);
		List<AttachVO> pdsAttachList = (List<AttachVO>)dataMap.get("favAttachList");
		
		List<FavVO> favList = pdsFavDAO.favList(ncnm);
		
		
		boolean nullCheck = pdsAttachList != null || favList != null;
		
		if(nullCheck) {
			for(AttachVO attach : pdsAttachList) {
				for(FavVO fav : favList) {
					if(attach.getAno() == fav.getAno()) {
						attach.setFav("1");
					}
				}
			}
		}
		
		dataMap.put("pdsAttachList", pdsAttachList);
		return dataMap;
	}


}
