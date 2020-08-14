package service;

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

import dao.UserDao;


@Service
public class AuthenProvider implements AuthenticationProvider {
  
  @Autowired
  UserDao userDaoiplm;
  
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
        String password = authentication.getCredentials().toString();
        
        String key = "phone";
     
        if (userDaoiplm.checkLogin(username, userDaoiplm.encode(password), key) != null ) {
            List<GrantedAuthority> grantedAuths = new ArrayList<>();
            grantedAuths.add(new SimpleGrantedAuthority("ROLE_"+userDaoiplm.checkLogin(username, userDaoiplm.encode(password),key).getRole()));
            return new UsernamePasswordAuthenticationToken(username, password, grantedAuths);
        }
        return null;
        
	}

	@Override
	public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}


}
