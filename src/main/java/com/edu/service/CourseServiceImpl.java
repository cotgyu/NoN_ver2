package com.edu.service;

import java.util.List;

import com.edu.domain.*;
import com.edu.repository.CourseRepository;
import com.edu.repository.CourseScoreRepository;
import com.edu.repository.LectureRepository;
import com.edu.repository.SubscribeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService{
	@Autowired
    private CourseMapper courseMapper;

	@Autowired
    private CourseRepository courseRepository;

	@Autowired
    private LectureRepository lectureRepository;

	@Autowired
    private SubscribeRepository subscribeRepository;

	@Autowired
	private CourseScoreRepository courseScoreRepository;
	
	//cosno에 맞는 코스 찾기
	@Override
	public CourseDomain findCos(int cosno) {
	    return courseRepository.findCos(cosno);
	}
	
	//cosno에 맞는 강좌들 찾기
	@Override
	public List<LectureDomain> findCos_lec(int cosno) {
		return lectureRepository.findCos_lec(cosno);
	}

	//lecno에 맞는 강좌 영상 가져오기 
	@Override
	public LectureDomain findLecture(int lecno) {

	    return lectureRepository.findLecture(lecno);
	}

	//course리스트 불러오기 
	@Override
	public List<CourseDomain> findCosList(int start, int end, String searchOption, String keyword) {
		
		return courseRepository.findCosList(start, end, searchOption, keyword);
	}
	
	//시간순으로 코스 불러오기
	@Override
	public List<CourseDomain> findNewCosList() {
		return courseRepository.findNewCosList();
	}

	//추천수 많은 코스 가져오기
	@Override
	public List<CourseDomain> findPopCosList() {
		return courseRepository.findPopCosList();
	}
	
	
	//새로운 course 추가
	@Override
	public void insertCourse(Course cos) {
		courseRepository.save(CourseDomain.builder()
				.cosName(cos.getCosname())
				.cosIntro(cos.getCosintro())
				.cosIntrovideo(cos.getCosintrovideo())
				.cosCategory1(cos.getCoscategory1())
				.cosCategory2(cos.getCoscategory2())
				.cosPicture(cos.getCospicture())
				.build()
		);
		
		//코스 추가할때 코스스코어도 같이 추가 
		courseScoreRepository.save(CourseScoreDomain.builder()
				.cosno(cos.getCosno())
				.build()
		);
	}
	
	//새로운 lecture 추가
	@Override
	public void insertLecture(Lecture lecture) {
		lectureRepository.save(LectureDomain.builder()
				.cosNo(lecture.getCosno())
				.lecTime(lecture.getLectime())
				.lecName(lecture.getLecname())
				.lecVideo(lecture.getLecvideo())
				.build());
	}

	//코스 카테고리 불러오기
	@Override
	public List<String> findCosCategory1() {

	    return courseRepository.findCosCategory1();
	}

	@Override
	public List<String> findCosCategory2() {

	    return courseRepository.findCosCategory2();
	}

	@Override
	public List<String> findDetailCategory(String type) {
		return courseRepository.findDetailCategory(type);
	}


	//코스 업데이트하기
	@Override
	public void updateCourse(Course cos) {
	    courseRepository.save(CourseDomain.builder()
				.cosNo(cos.getCosno())
				.cosName(cos.getCosname())
				.cosIntro(cos.getCosintro())
				.cosIntrovideo(cos.getCosintrovideo())
				.cosCategory1(cos.getCoscategory1())
				.cosCategory2(cos.getCoscategory2())
				.cosPicture(cos.getCospicture())
				.build()
		);
	}

	//강의 업데이트하기
	@Override
	public void updateLecture(Lecture lecture) {
		lectureRepository.save(LectureDomain.builder()
				.lecNo(lecture.getLecno())
				.cosNo(lecture.getCosno())
				.lecTime(lecture.getLectime())
				.lecVideo(lecture.getLecvideo())
				.build()
		);
		
	}

	@Override
	public long countCourse(String searchOption, String keyword) {
	
		return courseRepository.countCourse(searchOption, keyword);
	}

	@Override
	public List<CourseDomain> allFindCosList() {

	    return courseRepository.findAll();
	}


	@Override
	public void subscribe(String id, int cosno) {
		subscribeRepository.save(SubscribeDomain.builder().cosNo(cosno).id(id).build());
	}

	@Override
	public List<CourseDomain> myCourse(String id) {
		
		return courseRepository.myCourse(id);
	}

	@Override
	public boolean ajaxCheckSubscribe(String id, int cosno) {

		boolean tf = false;

		if(id != null) {
			// 수강 course 체크
			SubscribeDomain cos = subscribeRepository.ajaxCheckSubscribe(cosno, id);

			if (cos != null) {
				tf = true;
			}
		}
		
		return tf;
	}

	@Override
	public void subscribeCancel(String id, int cosno) {
		SubscribeDomain target = subscribeRepository.findByCosnoAndId(cosno,id);

		subscribeRepository.delete(target);
	}

	@Override
	public String findCosName(int cosno) {

		return courseRepository.findCosName(cosno);
	}

	@Override
	public void dataUpdate(String filePath) {
		courseMapper.dataUpdate(filePath);

	}



}
