package com.mzgw.feed.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import com.mzgw.attach.dao.AttachDAO;
import com.mzgw.dto.AttachVO;
import com.mzgw.feed.service.FeedService;
import com.mzgw.util.MakeFileName;

@RestController
@RequestMapping("/feed")
public class FeedRestController {

   @Autowired
   private FeedService feedService;
   
   @Autowired
   private AttachDAO attachDAO;
	
   
   @Resource(name = "feedUploadPath")
	private String feedUploadPath;
   
   private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;
		String uploadPath = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			uploadPath = feedUploadPath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
			
		
		return fileName;
	}
   
   @RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
   public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture)throws Exception {
	   ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;
		

		/* 파일저장확인 */
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.!";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;

		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
   }
   
   @RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String id) throws Exception {

		String picture = feedService.getFeedContent(id).getBackImg();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.feedUploadPath;

		try {
			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			in.close();
		}
		return entity;
	}
	
	
	 @RequestMapping(value = "/getMemPicture", produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getMemPicture(String id) throws Exception {

		String picture = feedService.getFeedContent(id).getProfileImg();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.feedUploadPath;

		try {
			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			in.close();
		}
		return entity;
	}
		
	@RequestMapping(value = "/getFeedImg")
	public ResponseEntity<byte[]> getFeedPicture(AttachVO attach) throws Exception {

		AttachVO attachVO = attachDAO.selectAttachMail(attach);
		
		String picture = attachVO.getFileName();
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.feedUploadPath;

		try {
			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			in.close();
		}
		return entity;
	}
	
	
	@GetMapping(path = "/video", produces = "video/mp4")
	public org.springframework.core.io.Resource video(AttachVO attach) throws FileNotFoundException, SQLException {
		AttachVO attachVO = attachDAO.selectAttachMail(attach);
		String picture = attachVO.getFileName();
		
		return  new InputStreamResource(new FileInputStream("C:\\feed\\file\\"+ picture +""));
	}

}
