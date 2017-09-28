package com.mgr.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mgr.dto.AdminTeachVO;
import com.mgr.service.AdminService;

@RestController // 객체랑 주소 같이 보내주고자 할 때.
@RequestMapping(value = "/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService service;

	@RequestMapping(value = "/admin101", method = RequestMethod.GET)
	public ModelAndView admin101(Locale locale, Model model) {

		ModelAndView mav = new ModelAndView("/admin/admin101");
		return mav;
	}

	@RequestMapping(value = "/admin102", method = RequestMethod.GET)
	public ModelAndView admin102(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin102");
		return mav;
	}

	@RequestMapping(value = "/admin103", method = RequestMethod.GET)
	public ModelAndView admin103(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin103");
		return mav;
	}

	@RequestMapping(value = "/admin104", method = RequestMethod.GET)
	public ModelAndView admin104(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/admin104");
		return mav;
	}

	
	///////////////////////////////////
	
	@RequestMapping(value = "/admin201", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView admin201() {
		ModelAndView mav = new ModelAndView("/admin/admin201");
		mav.addObject("teacherlist", service.adminTeachListAll());

		return mav;
	}
	
	@RequestMapping(value = "/adminteachsublist", produces="text/plain;charset=UTF-8")
	public String adminteachsublist(HttpServletResponse response, String teacher_id) throws IOException {
		Gson gson = new Gson();	
		List<AdminTeachVO> result = service.adminBasicsublist(teacher_id);
		
		return gson.toJson(result);
	}
	
	@RequestMapping(value = "/adminteachmodify", produces="text/plain;charset=UTF-8")
	public ModelAndView adminteachmodify(HttpServletResponse response, AdminTeachVO t, RedirectAttributes redirectAttr ) throws IOException {		
		int code = service.adminTeachModifyinfo(t);
		ModelAndView mav = new ModelAndView("redirect:/admin/admin201");
		redirectAttr.addFlashAttribute("code", code);
		return mav;
				
	}
	
	
	//////////////////////////////

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
