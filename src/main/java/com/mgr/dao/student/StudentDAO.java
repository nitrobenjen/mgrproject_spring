package com.mgr.dao.student;

import java.util.List;

import com.mgr.dto.StudentVO;

public interface StudentDAO {

	public List<StudentVO> stuCourseList(StudentVO t);
	
	public List<StudentVO> stuCourseListgrade(StudentVO t);
	
	public String stuInfo(String id_);

	public StudentVO stuInfoModList(StudentVO t);

	public int stuInfoModify(StudentVO t);
	
	public int stumodifycheck(StudentVO t);

	
	public int stuPwModify(StudentVO t);
	
	
}
