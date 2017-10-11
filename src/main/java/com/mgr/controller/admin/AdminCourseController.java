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
import com.mgr.service.admin.AdminTeachService;

@RestController // 객체랑 주소 같이 보내주고자 할 때.
@RequestMapping(value = "/admin")
public class AdminCourseController {

	private static final Logger logger = LoggerFactory.getLogger(AdminCourseController.class);

	// @Resource(name="AdminTeachService")
	@Autowired
	@Qualifier("adminCourseServiceImpl")
	private AdminCourseService service;

	// 개설 과정
	@RequestMapping(value = "/admin301", method = RequestMethod.GET)
	public ModelAndView admin301(Locale locale, Model model, AdminCourseVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin301");
		List<AdminCourseVO> courselist = service.adminCourseList(t);
		mav.addObject("courselist", courselist);
		return mav;
	}

	// 과정등록
	@RequestMapping(value = "/admincourseadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasiccourseadd(HttpServletResponse response, AdminCourseVO t,
			RedirectAttributes redirectAttr) throws IOException {
		int code = service.admincourseadd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin301");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 과정 등록을 위한 과정, 강의 정보 가져오기
	@RequestMapping(value = "/admincourseaddlist", produces = "text/plain;charset=UTF-8")
	public String admincourseaddlist() {
		Gson gson = new Gson();
		List<AdminBasicVO> courseaddlist = service.adminCourseAddList();
		return gson.toJson(courseaddlist);
	}

	// 과정 삭제
	@RequestMapping(value = "/admincoursedel", produces = "text/plain;charset=UTF-8")
	public ModelAndView admincoursedel(AdminCourseVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin301");
		int code = service.adminCourseDel(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	//과정 수정
	
	@RequestMapping(value = "/admincoursemdify", produces = "text/plain;charset=UTF-8")
	public ModelAndView admincoursemdify(AdminCourseVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin301");
		int code = service.adminCourseMdify(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	// 과정 등록을 위한 과정, 강의 정보 가져오기
	@RequestMapping(value = "/admincoursemodifylist", produces = "text/plain;charset=UTF-8")
	public String admincoursemodifylist() {
		Gson gson = new Gson();
		List<AdminBasicVO> coursemodifylist = service.adminCourseAddList();
		return gson.toJson(coursemodifylist);
	}
	
	//과정 검색
	@RequestMapping(value = "/admincoursesearch", produces = "text/plain;charset=UTF-8")
	public String admincoursesearch(AdminCourseVO t) {
		Gson gson = new Gson();
		List<AdminCourseVO> courselist = service.adminCourseList(t);
		return gson.toJson(courselist);
	}
	
	

	///////////개설과목////////////

	@RequestMapping(value = "/admin302")
	public ModelAndView admin302(Locale locale, Model model, AdminCourseVO t, String open_course_id) {		
		ModelAndView mav = new ModelAndView("/admin/admin302");
		List<AdminCourseVO> open_sub = service.adminOpenSub(t, open_course_id);
		mav.addObject("open_course", t);
		mav.addObject("open_sub", open_sub);
		if(open_sub.size() != 0) {
			if(open_sub.get(0).getAddcheck() != null || open_sub.get(0).getAddcheck() != "") {
				mav.addObject("addcheck", open_sub.get(0).getAddcheck());
			}
		}

		
		return mav;
	}
	
	//과목 검색
	@RequestMapping(value = "/adminsubsearch", produces = "text/plain;charset=UTF-8")
	public String adminsubsearch(AdminCourseVO t, String open_course_id) {
		Gson gson = new Gson();
		List<AdminCourseVO> courselist = service.adminOpenSub(t, open_course_id);
		return gson.toJson(courselist);
	}
	
	// 개설 과목 등록 위해 과목, 교재 기초정보 가져오기
	@RequestMapping(value = "/adminsubaddlist", produces = "text/plain;charset=UTF-8")
	public String adminsubaddlist() {
		Gson gson = new Gson();
		List<AdminBasicVO> subaddlist = service.adminSubAddList();
		return gson.toJson(subaddlist);
	}
	
	//변경하면 강사 정보도 가져오기
	@RequestMapping(value = "/adminsubaddlistteach", produces = "text/plain;charset=UTF-8")
	public String adminsubaddlistteach(String subject_id) {
		Gson gson = new Gson();
		List<AdminTeachVO> result = service.adminSubAddListTeach(subject_id);
		return gson.toJson(result);
	}
	
	//개설과목 시작날짜 탐색을 위한~
	@RequestMapping(value = "/adminsubdaysearch", produces = "text/plain;charset=UTF-8")
	public String adminsubdaysearch(AdminCourseVO t,String open_course_id) {
		Gson gson = new Gson();
		List<AdminCourseVO> result = service.adminSubDaySearch(t, open_course_id);
		return gson.toJson(result);
	}
	
	//개설과목 등록
	@RequestMapping(value = "/adminopensubadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminopensubadd(HttpServletResponse response, AdminCourseVO t, RedirectAttributes redirectAttr) throws IOException {
		int code = service.adminOpenSubadd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin301");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	//개설과목 삭제
	@RequestMapping(value = "/adminsubdel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminsubdel(HttpServletResponse response, AdminCourseVO t, RedirectAttributes redirectAttr) throws IOException {
		int code = service.adminOpenSubDel(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin301");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	//개설과목 수정
	@RequestMapping(value = "/adminopensubmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminopensubmodify(HttpServletResponse response, AdminCourseVO t, RedirectAttributes redirectAttr) throws IOException {
		int code = service.adminOpenSubModify(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin301");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/////////
	/////과정별 수강생 명단//////////

	@RequestMapping(value = "/admin303")
	public ModelAndView admin303(Locale locale, Model model, AdminCourseVO t, String currentpage2, String open_course_id) {
		ModelAndView mav = new ModelAndView("/admin/admin303");
		List<AdminCourseVO> stulist = service.adminCourseStu(t, currentpage2, open_course_id);
		mav.addObject("open_course", t);
		mav.addObject("stulist", stulist);
		mav.addObject("total", stulist.get(0).getTotalrow());
		mav.addObject("totalpage", stulist.get(0).getTotalpage());
		return mav;
	}
	
	
	
	// 페이징 처리
	@RequestMapping(value = "/admincoursestupage", produces = "text/plain;charset=UTF-8")
	public String admincoursestupage(AdminCourseVO t, String currentpage2, String open_course_id) {
		Gson gson = new Gson();
		List<AdminCourseVO> coursestulist = service.adminCourseStu(t, currentpage2, open_course_id);
		return gson.toJson(coursestulist);
	}
	
	//과정 수강생별 검색 페이징
	@RequestMapping(value = "/admincoursestusearch", produces = "text/plain;charset=UTF-8")
	public String admincoursestusearch(String currentpage2, AdminCourseVO t, String open_course_id) {
		Gson gson = new Gson();
		List<AdminCourseVO> coursestulist = service.adminCourseStu(t, currentpage2, open_course_id);
		return gson.toJson(coursestulist);
	}
	
	
	/////////////
	



}
