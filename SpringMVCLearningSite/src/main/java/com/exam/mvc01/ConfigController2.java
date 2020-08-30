package com.exam.mvc01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.CommentTO;

@Controller
public class ConfigController2 {
	
	@Autowired
	private Mapper mapper;
	
	@RequestMapping("/comment_write_ok.do")
	public String commentWriteOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		// 자동 증가 컬럼(cseq) 초기화
		mapper.updateCseq();
		
		int flag = 1;
		
		String seq = request.getParameter("seq");
		
		CommentTO cto = new CommentTO();
		cto.setSeq(seq);
		cto.setWriter(request.getParameter("writer"));
		cto.setContent(request.getParameter("content"));
		
		int result = mapper.commentWriteOk(cto);
		
		if (result == 1) {
			flag = 0;
		}
		
		model.addAttribute("flag", flag);
		model.addAttribute("seq", seq);
		
		return "comment_write_ok";
	}

	@RequestMapping("/comment_modify.do")
	public String commentModify(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String seq = request.getParameter("seq");
		String cseq = request.getParameter("cseq");
		String content = request.getParameter("content");
		
		model.addAttribute("seq", seq);
		model.addAttribute("cseq", cseq);
		model.addAttribute("content", content);
		
		return "comment_modify";
	}
	
	@RequestMapping("/comment_modify_ok.do")
	public String commentModifyOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		int flag = 1;
				
		String cseq = request.getParameter("cseq");
		String content = request.getParameter("content");
		String seq = request.getParameter("seq");
				
		CommentTO cto = new CommentTO();
		cto.setCseq(cseq);
		cto.setContent(content);
		cto.setSeq(seq);
		
		int result = mapper.commentModifyOk(cto);
		
		if (result == 1) {
			flag = 0;
		}
		
		model.addAttribute("flag", flag);
		model.addAttribute("seq", seq);
		model.addAttribute("content", content);
		
		return "comment_modify_ok";
	}
	
	@RequestMapping("/comment_delete_ok.do")
	public String commentDeleteOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String seq = request.getParameter("seq");
		String cseq = request.getParameter("cseq");
		
		int flag = 2;
		
		CommentTO cto = new CommentTO();
		cto.setSeq(seq);
		cto.setCseq(cseq);
	
		int result = mapper.commentDeleteOk(cto);
		
		if (result == 0) {
			flag = 1;
		} else if (result == 1) {
			flag = 0;
		}  
		
		model.addAttribute("flag", flag);
		model.addAttribute("seq", seq);
		
		return "comment_delete_ok";
	}

}
