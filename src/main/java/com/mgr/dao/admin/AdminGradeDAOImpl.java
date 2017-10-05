package com.mgr.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.AdminCourseVO;

@Repository
public class AdminGradeDAOImpl implements AdminGradeDAO {
	
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.AdminMapper";

	
	
	@Override
	public List<AdminCourseVO> adminGradeCourse(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminCourseList", t);
				
		return result;
	}


	//개설과목
	@Override
	public List<AdminCourseVO> adminGradeSub(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminGradeSub", t);
		
		return result;
	}

	//개설과목별 점수
	@Override
	public List<AdminCourseVO> adminsubgradeview(AdminCourseVO t) {
List<AdminCourseVO> result = session.selectList(namespace + ".adminsubgradeview", t);
		
		return result;
	}


	@Override
	public List<AdminCourseVO> adminStuList(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuList", t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminStuDisable(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuDisable", t);
		return result;
	}


	@Override
	public List<AdminCourseVO> adminstulistcoursegrade(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminstulistcoursegrade", t);
		return result;
	}


	@Override
	public List<AdminCourseVO> adminStuGrade(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuGrade", t);
		return result;
	}
	
	

}
