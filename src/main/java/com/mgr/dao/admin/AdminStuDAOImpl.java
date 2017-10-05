package com.mgr.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.AdminCourseVO;

@Repository
public class AdminStuDAOImpl implements AdminStuDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.AdminMapper";

	@Override
	public int adminStuInfoAdd(AdminCourseVO t) {
		int result = session.insert(namespace + ".adminStuInfoAdd", t);
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

	//수강생 삭제
	@Override
	public int adminStuDel(AdminCourseVO t) {
		int result = session.delete(namespace+ ".adminStuDel", t);
		return result;
	}

	//수강생 수정
	@Override
	public int adminStuModify(AdminCourseVO t) {
		int result = session.update(namespace+ ".adminStuModify", t);
		return result;
		
	}

	//수강생 개설과정 등록
	@Override
	public int adminStuCourseAdd(AdminCourseVO t) {
		int result = session.insert(namespace + ".adminStuCourseAdd", t);
		return result;
	}

	//수강생 개설과정 등록을 위한 목록 출력
	@Override
	public List<AdminCourseVO> adminStuCourseAddList(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminCourseList", t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminStuCourseAddListCheck(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuCourseAddListCheck", t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminStuCourseAddListCheck2(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuCourseAddListCheck2", t);
		return result;
	}

	//수강생 관리 > 수강 이력
	@Override
	public List<AdminCourseVO> adminStuListCourse(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuListCourse", t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminStuListCourseCheck(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminStuListCourseCheck", t);
		return result;
	}

	//중도탈락
	@Override
	public int adminStuFailAdd(AdminCourseVO t) {
		int result = session.insert(namespace+ ".adminStuFailAdd",t);
		return result;
	}
	
	
	
	
	

}
