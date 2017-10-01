package com.mgr.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
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
import com.mgr.dto.AdminTeachVO;
import com.mgr.service.admin.AdminBasicService;

@RestController // 객체랑 주소 같이 보내주고자 할 때.
@RequestMapping(value = "/admin")
public class AdminBasicController {

	private static final Logger logger = LoggerFactory.getLogger(AdminBasicController.class);

	// @Resource(name = "AdminBasicService")
	@Autowired
	@Qualifier("adminBasicServiceImpl")
	private AdminBasicService service;

	///////////////////////////// 과정명////////////////////////////////////////////////
	@RequestMapping(value = "/admin101", method = RequestMethod.GET)
	public ModelAndView admin101(Locale locale, Model model, AdminBasicVO t) {

		ModelAndView mav = new ModelAndView("/admin/admin101");
		List<AdminBasicVO> courselist = service.adminBasicCourseList(t);
		mav.addObject("courselist", courselist);
		return mav;
	}

	// 과정등록
	@RequestMapping(value = "/adminbasiccourseadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasiccourseadd(HttpServletResponse response, AdminBasicVO t,
			RedirectAttributes redirectAttr) throws IOException {
		int code = service.adminbasiccourseadd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin101");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 과정 검색
	@RequestMapping(value = "/adminbasiccoursesearch", produces = "text/plain;charset=UTF-8")
	public String adminbasiccoursesearch(AdminBasicVO t) {
		Gson gson = new Gson();
		List<AdminBasicVO> courselist = service.adminBasicCourseList(t);
		return gson.toJson(courselist);
	}

	// 과정 수정
	@RequestMapping(value = "/adminbasiccoursemodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasiccoursemodify(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin101");
		int code = service.adminBasicCourseModify(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 과정 삭제
	@RequestMapping(value = "/adminbasiccoursedel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasiccoursedel(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin101");
		int code = service.adminBasicCourseDel(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	///////////////////////////// 과정명끝////////////////////////////////////////////////
	///////////////////////////// 과목명////////////////////////////////////////////////

	@RequestMapping(value = "/admin102", method = RequestMethod.GET)
	public ModelAndView admin102(Locale locale, Model model, AdminBasicVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin102");
		List<AdminBasicVO> sublist = service.adminBasicSubList(t);
		mav.addObject("sublist", sublist);
		return mav;
	}

	// 과목 검색
	@RequestMapping(value = "/adminbasicsubsearch", produces = "text/plain;charset=UTF-8")
	public String adminbasicsubsearch(AdminBasicVO t) {
		Gson gson = new Gson();
		List<AdminBasicVO> courselist = service.adminBasicSubList(t);
		return gson.toJson(courselist);
	}

	// 과목등록
	@RequestMapping(value = "/adminbasicsubadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminBaisicSubadd(HttpServletResponse response, AdminBasicVO t, RedirectAttributes redirectAttr)
			throws IOException {
		int code = service.adminBaisicSubadd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin102");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 과목 삭제
	@RequestMapping(value = "/adminbasicsubdel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicsubdel(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin102");
		int code = service.adminBasicSubDel(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 과목 수정
	@RequestMapping(value = "/adminbasicsubmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicsubmodify(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin102");
		int code = service.adminBasicSubModify(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	///////////////////////////// 과목명끝////////////////////////////////////////////////

	///////////////////////////// 교재////////////////////////////
	@RequestMapping(value = "/admin103", method = RequestMethod.GET)
	public ModelAndView admin103(Locale locale, Model model, AdminBasicVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin103");
		List<AdminBasicVO> booklist = service.adminBasicBookList(t);
		mav.addObject("booklist", booklist);
		return mav;
	}

	@RequestMapping(value = "/adminbasicbookapi", produces = "text/plain;charset=UTF-8")
	public String adminbasicbookapi(AdminBasicVO t) {
		Gson gson = new Gson();
		String booklist = service.adminBookAPI(t);
		return gson.toJson(booklist);
	}

	@RequestMapping(value = "/adminbasicbookapimodify", produces = "text/plain;charset=UTF-8")
	public String adminbasicbookapimodify(AdminBasicVO t) {
		Gson gson = new Gson();
		String booklist = service.adminBookAPI(t);
		return gson.toJson(booklist);
	}

	@RequestMapping(value = "/adminBaisicBookAdd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminBaisicBookAdd(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin103");
		int code = service.adminBaisicBookAdd(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;

	}

	// 교재 검색
	@RequestMapping(value = "/adminbasicbooksearch", produces = "text/plain;charset=UTF-8")
	public String adminbasicbooksearch(AdminBasicVO t) {
		Gson gson = new Gson();
		List<AdminBasicVO> courselist = service.adminBasicBookList(t);
		return gson.toJson(courselist);
	}

	// 교재 삭제
	@RequestMapping(value = "/adminbasicbookdel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicbookdel(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin103");
		int code = service.adminBasicBookDel(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 교재 수정
	@RequestMapping(value = "/adminbasicbookmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicbookmodify(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin103");
		int code = service.adminBasicBookModify(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	///////////////////////////// 교재 끝////////////////////////////
	///// 강의실 시작 //////

	@RequestMapping(value = "/admin104", method = RequestMethod.GET)
	public ModelAndView admin104(Locale locale, Model model, AdminBasicVO t) {
		ModelAndView mav = new ModelAndView("/admin/admin104");
		List<AdminBasicVO> classlist = service.adminBasicClassList(t);
		mav.addObject("classlist", classlist);
		return mav;
	}

	// 강의실
	@RequestMapping(value = "/adminbasicclassadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicclassadd(HttpServletResponse response, AdminBasicVO t,
			RedirectAttributes redirectAttr) throws IOException {
		int code = service.adminBaisicClassadd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin104");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	// 강의실 검색
	@RequestMapping(value = "/adminbasicclasssearch", produces = "text/plain;charset=UTF-8")
	public String adminbasicclasssearch(AdminBasicVO t) {
		Gson gson = new Gson();
		List<AdminBasicVO> courselist = service.adminBasicClassList(t);
		return gson.toJson(courselist);
	}

	// 강의실 삭제
	@RequestMapping(value = "/adminbasicclassdel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicclassdel(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin104");
		int code = service.adminBasicClassDel(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}
	
	
	// 강의실 수정
	@RequestMapping(value = "/adminbasicclassmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminbasicclassmodify(AdminBasicVO t, RedirectAttributes redirectAttr) {
		ModelAndView mav = new ModelAndView("redirect:/admin/admin104");
		int code = service.adminBasicClassModify(t);
		redirectAttr.addFlashAttribute("code", code);
		return mav;
	}

	///////////////////////////////////////////////////////////

}
