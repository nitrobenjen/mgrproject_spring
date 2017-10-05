package com.mgr.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminCourseVO;
import com.mgr.dto.AdminTeachVO;

@Repository
public class AdminCourseDAOImpl implements AdminCourseDAO {
	


	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.AdminMapper";

	//개설과정 리스트
	@Override
	public List<AdminCourseVO> adminCourseList(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminCourseList", t);
		return result;
	}

	//개설과정 등록
	@Override
	public int adminCourseAdd(AdminCourseVO t) {
		int result = session.insert(namespace + ".adminCourseAdd", t);
		return result;
	}
///////////////////
	@Override
	public List<AdminBasicVO> adminCourseAddList1() {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicCourseList");
		return result;
	}

	@Override
	public List<AdminBasicVO> adminCourseAddList2() {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicClassList");
		return result;
	}
	
//////////////////////
	
	@Override
	public int adminCourseDel(AdminCourseVO t) {
		int result = session.delete(namespace + ".adminCourseDel", t);
		return result;
	}

	//개설과정 수정
	@Override
	public int adminCourseModify(AdminCourseVO t) {
		int result = session.update(namespace + ".adminCourseModify", t);
		return result;
	}

	@Override
	public List<AdminCourseVO> adminCourseStu(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminCourseStu", t);
		return result;
	}

	//개설과정 > 수강생 총 인원수
	@Override
	public int adminCourseStuTotal(AdminCourseVO t) {
		int result = session.selectOne(namespace + ".adminCourseStuTotal", t);
		System.out.println(result);
		return result;
	}

	
	///////////////개설과목///////////
	@Override
	public List<AdminCourseVO> adminOpenSub(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminOpenSub", t);
		return result;
	}

	@Override
	public List<AdminBasicVO> adminBasicSub() {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicSubListAll");
		return result;
	}

	@Override
	public List<AdminBasicVO> adminBasicBook() {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicBookList");
		return result;
	}

	@Override
	public List<AdminTeachVO> adminSubAddListTeach(String subject_id) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminSubAddListTeach", subject_id);
		return result;
	}

	//개설과목 등록
	@Override
	public int adminOpenSubadd(AdminCourseVO t) {
		int result = session.insert(namespace + ".adminOpenSubadd", t);
		return result;		
	}

	//개설과목 삭제 체크
	@Override
	public List<AdminCourseVO> adminSubDelCheck(AdminCourseVO t) {
		List<AdminCourseVO> result = session.selectList(namespace + ".adminSubDelCheck", t);
		return result;
	}

	@Override
	public int adminOpenSubDel(AdminCourseVO t) {
		int result = session.delete(namespace + ".adminSubDel", t);
		return result;		
	}

	
	//개설과목 수정

	@Override
	public int adminOpenSubModify(AdminCourseVO t) {
		int result = session.update(namespace + ".adminOpenSubModify", t);
		return result;	
	}
	
	
	///////////////////
	
	

	
}
