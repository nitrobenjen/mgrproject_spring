package com.mgr.service.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mgr.dto.StudentVO;

public interface StudentService {

	public List<StudentVO> stucourselist(HttpServletRequest request, StudentVO t);
	
	public List<StudentVO> stuCourseListgrade(StudentVO t, HttpServletRequest request);
	
	public String stuInfo(String id_);
	
	public StudentVO stuInfoModList(StudentVO t, HttpServletRequest request);

	public int stuInfoModify(StudentVO t, HttpServletRequest request);

	public int stupwcheck(StudentVO t);

	public int stupwmodify(StudentVO t, HttpServletRequest request, String newpw, String newpw2);

}
