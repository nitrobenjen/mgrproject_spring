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
import com.mgr.dto.AdminTeachVO;
import com.mgr.service.admin.AdminTeachService;

@RestController // 객체랑 주소 같이 보내주고자 할 때.
@RequestMapping(value = "/admin")
public class AdminTeachController {

	private static final Logger logger = LoggerFactory.getLogger(AdminTeachController.class);

	//@Resource(name="AdminTeachService")
	@Autowired
	@Qualifier("adminTeachServiceImpl")
	private AdminTeachService service;
	
	
	////////////////// 관리자 강사 완료////////////////////////////////////////

	@RequestMapping(value = "/admin201", produces = "text/plain;charset=UTF-8")
	public ModelAndView admin201(String currentpage2, AdminTeachVO t) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/admin201");
		List<AdminTeachVO> teacherlist = service.adminTeachListAll(currentpage2, t);		
		mav.addObject("teacherlist", teacherlist);
		mav.addObject("totalpage", teacherlist.get(0).getTotalpage());

		return mav;
	}

	@RequestMapping(value = "/adminteachsearch", produces = "text/plain;charset=UTF-8")
	public String adminteachsearch(String currentpage2, AdminTeachVO t) {
		Gson gson = new Gson();
		List<AdminTeachVO> teacherlist = service.adminTeachListAll(currentpage2, t);
		return gson.toJson(teacherlist);
	}

	// 페이징 처리
	@RequestMapping(value = "/adminteachpage", produces = "text/plain;charset=UTF-8")
	public String adminteachpage(String currentpage2, AdminTeachVO t) {
		Gson gson = new Gson();
		List<AdminTeachVO> teacherlist = service.adminTeachListAll(currentpage2, t);
		return gson.toJson(teacherlist);
	}

	// 수정 시 강의가능과목 목록 출력 용.
	@RequestMapping(value = "/adminteachsublist", produces = "text/plain;charset=UTF-8")
	public String adminteachsublist(HttpServletResponse response, String teacher_id) throws IOException {
		Gson gson = new Gson();
		List<AdminTeachVO> result = service.adminBasicsublist(teacher_id);

		return gson.toJson(result);
	}

	// 전체 과목 목록 가져오기
	@RequestMapping(value = "/adminbasicsublist", produces = "text/plain;charset=UTF-8")
	public String adminbasicsublist(HttpServletResponse response) throws IOException {
		Gson gson = new Gson();
		List<AdminTeachVO> result = service.adminBasicsublist();

		return gson.toJson(result);
	}

	// 강사 정보 수정(트랜잭션)
	@RequestMapping(value = "/adminteachmodify", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminteachmodify(HttpServletResponse response, AdminTeachVO t, RedirectAttributes redirectAttr)
			throws IOException {
		int code = service.adminTeachModifyinfo(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin201");
		redirectAttr.addFlashAttribute("code", code);
		return mav;

	}

	// 강사 정보 등록
	@RequestMapping(value = "/adminteachadd", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminteachadd(HttpServletResponse response, AdminTeachVO t, RedirectAttributes redirectAttr)
			throws IOException {
		int code = service.adminteachadd(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin201");
		redirectAttr.addFlashAttribute("code", code);
		return mav;

	}

	// 특정 강사의 강의가능한 목록 출력
	@RequestMapping(value = "/adminteachsub", produces = "text/plain;charset=UTF-8")
	public String adminteachsub(HttpServletResponse response, String teacher_id) throws IOException {
		Gson gson = new Gson();
		List<AdminTeachVO> result = service.adminTeachSublist(teacher_id);

		return gson.toJson(result);
	}

	// 강사 삭제
	@RequestMapping(value = "/adminteachdel", produces = "text/plain;charset=UTF-8")
	public ModelAndView adminteachdel(HttpServletResponse response, String teacher_id, RedirectAttributes redirectAttr)
			throws IOException {
		int code = service.adminteachdel(teacher_id);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin201");
		redirectAttr.addFlashAttribute("code", code);
		return mav;

	}

	/////////////////////////////////////강사 계정관리 끝/////////////////////////

	@RequestMapping(value = "/admin301", method = RequestMethod.GET)
	public ModelAndView admin301(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin301");
		return mav;
	}

	@RequestMapping(value = "/admin302", method = RequestMethod.GET)
	public ModelAndView admin302(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin302");
		return mav;
	}

	@RequestMapping(value = "/admin303", method = RequestMethod.GET)
	public ModelAndView admin303(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin303");
		return mav;
	}

	@RequestMapping(value = "/admin401", method = RequestMethod.GET)
	public ModelAndView admin401(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin401");
		return mav;
	}

	@RequestMapping(value = "/admin402", method = RequestMethod.GET)
	public ModelAndView admin402(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin402");
		return mav;
	}

	@RequestMapping(value = "/admin501", method = RequestMethod.GET)
	public ModelAndView admin501(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin501");
		return mav;
	}

	@RequestMapping(value = "/admin501-sub", method = RequestMethod.GET)
	public ModelAndView admin501sub(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin501-sub");
		return mav;
	}

	@RequestMapping(value = "/admin502", method = RequestMethod.GET)
	public ModelAndView admin502(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin502");
		return mav;
	}

	@RequestMapping(value = "/admin502-sub", method = RequestMethod.GET)
	public ModelAndView admin502sub(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin502-sub");
		return mav;
	}

}
