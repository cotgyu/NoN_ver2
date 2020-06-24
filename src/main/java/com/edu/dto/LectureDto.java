package com.edu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class LectureDto {

    private int lecno;

    @NotEmpty
    private int cosno;

    private String lectime;

    private String lecname;


    private String lecvideo;

    private Integer lecup;
    private Integer lecdown;

    private String userId;

}
