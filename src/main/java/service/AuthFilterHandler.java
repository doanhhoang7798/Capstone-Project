package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

@Service
public class AuthFilterHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String role = auth.getAuthorities().toString();

		String targetUrl = "";
		if (role.equals("[ROLE_10]")) {
			targetUrl = "/admin/Dashboard";
		} else if (role.equals("[ROLE_1]")) {
			targetUrl = "/";
		}
		return targetUrl;
	}

}
