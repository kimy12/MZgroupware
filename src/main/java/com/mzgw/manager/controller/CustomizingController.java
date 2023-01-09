package com.mzgw.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mzgw.board.service.BoardService;
import com.mzgw.board.service.CustomBoardService;
import com.mzgw.club.service.ClubService;
import com.mzgw.command.ClubRegistCommand;
import com.mzgw.dto.BoardTypeVO;
import com.mzgw.dto.ClubConceptVO;
import com.mzgw.dto.ClubVO;
import com.mzgw.dto.WorkTimeVO;
import com.mzgw.manager.service.ManagerService;
import com.mzgw.util.Criteria;

@Controller
@RequestMapping("/ctmzManager")
public class CustomizingController {
	
	@Autowired
	private CustomBoardService CustomBoardService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("/customizing")
	public ModelAndView customizing(ModelAndView mnv) throws Exception{
		String url = "manager/customizing"; 
		
		List<BoardTypeVO> customBoardList = boardService.getBoardMenu();
		WorkTimeVO workTime = managerService.getWorkTime();
		
		
		mnv.addObject("workTime",workTime);
		mnv.addObject("customBoardList",customBoardList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registClub")
	@ResponseBody
	public ResponseEntity<String> registClub(@RequestBody ClubRegistCommand crcmd) throws Exception{
		ResponseEntity<String> entity = null;
		
		ClubVO club = crcmd.toClubVO();
		
		List<ClubConceptVO> conceptList = crcmd.toClubConeptList();
		
		clubService.registClub(club, conceptList);
		
		entity = new ResponseEntity<String>("success", HttpStatus.CREATED);
		
		return entity;
	}
	
	@RequestMapping("/clubList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getCustomList(Criteria cri) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		cri.setPerPageNum(5);
		
		Map<String,Object> dataMap = clubService.getCustomClubList(cri);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.CREATED);
		
		return entity;
	}
	
	@RequestMapping("/deleteClub")
	@ResponseBody
	public ResponseEntity<String> deleteClub(ClubVO club) throws Exception{
		ResponseEntity<String> entity = null;
		
		clubService.removeClub(club.getClub_no());
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/getCustomList")
	@ResponseBody
	public ResponseEntity<List<BoardTypeVO>> getCustomList() throws Exception{
		ResponseEntity<List<BoardTypeVO>> entity = null;
		
		List<BoardTypeVO> customBoardList = boardService.getBoardMenu();
		
		entity = new ResponseEntity<List<BoardTypeVO>>(customBoardList, HttpStatus.CREATED);
		
		return entity;
	}
	
	@RequestMapping("/getCustomWorkTime")
	@ResponseBody
	public ResponseEntity<WorkTimeVO> getCustomWorkTime() throws Exception{
		ResponseEntity<WorkTimeVO> entity = null;
		
		WorkTimeVO workTime = managerService.getWorkTime();
		
		entity = new ResponseEntity<WorkTimeVO>(workTime, HttpStatus.CREATED);
		
		return entity;
	}
	
	@RequestMapping("/registboard")
	@ResponseBody
	public ResponseEntity<String> registBoard(@RequestBody BoardTypeVO boardType) throws Exception{
		ResponseEntity<String> entity = null;
		
		CustomBoardService.registBoard(boardType);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/getBoard")
	@ResponseBody
	public ResponseEntity<BoardTypeVO> getBoard(int bno) throws Exception{
		ResponseEntity<BoardTypeVO> entity = null;
		
		BoardTypeVO board = CustomBoardService.getBoardDetail(bno);
		
		entity = new ResponseEntity<BoardTypeVO>(board, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modifyBoard")
	@ResponseBody
	public ResponseEntity<String> modifyBoard(@RequestBody BoardTypeVO boardType) throws Exception{
		ResponseEntity<String> entity = null;
		
		CustomBoardService.modifyBoard(boardType);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/deleteBoard")
	@ResponseBody
	public ResponseEntity<String> deleteBoard(int bno) throws Exception{
		ResponseEntity<String> entity = null;
		
		CustomBoardService.removeBoard(bno);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modifyWorkTime")
	@ResponseBody
	public ResponseEntity<String> modifyWorkTime(@RequestBody WorkTimeVO workTime) throws Exception{
		ResponseEntity<String> entity = null;
		
		managerService.modifyWorkTime(workTime);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/modifyTopbar")
	@ResponseBody
	public ResponseEntity<String> modifyTopbar(String color) throws Exception{
		ResponseEntity<String> entity = null;
		
		managerService.modifyTopbarColor(color);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}

}
