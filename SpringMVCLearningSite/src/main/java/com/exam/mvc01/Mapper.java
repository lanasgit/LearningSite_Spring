package com.exam.mvc01;

import java.util.ArrayList;

import model.BoardTO;
import model.CommentTO;

public interface Mapper {
	public abstract int boardWriteOk(BoardTO to);
	public abstract void updateSeq();
	public abstract ArrayList<BoardTO> boardList(String subject);
	public abstract BoardTO boardView(String seq);
	public abstract BoardTO boardModify(String seq);
	public abstract int boardModifyOk(BoardTO to);
	public abstract BoardTO boardDelete(String seq);
	public abstract int boardDeleteOk(String seq);
	
	public abstract int commentWriteOk(CommentTO cto);
	public abstract void updateCseq();
	public abstract ArrayList<CommentTO> commentList(String seq);
	public abstract int commentModify(String seq);
	public abstract int commentModifyOk(CommentTO cto);
	public abstract int commentDeleteOk(CommentTO cto);
}
