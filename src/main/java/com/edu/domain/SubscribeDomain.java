package com.edu.domain;


import lombok.*;
import org.apache.ibatis.type.Alias;

import javax.persistence.*;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "Subscribe")
public @Data class SubscribeDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int subscribenumber;

	@Column
	private int cosno;

	@Column
	private String id;

	@Override
	public String toString() {
		return "Subscribe [cosno=" + cosno + ", id=" + id + "]";
	}

	@Builder
	public SubscribeDomain(int subscribeNumber, int cosNo, String id){
		this.subscribenumber = subscribeNumber;
		this.cosno = cosNo;
		this.id = id;
	}
	
}
