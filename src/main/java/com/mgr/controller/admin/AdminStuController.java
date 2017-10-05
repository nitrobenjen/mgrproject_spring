package com.mgr.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminCourseVO;
import com.mgr.dto.AdminTeachVO;
import com.mgr.service.admin.AdminCourseService;
import com.mgr.service.admin.AdminStuService;
import com.mgr.service.admin.AdminTeachService;

@RestController // 객체랑 주소 같이 보내주고자 할 때.
@RequestMapping(value = "/admin")
public class AdminStuController {

	private static final Logger logger = LoggerFactory.getLogger(AdminStuController.class);

	// @Resource(name="AdminTeachService")
	@Autowired
	@Qualifier("adminStuServiceImpl")
	private AdminStuService service;

	@RequestMapping(value = "/admin401")
	public ModelAndView admin401(String currentpage2, Locale locale, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin401");		
		List<AdminCourseVO> result = service.adminStuList(currentpage2, t);		
		mav.addObject("studentlist", result);
		mav.addObject("totalpage", result.get(0).getTotalpage());
		
		return mav;
	}
	
	// 페이징 처리
	@RequestMapping(value = "/adminstupage", produces = "text/plain;charset=UTF-8")
	public String adminstupage(String currentpage2, AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> teacherlist = service.adminStuList(currentpage2, t);
		return gson.toJson(teacherlist);
	}
	
	
	// 검색
	@RequestMapping(value = "/adminstupagesearch", produces = "text/plain;charset=UTF-8")
	public String adminstupagesearch(String currentpage2, AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> teacherlist = service.adminStuList(currentpage2, t);
		return gson.toJson(teacherlist);
	}



	// 수강생 정보 등록
	@RequestMapping(value = "/adminstuinfoadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminstuinfoadd(HttpServletResponse response, AdminCourseVO t, RedirectAttributes redirectAttr)
			throws IOException {
		int code = service.adminStuInfoAdd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin401");
		redirectAttr.addFlashAttribute("code", code);
		return mav;

	}
	
	
	
	@RequestMapping(value = "/adminstudel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminstudel(AdminCourseVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin401");
		int code = service.adminStuDel(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	@RequestMapping(value = "/adminstumodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminstumodify(AdminCourseVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin401");
		int code = service.adminStuModify(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	//수강생 개설과정등록
	@RequestMapping(value = "/adminstucourseaddlist", produces = "text/plain;charset=UTF-8")
	public String adminstucourseaddlist(AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> result = service.adminstucourseaddlist(t);
		return gson.toJson(result);
	}

	
	@RequestMapping(value = "/adminStuCourseAdd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminStuCourseAdd(AdminCourseVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin401");
		int code = service.adminStuCourseAdd(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	@RequestMapping(value = "/admin402")
	public ModelAndView admin402(Locale locale, Model model, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin402");
		List<AdminCourseVO> result = service.adminstulistcourse(t);
		mav.addObject("stulist", t);
		mav.addObject("courselist", result);
		return mav;
	}
	
	
	@RequestMapping(value = "/adminstufailadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminstufailadd(AdminCourseVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin401");
		int code = service.adminstufailadd(t);
		redirectAttr.addFlashAttribute("code", code);
		
		return mav;
	}
	
	//중도탈락 검색
	@RequestMapping(value = "/adminstufailsearch", produces = "text/plain;charset=UTF-8")
	public String adminstufailsearch(AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> result = service.adminstulistcourse(t);
		return gson.toJson(result);
	}
	
	
	
	
	
	
	
}
