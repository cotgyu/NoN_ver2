package com.Edu.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Edu.Dao.CourseMapper;
import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;
import com.Edu.Domain.Subscribe;

@Service
public class CourseServiceImpl implements CourseService{
	@Autowired 
	private CourseMapper courseMapper;
	
	//cosno에 맞는 코스 찾기
	@Override
	public Course findCos(int cosno) {
		return courseMapper.findCos(cosno);
	}
	
	//cosno에 맞는 강좌들 찾기
	@Override
	public List<Lecture> findCos_lec(int cosno) {
		return courseMapper.findCos_lec(cosno);
	}

	//lecno에 맞는 강좌 영상 가져오기 
	@Override
	public Lecture findLecture(int lecno) {
		return courseMapper.findLecture(lecno);
	}

	//course리스트 불러오기 
	@Override
	public List<Course> findCosList(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return courseMapper.findCosList(map);
	}
	
	//시간순으로 코스 불러오기
	@Override
	public List<Course> findNewCosList() {
		return courseMapper.findNewCosList();
	}

	//추천수 많은 코스 가져오기
	@Override
	public List<Course> findPopCosList() {
		return courseMapper.findPopCosList();
	}
	
	
	//새로운 course 추가
	@Override
	public void insertCourse(Course cos) {
		courseMapper.insertCourse(cos);
		
		//코스 추가할때 코스스코어도 같이 추가 
		courseMapper.insertCourseScore(cos);
	}
	
	//새로운 lecture 추가
	@Override
	public void insertLecture(Lecture lecture) {
		courseMapper.insertLecture(lecture);
		
	}

	//코스 카테고리 불러오기
	@Override
	public List<Course> findCosCategory1() {
		return courseMapper.findCosCategory1();
	}@Override
	public List<Course> findCosCategory2() {
		return courseMapper.findCosCategory2();
	}

	@Override
	public List<Course> findProgrammingCategory() {
		return courseMapper.findProgrammingCategory();
	}
	@Override
	public List<Course> findDesignCategory() {
		return courseMapper.findDesignCategory();
	}
	@Override
	public List<Course> findBusinessCategory() {
		return courseMapper.findBusinessCategory();
	}

	//코스 업데이트하기
	@Override
	public void updateCourse(Course cos) {
		courseMapper.updateCourse(cos);
	}
	//강의 업데이트하기
	@Override
	public void updateLecture(Lecture lecture) {
		courseMapper.updateLecture(lecture);
		
	}

	@Override
	public int countCourse(String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
	
		return courseMapper.countCourse(map);
	}

	@Override
	public List<Course> AllfindCosList() {
		return courseMapper.AllfindCosList();
	}

	@Override
	public void subscribe(String id, int cosno) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("cosno", cosno);
		
		courseMapper.subscribe(map);
	}

	@Override
	public List<Course> mycourse(String id) {
		
		return courseMapper.mycourse(id);
	}

	@Override
	public boolean ajaxchecksubscribe(String id, int cosno) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("cosno", cosno);

		// 수강 course 체크
		Subscribe cos=  courseMapper.ajaxchecksubscribe(map);

		boolean tf = false;

		if(cos != null){
		 tf = true;
		}
		
		return tf;
	}

	@Override
	public void subscribecancel(String id, int cosno) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("cosno", cosno);
		
		courseMapper.subscribecancel(map);
		
	}

	@Override
	public String findCosName(int cosno) {
		return courseMapper.findCosName(cosno);
	}

	@Override
	public void dataUpdate() {
		courseMapper.dataUpdate();
		
	}


	

}
