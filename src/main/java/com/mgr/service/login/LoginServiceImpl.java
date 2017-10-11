package com.mgr.service.login;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.stereotype.Service;

import com.mgr.dao.login.LoginDAO;
import com.mgr.dto.LoginVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO dao;

	@Override
	public String loginurl(LoginVO t, HttpServletRequest request) {
		HttpSession session = null;
		LoginVO result = dao.LoginInfo(t);
		String url = "";
		if (result == null) {
			url = "redirect:/login/loginfail";
		}else {
			session = request.getSession(true);
			session.setAttribute("logininfo", result);
			int check = result.getGrade();

			if (result.getId_() !=null && check == 0) {
				url = "redirect:/admin/admin101";
			} else if (check == 1) {
				url = "redirect:/teacher/teacher101";
			} else if (check == 2) {
				url = "redirect:/student/student001";
			}
		}

	

		return url;
	}

}
