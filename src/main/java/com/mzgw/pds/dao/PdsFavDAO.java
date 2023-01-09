package com.mzgw.pds.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.FavVO;
import com.mzgw.util.Criteria;

public interface PdsFavDAO {

	public void insertFav(FavVO fav) throws SQLException;
	
	public void deleteFav(FavVO fav)throws SQLException;
	
	public Map<String, Object> myFavListAll(EmpVO ncnm, String nowSort, Criteria cri) throws Exception;
	
	public List<FavVO> favList(EmpVO ncnm) throws SQLException;
}
