package com.mzgw.address.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mzgw.address.service.AddressService;
import com.mzgw.dto.EmpVO;

@RestController
@RequestMapping("/address")
public class AddressRestController {
	@Autowired
	AddressService addressService;
	
	
}
