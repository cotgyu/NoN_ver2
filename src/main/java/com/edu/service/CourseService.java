package com.edu.service;

import java.util.List;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;
import org.springframework.stereotype.Service;

import com.edu.domain.Course;
import com.edu.domain.Lecture;

@Service
public interface CourseService {
	public CourseDomain findCos(int cosno);
	
	public List<LectureDomain> findCos_lec(int cosno);

	public LectureDomain findLecture(int lecno);

	public List<CourseDomain> findCosList(int start,int end,String searchOption, String keyword);

	public void insertCourse(Course cos);

	public void insertLecture(Lecture lecture);

	public List<String> findCosCategory1();
	public List<String> findCosCategory2();
	
	public List<String> findDetailCategory(String type);



	public List<CourseDomain> findNewCosList();

	public List<CourseDomain> findPopCosList();

	public void updateCourse(Course cos);

	public void updateLecture(Lecture lecture);

	public long countCourse(String searchOption, String keyword);

	public List<CourseDomain> allFindCosList();

	public void subscribe(String id, int cosno);

	public List<CourseDomain> myCourse(String id);

	public boolean ajaxCheckSubscribe(String id, int cosno);

	public void subscribeCancel(String id, int cosno);

	public String findCosName(int cosno);

	public void dataUpdate(String filePath);
}
