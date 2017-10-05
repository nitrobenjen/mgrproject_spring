package com.mgr.dao.teach;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mgr.dto.TeacherVO;

public interface TeachDAO {

	public TeacherVO teachInfoModList(TeacherVO t);

	public int teachInfoModify(TeacherVO t);

	public int teachmodifycheck(TeacherVO t);

	public int teachPwModify(TeacherVO t);

	public List<TeacherVO> teachCourseList(TeacherVO t);

	public List<TeacherVO> teachStuList(TeacherVO t);

	public List<TeacherVO> teachCourseListing(TeacherVO t);

	public List<TeacherVO> teachCourseListend(TeacherVO t);

	public List<TeacherVO> teachBaejumList(TeacherVO t);

	//테스트
	public int teachBaejumadd(TeacherVO t);

	public int teachbaejummodify(TeacherVO m);

	public List<TeacherVO> teachStuGradelist(TeacherVO t);

	public int teachgradeadd(TeacherVO t);

	public int teachgrademodify(TeacherVO t);

}
