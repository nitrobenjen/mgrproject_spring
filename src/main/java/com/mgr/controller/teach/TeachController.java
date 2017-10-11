package com.mgr.controller.teach;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mgr.dto.TeacherVO;
import com.mgr.service.teach.TeachService;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping(value = "/teacher")
public class TeachController {

	private static final Logger logger = LoggerFactory.getLogger(TeachController.class);

	@Autowired
	@Qualifier("teachServiceImpl")
	private TeachService service;

	// 강의 예정
	@RequestMapping(value = "/teacher101", produces = "text/plain;charset=UTF-8")
	public ModelAndView teacher101(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/teacher/teacher101");
		TeacherVO result = service.teachInfoModList(t, request);
		List<TeacherVO> sublist = service.teachcourselist(t, request);
		mav.addObject("info", result);
		mav.addObject("sublist", sublist);

		return mav;
	}

	@RequestMapping(value = "/teachcoursesearch", produces = "text/plain;charset=UTF-8")
	public String teachcoursesearch(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		Gson gson = new Gson();
		List<TeacherVO> sublist = service.teachcourselist(t, request);

		return gson.toJson(sublist);
	}

	@RequestMapping(value = "/teachschedulestulist", produces = "text/plain;charset=UTF-8")
	public String teachschedulestulist(Locale locale, Model model, TeacherVO t, HttpServletRequest request,
			String currentpage2) {
		Gson gson = new Gson();
		List<TeacherVO> sublist = service.teachschedulestulist(t, request, currentpage2);

		return gson.toJson(sublist);
	}

	////////////////
	/// 강의중
	@RequestMapping(value = "/teacher102", produces = "text/plain;charset=UTF-8")
	public ModelAndView teacher102(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/teacher/teacher102");
		TeacherVO result = service.teachInfoModList(t, request);
		List<TeacherVO> sublist = service.teachcourselisting(t, request);
		mav.addObject("info", result);
		mav.addObject("sublist", sublist);

		return mav;
	}

	@RequestMapping(value = "/teachcoursesearching", produces = "text/plain;charset=UTF-8")
	public String teachcoursesearching(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		Gson gson = new Gson();
		List<TeacherVO> sublist = service.teachcourselisting(t, request);

		return gson.toJson(sublist);
	}
	
	


	// 강의종료

	@RequestMapping(value = "/teacher103", produces = "text/plain;charset=UTF-8")
	public ModelAndView teacher103(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/teacher/teacher103");
		TeacherVO result = service.teachInfoModList(t, request);
		List<TeacherVO> sublist = service.teachcourselistend(t, request);
		mav.addObject("info", result);
		mav.addObject("sublist", sublist);

		return mav;
	}

	@RequestMapping(value = "/teachcoursesearchend", produces = "text/plain;charset=UTF-8")
	public String teachcoursesearchend(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		Gson gson = new Gson();
		List<TeacherVO> sublist = service.teachcourselistend(t, request);

		return gson.toJson(sublist);
	}
	
	

	////////

	/// 강사 배점관리//
	@RequestMapping(value = "/teacher201", produces = "text/plain;charset=UTF-8")
	public ModelAndView teacher201(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/teacher/teacher201");
		TeacherVO result = service.teachInfoModList(t, request);
		List<TeacherVO> sublist = service.teachbaejumlist(t, request);
		mav.addObject("sublist", sublist);
		mav.addObject("info", result);
		return mav;
	}

	@RequestMapping(value = "/teachbaejumsearch", produces = "text/plain;charset=UTF-8")
	public String teachbaejumsearch(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		Gson gson = new Gson();
		List<TeacherVO> sublist = service.teachbaejumlist(t, request);

		return gson.toJson(sublist);
	}

