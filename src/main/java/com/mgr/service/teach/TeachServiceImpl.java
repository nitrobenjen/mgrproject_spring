package com.mgr.service.teach;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mgr.dao.teach.TeachDAO;
import com.mgr.dto.TeacherVO;
import com.mgr.dto.AdminCourseVO;
import com.mgr.dto.LoginVO;

@Service
public class TeachServiceImpl implements TeachService {

	@Autowired
	private TeachDAO dao;

	@Override
	public TeacherVO teachInfoModList(TeacherVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);
		TeacherVO result = dao.teachInfoModList(t);
		return result;
	}

	@Override
	public int teachInfoModify(TeacherVO t, HttpServletRequest request) {
		int check = dao.teachmodifycheck(t);
		int result = 100;

		if (check == 1) {
			int a = dao.teachInfoModify(t);
			System.out.println(a);

		} else {
			result = 201;
		}

		return result;
	}

	@Override
	public int teachpwcheck(TeacherVO t) {
		int result = dao.teachmodifycheck(t);
		return result;
	}

	@Override
	public int teachpwmodify(TeacherVO t, HttpServletRequest request, String newpw, String newpw2) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);
		t.setNewpw(newpw);
		int result = 100;
		int check = dao.teachmodifycheck(t);

		if (check == 1) {
			if (newpw.equals(newpw2)) {
				dao.teachPwModify(t);
			} else {
				result = 202;
			}

		} else {
			result = 201;
		}

		return result;
	}

	// 강의 예정목록
	@Override
	public List<TeacherVO> teachcourselist(TeacherVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);
		List<TeacherVO> result = dao.teachCourseList(t);
		return result;
	}

	@Override
	public List<TeacherVO> teachschedulestulist(TeacherVO t, HttpServletRequest request, String currentpage2) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);

		List<TeacherVO> result1 = dao.teachStuList(t);
		List<TeacherVO> result = new ArrayList<TeacherVO>();
		try {

			int totalrow = result1.size();
			int totalpage;
			int currentpage;
			int max = 10;

			if (currentpage2 == null || currentpage2.equals("")) {
				currentpage = 1;
			} else {
				currentpage = Integer.parseInt(currentpage2);
			}
			if (totalrow % max != 0) {
				totalpage = (totalrow / max) + 1;
			} else {
				totalpage = totalrow / max;
			}

			for (int i = currentpage * max - max; i < currentpage * max; i++) {
				if (i == totalrow)
					break;
				TeacherVO m = new TeacherVO();
				m.setStudent_id(result1.get(i).getStudent_id());
				m.setStudent_name(result1.get(i).getStudent_name());
				m.setStudent_ssn(result1.get(i).getStudent_ssn());
				m.setStudent_phone(result1.get(i).getStudent_phone());
				m.setStudent_regdate(result1.get(i).getStudent_regdate());
				m.setCount_(result1.get(i).getCount_());
				m.setTotalpage(totalpage);
				m.setTotalrow(totalrow);
				result.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<TeacherVO> teachcourselisting(TeacherVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);
		List<TeacherVO> result = dao.teachCourseListing(t);
		return result;
	}

	@Override
	public List<TeacherVO> teachcourselistend(TeacherVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);
		List<TeacherVO> result = dao.teachCourseListend(t);
		return result;
	}

	// 배점관리
	@Override
	public List<TeacherVO> teachbaejumlist(TeacherVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();
		t.setTeacher_id(id_);
		List<TeacherVO> result = dao.teachBaejumList(t);
		return result;
	}

	// 파일업로드 테스트
	@Override
	public int teachadd(MultipartHttpServletRequest mRequest) {
		TeacherVO m = new TeacherVO();
		m.setOpen_sub_id(mRequest.getParameter("open_sub_id"));
		m.setChulsuk_total_grade(Integer.parseInt(mRequest.getParameter("chulsuk_total_grade")));
		m.setFilki_total_grade(Integer.parseInt(mRequest.getParameter("filki_total_grade")));
		m.setSilki_total_grade(Integer.parseInt(mRequest.getParameter("silki_total_grade")));
		m.setTest_date(mRequest.getParameter("test_date"));
		Map<String, MultipartFile> files = mRequest.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("test_munje");
		
		m.setTest_munje(cmf.getOriginalFilename());	
		int code = 100;
		dao.teachBaejumadd(m);
		// 경로
		String path = "E:/uploadTest/" + cmf.getOriginalFilename();

		File file = new File(path);
		// 파일 업로드 처리 완료.
		try {
			cmf.transferTo(file);
		} catch (IllegalStateException e) {
			code=200;
			e.printStackTrace();
		} catch (IOException e) {
			code=200;
			e.printStackTrace();
		}

		return code;
	}

	@Override
	public int teachbaejummodify(MultipartHttpServletRequest mRequest) {
		TeacherVO m = new TeacherVO();
		m.setOpen_sub_id(mRequest.getParameter("open_sub_id"));
		m.setChulsuk_total_grade(Integer.parseInt(mRequest.getParameter("chulsuk_total_grade")));
		m.setFilki_total_grade(Integer.parseInt(mRequest.getParameter("filki_total_grade")));
		m.setSilki_total_grade(Integer.parseInt(mRequest.getParameter("silki_total_grade")));
		m.setTest_date(mRequest.getParameter("test_date"));
		Map<String, MultipartFile> files = mRequest.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("test_munje");
		
		m.setTest_munje(cmf.getOriginalFilename());	
		int code = 100;
		dao.teachbaejummodify(m);
		// 경로
		String path = "E:/uploadTest/" + cmf.getOriginalFilename();
		String path2 = "E:/uploadTest/1.png";
		File file = new File(path);
		//File file2 = new File(path2);
		// 파일 업로드 처리 완료.
		try {
			cmf.transferTo(file);
			//file2.delete();
		} catch (IllegalStateException e) {
			code=200;
			e.printStackTrace();
		} catch (IOException e) {
			code=200;
			e.printStackTrace();
		}

		return code;
	}

	@Override
	public List<TeacherVO> teachStuGradelist(String currentpage2, TeacherVO t) {
		List<TeacherVO> result1 = dao.teachStuGradelist(t); 
		List<TeacherVO> result = new ArrayList<TeacherVO>();
		try {

			
			int totalrow = result1.size();
			int totalpage;
			int currentpage;
			int max = 10;

			if (currentpage2 == null || currentpage2.equals("")) {
				currentpage = 1;
			} else {
				currentpage = Integer.parseInt(currentpage2);
			}
			if (totalrow % max != 0) {
				totalpage = (totalrow / max) + 1;
			} else {
				totalpage = totalrow / max;
			}
			
			

		
			for (int i = currentpage * max - max; i < currentpage * max; i++) {
				if (i == totalrow)
					break;
				TeacherVO m = new TeacherVO();
				m.setStudent_id(result1.get(i).getStudent_id());
				m.setStudent_name(result1.get(i).getStudent_name());
				m.setStudent_ssn(result1.get(i).getStudent_ssn());
				m.setStudent_phone(result1.get(i).getStudent_phone());
				m.setStudent_regdate(result1.get(i).getStudent_regdate());
				m.setChulsuk_grade(result1.get(i).getChulsuk_grade());
				m.setFilki_grade(result1.get(i).getFilki_grade());
				m.setSilki_grade(result1.get(i).getSilki_grade());
				m.setCount_(result1.get(i).getCount_());
				m.setTotalpage(totalpage);
				m.setTotalrow(totalrow);
				result.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int teachgradeadd(TeacherVO t) {
		int result = 100;

		try {

			dao.teachgradeadd(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int teachgrademodify(TeacherVO t) {
		int result = 100;

		try {

			dao.teachgrademodify(t);
		} catch (Exception e) {
			result = 200;
			e.printStackTrace();
		}

		return result;
	}
	
	
	

}
