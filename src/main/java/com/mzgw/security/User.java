package com.mzgw.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.mzgw.dto.EmpVO;

public class User implements UserDetails{
	
	private EmpVO emp;
	public User(EmpVO emp) {
		this.emp = emp;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<>();
		roles.add(new SimpleGrantedAuthority(emp.getAuthority()));
		return roles;
	}

	@Override
	public String getPassword() {
		return emp.getPassword();
	}

	@Override
	public String getUsername() {
		return emp.getId();
	}

	@Override
	public boolean isAccountNonExpired() { //신규 유저 여부 : enabled=4
		
		return emp.getEnabled() != 4;
	}

	@Override
	public boolean isAccountNonLocked() { //사용정지 혹은 휴먼계정 : enabled=3
		
		return emp.getEnabled() != 3;
	}

	@Override
	public boolean isCredentialsNonExpired() { //인증만료 여부 : enabled=2
		
		return emp.getEnabled() != 2;
	}

	@Override
	public boolean isEnabled() { // 탈퇴 혹은 삭제 : enabled = 0
		
		return emp.getEnabled() != 0;
	}
	
	public EmpVO getEmpVO() {
		return this.emp;
	}
}
