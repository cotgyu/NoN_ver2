package com.edu.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.domain.Course;
import com.edu.domain.Lecture;
import com.edu.service.CourseService;

public class RestCourseController {
	@Autowired
	private CourseService courseService;
	
	//cosno에 맞는 소개 페이지 관련
	@RequestMapping(value = "/intro/{cosno}", method = RequestMethod.GET)
	public Course getCourse( ModelAndView mav, @PathVariable("cosno") int cosno){
		
		//cosno에 맞는 코스정보 불러오기
		Course course = courseService.findCos(cosno);
		
		
		return course;
	}

	//cosno에 맞는 소개 페이지 관련
	@RequestMapping(value = "/intro/{cosno}", method = RequestMethod.GET)
	public List<Lecture> getLecture(  @PathVariable("cosno") int cosno){
		 
		//cosno에 맞는 강좌들 불러오기
		List<Lecture> lecture = courseService.findCos_lec(cosno);
		
		//map에 정보 저장 
		
		return lecture;
	}

}
