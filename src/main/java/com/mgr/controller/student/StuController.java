package com.mgr.controller.student;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mgr.dto.LoginVO;
import com.mgr.dto.StudentVO;
import com.mgr.service.admin.AdminBasicService;
import com.mgr.service.student.StudentService;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping(value = "/student")
public class StuController {

	private static final Logger logger = LoggerFactory.getLogger(StuController.class);

	@Autowired
	@Qualifier("studentServiceImpl")
	private StudentService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/student001")
	public ModelAndView student001(Locale locale, Model model, StudentVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/student/student001");
		List<StudentVO> result = service.stucourselist(request, t);

		mav.addObject("courselist", result);
		mav.addObject("student_name", result.get(0).getStudent_name());
		return mav;
	}

	@RequestMapping(value = "/student002")
	public ModelAndView student002(Locale locale, Model model, StudentVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/student/student002");
		List<StudentVO> result = service.stuCourseListgrade(t, request);
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		String student_name = service.stuInfo(id_);
		mav.addObject("courselist", t);
		mav.addObject("sublist", result);
		mav.addObject("student_name", student_name);
		return mav;
	}

	@RequestMapping(value = "/studentinfo")
	public ModelAndView studentinfo(Locale locale, Model model, StudentVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/student/studentinfo");
		StudentVO result = service.stuInfoModList(t, request);
		mav.addObject("info", result);
		return mav;
	}

	@RequestMapping(value = "/stumodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView stumodify(StudentVO t, HttpServletRequest request, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/student/studentinfo");
		int code = service.stuInfoModify(t, request);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	@RequestMapping(value = "/stupwcheck", produces = "text/plain;charset=UTF-8")
	public String stupwcheck(StudentVO t) {
		Gson gson = new Gson();
		int check = service.stupwcheck(t);
		return gson.toJson(check);
	}
	
	
	@RequestMapping(value = "/stupwmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView stupwmodify(StudentVO t, HttpServletRequest request, RedirectAttributes redirectAttr, String newpw, String newpw2) {
		ModelAndView mav = new ModelAndView("redirect:/student/studentinfo");
		int code = service.stupwmodify(t, request, newpw, newpw2);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	
	

}
