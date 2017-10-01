package com.mgr.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mgr.dto.AdminBasicVO;
import com.mgr.dto.AdminTeachVO;


@Repository
public class AdminBasicDAOImpl implements AdminBasicDAO {
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.AdminMapper";

	@Override
	public List<AdminBasicVO> adminBasicCourseList(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicCourseList", t);
		return result;
	}

	@Override
	public int adminbasiccourseadd(AdminBasicVO t) {
		int result = session.insert(namespace + ".adminBasicCourseAdd", t);
		return result;
	}

	@Override
	public int adminBasicCourseModify(AdminBasicVO t) {
		int result = session.update(namespace + ".adminBasicCourseModify", t);
		return result;
		
	}

	@Override
	public int adminBasicCourseDel(AdminBasicVO t) {
		int result = session.delete(namespace + ".adminBasicCourseDel", t);
		return result;
		
	}

	@Override
	public List<AdminBasicVO> adminBasicCourseCheck(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicCourseCheck", t);
		return result;
	}
	
	
	
	
	
	
	/////////////////////////////////////////

	@Override
	public List<AdminBasicVO> adminBasicSubList(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicSubListAll", t);
		return result;
	}

	@Override
	public List<AdminBasicVO> adminBasicSubDisable1(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicSubDisable1", t);
		return result;
	}

	@Override
	public List<AdminBasicVO> adminBasicSubDisable2(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicSubDisable2", t);
		return result;
	}

	@Override
	public int adminBasicSubAdd(AdminBasicVO t) {
		int result = session.insert(namespace + ".adminBasicSubAdd", t);
		return result;
	}

	@Override
	public int adminBasicSubDel(AdminBasicVO t) {
		int result = session.delete(namespace + ".adminBasicSubDel", t);
		return result;
	}

	@Override
	public int adminBasicSubModify(AdminBasicVO t) {
		int result = session.update(namespace + ".adminBasicSubModify", t);
		return result;
	}
	
	////////////////////////////////////////
///////////교재 등록
	@Override
	public int adminBasicBookAdd(AdminBasicVO t) {
		int result = session.insert(namespace + ".adminBasicBookAdd", t);
		return result;
	}

	@Override
	public List<AdminBasicVO> adminBasicBookList(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicBookList", t);
		return result;
	}

	@Override
	public List<AdminBasicVO> adminBasicBookCheck(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicBookCheck", t);
		return result;
	}

	@Override
	public int adminBasicBookDel(AdminBasicVO t) {
		int result = session.delete(namespace + ".adminBasicBookDel", t);
		return result;
	}

	@Override
	public int adminBasicBookModify(AdminBasicVO t) {
		int result = session.update(namespace + ".adminBasicBookModify", t);
		return result;
	}
	
	
	
	//강의실 ///
	@Override
	public int adminBasicClassAdd(AdminBasicVO t) {
		int result = session.insert(namespace + ".adminBasicClassAdd", t);
		return result;
	}

	//강의실 목록
	@Override
	public List<AdminBasicVO> adminBasicClassList(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicClassList", t);
		return result;
	}

	//수정 비활성화
	@Override
	public List<AdminBasicVO> adminBasicClassDisable1(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicClassDisable1", t);
		return result;
	}

	//삭제 비활성화
	@Override
	public List<AdminBasicVO> adminBasicClassDisable2(AdminBasicVO t) {
		List<AdminBasicVO> result = session.selectList(namespace + ".adminBasicClassDisable2", t);
		return result;
	}

	//삭제
	@Override
	public int adminBasicClassDel(AdminBasicVO t) {
		int result = session.delete(namespace + ".adminBasicClassDel", t);
		return result;
	}

	//수정
	@Override
	public int adminBasicClassModify(AdminBasicVO t) {
		int result = session.update(namespace + ".adminBasicClassModify", t);
		return result;
	}
	
	
	
	
	
	
	
}
