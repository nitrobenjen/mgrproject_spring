package com.mgr.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.dto.LoginVO;
import com.mgr.service.login.LoginService;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping(value="/login")
public class LoginController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	@Qualifier("loginServiceImpl")
	private LoginService service;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(Locale locale, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/login/login");

		return mav;
	}
	
	
	@RequestMapping(value = "/loginfail")
	public ModelAndView loginfail(Locale locale, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/login/loginfail");

		return mav;
	}
	
	
	@RequestMapping(value = "/loginstart")
	public ModelAndView loginstart(Locale locale, Model model, LoginVO t, HttpServletRequest request) {
		String url= service.loginurl(t, request);
		ModelAndView mav = new ModelAndView(url);
		return mav;
	}	
	
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		ModelAndView mav = new ModelAndView("redirect:/login/login");

		return mav;
	}
	
}
