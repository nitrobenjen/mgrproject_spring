package com.mgr.service.teach;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mgr.dto.TeacherVO;

public interface TeachService {

	public TeacherVO teachInfoModList(TeacherVO t, HttpServletRequest request);

	public int teachInfoModify(TeacherVO t, HttpServletRequest request);

	public int teachpwcheck(TeacherVO t);

	public int teachpwmodify(TeacherVO t, HttpServletRequest request, String newpw, String newpw2);

	public List<TeacherVO> teachcourselist(TeacherVO t, HttpServletRequest request);

	public List<TeacherVO> teachschedulestulist(TeacherVO t, HttpServletRequest request, String currentpage);

	public List<TeacherVO> teachcourselisting(TeacherVO t, HttpServletRequest request);

	public List<TeacherVO> teachcourselistend(TeacherVO t, HttpServletRequest request);

	public List<TeacherVO> teachbaejumlist(TeacherVO t, HttpServletRequest request);

	//파일업로드 추가
	public int teachadd(MultipartHttpServletRequest mRequest);

	//파일업로드 수정
	public int teachbaejummodify(MultipartHttpServletRequest mRequest);

	public List<TeacherVO> teachStuGradelist(String currentpage2, TeacherVO t);

	public int teachgradeadd(TeacherVO t);

	public int teachgrademodify(TeacherVO t);

}
