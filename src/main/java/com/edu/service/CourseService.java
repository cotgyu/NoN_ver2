package com.edu.service;

import com.edu.domain.Course;
import com.edu.domain.CourseDomain;
import com.edu.domain.Lecture;
import com.edu.domain.LectureDomain;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CourseService {
	CourseDomain findCos(int cosno);
	
	List<LectureDomain> findCos_lec(int cosno);

	LectureDomain findLecture(int lecno);

	List<CourseDomain> findCosList(int start,int end,String searchOption, String keyword);

	void insertCourse(Course cos);

	void insertLecture(Lecture lecture);

	List<String> findCosCategory1();

	List<String> findCosCategory2();
	
	List<String> findDetailCategory(String type);

	List<CourseDomain> findNewCosList();

	List<CourseDomain> findPopCosList();

	void updateCourse(Course cos);

	void updateLecture(Lecture lecture);

	long countCourse(String searchOption, String keyword);

	List<CourseDomain> allFindCosList();

	void subscribe(String id, int cosno);

	List<CourseDomain> myCourse(String id);

	boolean ajaxCheckSubscribe(String id, int cosno);

	void subscribeCancel(String id, int cosno);

	String findCosName(int cosno);

	void dataUpdate(String filePath);
}
