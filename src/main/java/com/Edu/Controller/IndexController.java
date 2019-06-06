package com.Edu.Controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Edu.Domain.Course;
import com.Edu.Itemrecommend.DataConvert;
import com.Edu.Service.CourseService;

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
	public String dataUpdate() throws Exception{
		
		File file = new File("C:/MySqlOutputData/test.csv");
		
		file.delete();

		courseService.dataUpdate();
		
		return "redirect:/";
		
	}

}
