package com.edu.service;

import com.edu.domain.LectureDomain;
import com.edu.domain.Member;
import com.edu.domain.UserLectureInfoDomain;
import com.edu.repository.LectureRepository;
import com.edu.repository.UserLectureInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureService {

    @Autowired
    LectureRepository lectureRepository;

    @Autowired
    UserLectureInfoRepository userLectureInfoRepository;

    public LectureDomain getLastedLecture(Member member, int courseNumber) {

        String userId = member.getId();

        LectureDomain lastedLecture = lectureRepository.getLastedLecture(userId, courseNumber);

        return lastedLecture;
    }

    public List getCheckedLecture(String userId, int courseNumber){

        List checkedList = lectureRepository.getCheckedLecture(userId, courseNumber);

        return checkedList;
    }

    public String updateCheckedLecture(int courseNumber, int lectureNumber, Member member){

        // 해당 번호로 조회
        UserLectureInfoDomain getUserLectureInfo = userLectureInfoRepository.getLectureInfo(member.getId(), lectureNumber, courseNumber);

        // 체크결과가 없으면 insert
        if(getUserLectureInfo == null){

            userLectureInfoRepository.save(UserLectureInfoDomain.builder()
                    .userId(member.getId())
                    .courseNum(courseNumber)
                    .lectureNum(lectureNumber)
                    .checkFlag("Y")
                    .delFlag("N")
                    .build());

            return "insert";
        }

        // 조회결과가 있을 경우  Y이면 N으로 N이면 Y로 update
        if(getUserLectureInfo.getCheckflag().equals("Y")){
            getUserLectureInfo.setCheckflag("N");
        }else {
            getUserLectureInfo.setCheckflag("Y");
        }

        try {
            // update
            userLectureInfoRepository.save(getUserLectureInfo);

        }catch (Exception e){
            return "error";
        }

        return "update";
    }

    public List<LectureDomain> findCos_lec(int cosNum){
        return lectureRepository.findByCosNo(cosNum);
    }

    public LectureDomain findLecture(int lectureNum){
        return lectureRepository.findLecture(lectureNum);
    }

}
