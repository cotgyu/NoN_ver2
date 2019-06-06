package com.Edu.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Edu.Dao.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
//
//	@Override
//	public Board findOne(int boardId) {
//		return boardDao.findOne(boardId);
//	}
//
//	@Override
//	public void create(Board board) {
//		boardDao.save(board);
//	}
//
//	@Override
//	public void update(Board board) {
//		boardDao.save(board);
//	}
//
//	@Override
//	public void delete(int boardId) {
//		boardDao.delete(boardId);
//	}
}
