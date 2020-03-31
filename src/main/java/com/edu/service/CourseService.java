package com.edu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.edu.domain.Course;
import com.edu.domain.Lecture;

@Service
public interface CourseService {
	public Course findCos(int cosno);
	
	public List<Lecture> findCos_lec(int cosno);

	public Lecture findLecture(int lecno);

	public List<Course> findCosList(int start,int end,String searchOption, String keyword);

	public void insertCourse(Course cos);

	public void insertLecture(Lecture lecture);

	public List<Course> findCosCategory1();
	public List<Course> findCosCategory2();
	
	public List<Course> findProgrammingCategory();
	public List<Course> findDesignCategory();
	public List<Course> findBusinessCategory();
		
	
	public List<Course> findNewCosList();

	public List<Course> findPopCosList();

	public void updateCourse(Course cos);

	public void updateLecture(Lecture lecture);

	public int countCourse(String searchOption, String keyword);

	public List<Course> allFindCosList();

	public void subscribe(String id, int cosno);

	public List<Course> myCourse(String id);

	public boolean ajaxCheckSubscribe(String id, int cosno);

	public void subscribeCancel(String id, int cosno);

	public String findCosName(int cosno);

	public void dataUpdate();
}
