package com.fpt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import com.fpt.dao.UserDao;


@Service
public class AuthenProvider implements AuthenticationProvider {
  
  @Autowired
  UserDao userDaoiplm;
  
//  UserDao userDaoiplm = new UserDao()

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String username = authentication.getName();
        // You can get the password here
        String password = authentication.getCredentials().toString();
        
        String key = username.contains("@") ? "email" : "phone";
     
        if (userDaoiplm.checkLogin(username, password, key) != null ) {
            List<GrantedAuthority> grantedAuths = new ArrayList<>();
            grantedAuths.add(new SimpleGrantedAuthority("ROLE_"+userDaoiplm.checkLogin(username, password,key).getRole()));
            return new UsernamePasswordAuthenticationToken(username, password, grantedAuths);
        }
        return null;
        
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}


}
