package com.mgr.service.login;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import com.mgr.dto.LoginVO;

public interface LoginService {

	public String loginurl(LoginVO t, HttpServletRequest request);

}
