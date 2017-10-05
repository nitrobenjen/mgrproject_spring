package com.mgr.dao.teach;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mgr.dto.TeacherVO;

@Repository
public class TeachDAOImpl implements TeachDAO {
	
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.TeachMapper";

	@Override
	public TeacherVO teachInfoModList(TeacherVO t) {
		TeacherVO result = session.selectOne(namespace+".teachInfoModList", t);
		return result;
	}

	@Override
	public int teachInfoModify(TeacherVO t) {
		int result = session.update(namespace+".teachInfoModify",t);
		return result;
	}

	@Override
	public int teachmodifycheck(TeacherVO t) {
		int result = session.selectOne(namespace+".teachmodifycheck",t);
		return result;
	}


	@Override
	public int teachPwModify(TeacherVO t) {
		int result = session.update(namespace+".teachPwModify",t);
		return result;
	}

	@Override
	public List<TeacherVO> teachCourseList(TeacherVO t) {
		List<TeacherVO> result = session.selectList(namespace+".teachCourseList",t);
		return result;
	}

	@Override
	public List<TeacherVO> teachStuList(TeacherVO t) {
		List<TeacherVO> result = session.selectList(namespace+".teachStuList",t);
		return result;
	}

	@Override
	public List<TeacherVO> teachCourseListing(TeacherVO t) {
		List<TeacherVO> result = session.selectList(namespace+".teachCourseListing",t);
		return result;
	}

	@Override
	public List<TeacherVO> teachCourseListend(TeacherVO t) {
		List<TeacherVO> result = session.selectList(namespace+".teachCourseListend",t);
		return result;
	}

	@Override
	public List<TeacherVO> teachBaejumList(TeacherVO t) {
		List<TeacherVO> result = session.selectList(namespace+".teachBaejumList",t);
		return result;
	}

	@Override
	public int teachBaejumadd(TeacherVO t) {
		int result = session.insert(namespace+".teachBaejumadd",t);
		return result;
	}

	@Override
	public int teachbaejummodify(TeacherVO t) {
		int result = session.update(namespace+".teachbaejummodify",t);
		return result;
	}

	@Override
	public List<TeacherVO> teachStuGradelist(TeacherVO t) {
		List<TeacherVO> result = session.selectList(namespace+".teachStuGradelist",t);
		return result;
	}

	@Override
	public int teachgradeadd(TeacherVO t) {
		int result = session.insert(namespace+".teachgradeadd",t);
		return result;
		
	}

	@Override
	public int teachgrademodify(TeacherVO t) {
		int result = session.update(namespace+".teachgrademodify",t);
		return result;
		
	}
	
	
	
	

}
