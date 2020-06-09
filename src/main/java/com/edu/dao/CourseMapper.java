package com.edu.dao;

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
