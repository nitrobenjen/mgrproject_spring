package com.mgr.controller.admin;


import java.util.List;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.google.gson.Gson;
import com.mgr.dto.AdminCourseVO;
import com.mgr.service.admin.AdminGradeService;


@RestController // 객체랑 주소 같이 보내주고자 할 때.
@RequestMapping(value = "/admin")
public class AdminGradeController {

	private static final Logger logger = LoggerFactory.getLogger(AdminGradeController.class);

	// @Resource(name="AdminTeachService")
	@Autowired
	@Qualifier("adminGradeServiceImpl")
	private AdminGradeService service;

	
	
	@RequestMapping(value = "/admin501", produces = "text/plain;charset=UTF-8")
	public ModelAndView admin501(Locale locale, Model model, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin501");
		List<AdminCourseVO> result = service.adminGradeCourse(t);
		mav.addObject("courselist", result);		
		return mav;
	}
	
	@RequestMapping(value = "/admingradecoursesearch", produces = "text/plain;charset=UTF-8")
	public String admingradecoursesearch(AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> courselist = service.adminGradeCourse(t);
		return gson.toJson(courselist);
	}	
	

	@RequestMapping(value = "/admin501-sub", produces = "text/plain;charset=UTF-8")
	public ModelAndView admin501sub(Locale locale, Model model, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin501-sub");
		List<AdminCourseVO> result = service.adminGradeSub(t);
		mav.addObject("open_course", t);
		mav.addObject("open_sub", result);		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/adminsubgradeview", produces = "text/plain;charset=UTF-8")
	public String adminsubgradeview(AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> courselist = service.adminsubgradeview(t);
		return gson.toJson(courselist);
	}	
	
	//////////////////////////
	
	
	
	

	@RequestMapping(value = "/admin502", produces = "text/plain;charset=UTF-8")
	public ModelAndView admin502(String currentpage2, Locale locale, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin502");
		List<AdminCourseVO> result = service.adminStuList(currentpage2, t);		
		mav.addObject("studentlist", result);
		mav.addObject("totalpage", result.get(0).getTotalpage());
		return mav;
	}

	@RequestMapping(value = "/admin502-sub", produces = "text/plain;charset=UTF-8")
	public ModelAndView admin502sub(Locale locale, Model model, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin502-sub");
		List<AdminCourseVO> result = service.adminstulistcoursegrade(t);
		mav.addObject("stulist", t);
		mav.addObject("courselist", result);
		return mav;
	}
	
	
	@RequestMapping(value = "/adminstugrade", produces = "text/plain;charset=UTF-8")
	public String adminstugrade(AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> courselist = service.adminstugrade(t);
		return gson.toJson(courselist);
	}	
	
	
	
	
	
	
	
	
	
}
