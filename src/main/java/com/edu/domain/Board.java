
package com.edu.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;
 
@Alias("Board")
public @Data class Board {
	 
	private int boardId;
	
}
