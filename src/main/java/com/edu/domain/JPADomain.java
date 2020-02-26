package com.edu.domain;


import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;


@NoArgsConstructor(access = AccessLevel.PROTECTED) // 기본생성자 자동 추가 (protected Posts(){} 와 같음)
@Getter //클래스 내 모든 필드의 getter 메소드 자동생성
@Entity //테이블과 링크될 클래스임을 나타냄
public class JPADomain {
    @Id // PK
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private Long id;

    @Column(length = 500, nullable = false) //테이블의 컬럼 ()와 같이 컬럼특징 설정 가능
    private String title;

    @Column
    private String content;

    @Builder // Builder란 ?
    public JPADomain(String title, String content){
        this.title  = title;
        this.content = content;
    }


}
