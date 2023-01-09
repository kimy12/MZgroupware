package com.mzgw.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import com.mzgw.dto.EmpVO;
import com.mzgw.emp.service.EmpService;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	private EmpService empService;
	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal();
		String login_pwd = (String) auth.getCredentials();
		
		EmpVO emp = null;
		
		try {
			emp = empService.getEmp(login_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BadCredentialsException("서버 장애로 서비스가 불가합니다");
		}
		
		if(emp != null) {		
			if(login_pwd.equals(emp.getPassword())) {
				UserDetails authUser = new User(emp);
				
				if(!authUser.isAccountNonExpired()) {
					throw new BadCredentialsException("MZGroupware 가입을 축하드립니다 개인정보 보호를 위해 아이디 비밀번호 변경 및 닉네임을 설정하세요!");
				}
				
				boolean invalidCheck = authUser.isAccountNonLocked()
					  	   && authUser.isCredentialsNonExpired()
					  	   && authUser.isEnabled();
				if(invalidCheck) {
					UsernamePasswordAuthenticationToken result =
							new UsernamePasswordAuthenticationToken(authUser.getUsername(),
									authUser.getPassword(),
									authUser.getAuthorities());
					result.setDetails(authUser);
					try {
						empService.updateLastCheck(emp.getId());
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return result;					
				}
				throw new BadCredentialsException("상태가 변경되어 로그인이 불가능 합니다.");
			}else {
				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
			}
		}else {
			throw new BadCredentialsException("존재하지 않는 아이디 입니다.");
		}
		
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	

}
