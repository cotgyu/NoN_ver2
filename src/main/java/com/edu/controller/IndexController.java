package com.edu.controller;


import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.domain.Course;
import com.edu.service.CourseService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
	@Autowired
	private CourseService courseService;

	@RequestMapping(value = "/")
	public ModelAndView index( ModelAndView mav){

		//시간순으로 코스 가져오기(9개) 
		List<Course> newCourseList = courseService.findNewCosList();
				
		//추천수 많은  코스 가져오기(9개) 
		List<Course> popCourseList = courseService.findPopCosList();
		
		
		mav.addObject("newcourselist",newCourseList);
		mav.addObject("popcourselist",popCourseList);
		
		mav.setViewName("/fixedIndex/index2");

		return mav;
	}
	
	@RequestMapping(value = "/updateData")
	public String dataUpdate(HttpServletRequest request) throws Exception{

		// 아이템 추천을 위한 데이터 경로
		String resourcesPath = request.getServletContext().getRealPath("resources");
		File file = new File(resourcesPath+"/RecommendOutputData/RecommendData.csv");
		
		file.delete();

		courseService.dataUpdate(file.getPath());
		
		return "redirect:/";
		
	}

}