	@RequestMapping(value = "/teachbaejumadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView teachbaejumadd(HttpServletRequest request, RedirectAttributes redirectAttr,
			MultipartHttpServletRequest mRequest) {
		ModelAndView mav = new ModelAndView("redirect:/teacher/teacher201");
		int code = service.teachadd(mRequest);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	@RequestMapping(value = "/teachbaejummodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView teachbaejummodify(HttpServletRequest request, RedirectAttributes redirectAttr,
			MultipartHttpServletRequest mRequest) {
		ModelAndView mav = new ModelAndView("redirect:/teacher/teacher201");
		int code = service.teachbaejummodify(mRequest);
		redirectAttr.addFlashAttribute("code", code);

		return mav;
	}

	//////////////

	@RequestMapping(value = "/teacher301", produces = "text/plain;charset=UTF-8")
	public ModelAndView teacher301(Locale locale, Model model, TeacherVO t, HttpServletRequest request, String currentpage2) {
		ModelAndView mav = new ModelAndView("/teacher/teacher301");
		TeacherVO result = service.teachInfoModList(t, request);
		List<TeacherVO> sublist = service.teachbaejumlist(t, request);		
		mav.addObject("sublist", sublist);
		mav.addObject("info", result);
		return mav;
	}

	@RequestMapping(value = "/teacher302")
	public ModelAndView teacher302(Locale locale, Model model, TeacherVO t, HttpServletRequest request, String currentpage2) {
		ModelAndView mav = new ModelAndView("/teacher/teacher302");
		System.out.println(t.getOpen_course_id());
		TeacherVO result = service.teachInfoModList(t, request);
		List<TeacherVO> studentlist = service.teachStuGradelist(currentpage2, t);
		mav.addObject("studentlist", studentlist);
		mav.addObject("totalpage", studentlist.get(0).getTotalpage());
		mav.addObject("info", result);
		mav.addObject("course", t);
		mav.addObject("open_course_id", t.getOpen_course_id());
		return mav;
	}
	
	@RequestMapping(value = "/teachgradesearch", produces = "text/plain;charset=UTF-8")
	public String teachgradesearch(Locale locale, Model model, TeacherVO t, HttpServletRequest request, String currentpage2) {
		Gson gson = new Gson();
		List<TeacherVO> studentlist = service.teachStuGradelist(currentpage2, t);

		return gson.toJson(studentlist);
	}
	
	
	
	@RequestMapping(value = "/teachgradeadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView teachgradeadd(TeacherVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/teacher/teacher301");
		int code = service.teachgradeadd(t);
		redirectAttr.addFlashAttribute("code", code);

		return mav;
	}
	
	
	
	@RequestMapping(value = "/teachgrademodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView teachgrademodify(TeacherVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/teacher/teacher301");
		int code = service.teachgrademodify(t);
		redirectAttr.addFlashAttribute("code", code);

		return mav;
	}
	
	
	
	
	
	

	////////////////// 강사 개인정보 수정/////////
	@RequestMapping(value = "/teacherinfo", produces = "text/plain;charset=UTF-8")
	public ModelAndView teacherinfo(Locale locale, Model model, TeacherVO t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/teacher/teacherinfo");
		TeacherVO result = service.teachInfoModList(t, request);
		mav.addObject("info", result);
		return mav;
	}

	@RequestMapping(value = "/teachmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView teachmodify(TeacherVO t, HttpServletRequest request, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/teacher/teacherinfo");
		int code = service.teachInfoModify(t, request);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	@RequestMapping(value = "/teachpwcheck", produces = "text/plain;charset=UTF-8")
	public String teachpwcheck(TeacherVO t) {
		Gson gson = new Gson();
		int check = service.teachpwcheck(t);
		return gson.toJson(check);
	}

	@RequestMapping(value = "/teachpwmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView teachpwmodify(TeacherVO t, HttpServletRequest request, RedirectAttributes redirectAttr,
			String newpw, String newpw2) {
		ModelAndView mav = new ModelAndView("redirect:/teacher/teacherinfo");
		int code = service.teachpwmodify(t, request, newpw, newpw2);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

}
