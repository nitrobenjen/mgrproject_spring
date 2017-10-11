package com.mgr.service.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.dao.student.StudentDAO;
import com.mgr.dto.LoginVO;
import com.mgr.dto.StudentVO;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDAO dao;

	@Override
	public List<StudentVO> stucourselist(HttpServletRequest request, StudentVO t) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();		
		t.setStudent_id(id_);
		List<StudentVO> result = dao.stuCourseList(t);
		return result;
	}

	@Override
	public List<StudentVO> stuCourseListgrade(StudentVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();	
		t.setStudent_id(id_);		
		List<StudentVO> result = dao.stuCourseListgrade(t);
		return result;
	}
	
	
	@Override
	public StudentVO stuInfoModList(StudentVO t, HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();	
		t.setStudent_id(id_);		
		StudentVO result = dao.stuInfoModList(t);
		return result;
	}

	
	
	
	@Override
	public String stuInfo(String id_) {
		String result = dao.stuInfo(id_);
		return result;
	}

	@Override
	public int stuInfoModify(StudentVO t, HttpServletRequest request) {
		int check = dao.stumodifycheck(t);
		int result = 100;
		
		if(check == 1 ) {
			int a =  dao.stuInfoModify(t);
			System.out.println(a);		
			
		}else {
			result = 201;
		}
		
		
		
		return result;
	}

	@Override
	public int stupwcheck(StudentVO t) {
		int check = dao.stumodifycheck(t);
		return check;
	}

	@Override
	public int stupwmodify(StudentVO t, HttpServletRequest request, String newpw, String newpw2) {
		HttpSession session = request.getSession();
		LoginVO info = (LoginVO) session.getAttribute("logininfo");
		String id_ = info.getId_();	
		t.setStudent_id(id_);
		t.setNewpw(newpw);
		int result = 100;
		int check = dao.stumodifycheck(t);
		
		
		if(check == 1 ) {		
			if(newpw.equals(newpw2)) {
				dao.stuPwModify(t);
			}else {
				result = 202;
			}
			
		}else {
			result = 201;
		}
		
		
		return result;
	}

	
	
}
