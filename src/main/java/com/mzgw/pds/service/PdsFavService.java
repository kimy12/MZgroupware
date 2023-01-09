package com.mzgw.pds.service;

import java.sql.SQLException;
import java.util.Map;

import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FavVO;
import com.mzgw.util.Criteria;

public interface PdsFavService {
	
	public void insertFav(FavVO fav) throws SQLException;
	
	public void deleteFav(FavVO fav) throws SQLException;
	
	public Map<String, Object> getFavList(EmpVO ncnm) throws SQLException;
	
	public Map<String, Object> MyFavListAll(EmpVO ncnm, Criteria cri, String nowSort) throws Exception;
}
