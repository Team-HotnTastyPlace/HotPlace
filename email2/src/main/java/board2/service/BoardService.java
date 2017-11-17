package board2.service;

import java.util.List;

import board2.domain.BoardVO;

public interface BoardService {
	public abstract List<BoardVO> list();
	
	public abstract int delete(BoardVO boardVO);
	
	public abstract int edit(BoardVO boardVO);
	
	public abstract void write(BoardVO boardVO);
	
	public abstract BoardVO read(int seq);
}
