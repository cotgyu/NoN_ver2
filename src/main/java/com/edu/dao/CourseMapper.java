package com.edu.dao;

import java.util.List;
import java.util.Map;

import com.edu.domain.Course;
import com.edu.domain.Lecture;
import com.edu.domain.Subscribe;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseMapper {

	@Select("SELECT * FROM recommend_coursedata\n" +
			"\t\tINTO OUTFILE #{filePath}\n" +
			"\t\tCHARACTER SET euckr\n" +
			"\t\tFIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"'\n" +
			"\t\tESCAPED BY '\\\\'\n" +
			"\t\tLINES TERMINATED BY '\\n'")
	void dataUpdate(String filePath);
}
