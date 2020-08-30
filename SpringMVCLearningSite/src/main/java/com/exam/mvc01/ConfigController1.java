package com.exam.mvc01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.BoardTO;
import model.CommentTO;

@Controller
public class ConfigController1 {
	
	@Autowired
	private Mapper mapper;
	
	@RequestMapping("/subject1.do")
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		ArrayList<BoardTO> lists = mapper.boardList("일본 역사와 한일 관계");
		
		model.addAttribute("lists", lists);
		
		return "subject1";
	}
	
	@RequestMapping("/subject2.do")
	public String subject2(HttpServletRequest request, HttpServletResponse response, Model model) {

		ArrayList<BoardTO> lists = mapper.boardList("해양사 시리즈");

		model.addAttribute("lists", lists);

		return "subject2";
	}
	
	@RequestMapping("/subject3.do")
	public String subject3(HttpServletRequest request, HttpServletResponse response, Model model) {

		ArrayList<BoardTO> lists = mapper.boardList("한민족 시리즈");

		model.addAttribute("lists", lists);

		return "subject3";
	}
	
	@RequestMapping("/subject4.do")
	public String subject4(HttpServletRequest request, HttpServletResponse response, Model model) {

		ArrayList<BoardTO> lists = mapper.boardList("고구려사 시리즈");

		model.addAttribute("lists", lists);

		return "subject4";
	}

	@RequestMapping("/subject5.do")
	public String subject5(HttpServletRequest request, HttpServletResponse response, Model model) {

		ArrayList<BoardTO> lists = mapper.boardList("청년과 학자");

		model.addAttribute("lists", lists);

		return "subject5";
	}

	@RequestMapping("/write.do")
	public String write() {
		
		return "write";
	}
	
	@RequestMapping("/write_ok.do")
	public String writeOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		// 자동 증가 컬럼(seq) 초기화
		mapper.updateSeq();
		
		int flag = 1;
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to.setSubject(request.getParameter("subject"));
		to.setLink(request.getParameter("link"));
		to.setTitle(request.getParameter("title"));
		to.setContent(request.getParameter("content"));
		to.setWdate(request.getParameter("wdate"));
		
		int result = mapper.boardWriteOk(to);
		
		if (result == 1) {
			flag = 0;
		}
		
		model.addAttribute("flag", flag);
		
		return "write_ok";
	}
	
	@RequestMapping("/view.do")
	public String view(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String seq = request.getParameter("seq");
		
		BoardTO to = new BoardTO();
		to = mapper.boardView(seq);
	
		ArrayList<CommentTO> cLists = mapper.commentList(seq);
		
		model.addAttribute("to", to);
		model.addAttribute("cLists", cLists);
	
		return "view";
	}
	
	@RequestMapping("/modify.do")
	public String modify(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String seq = request.getParameter("seq");
		
		BoardTO to = new BoardTO();
		to = mapper.boardModify(seq);
		
		model.addAttribute("to", to);
		
		return "modify";
	}
	
	@RequestMapping("/modify_ok.do")
	public String modifyOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		int flag = 1;
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to.setSubject(request.getParameter("subject"));
		to.setTitle(request.getParameter("title"));
		to.setLink(request.getParameter("link"));
		to.setContent(request.getParameter("content"));
		
		int result = mapper.boardModifyOk(to);
		
		if (result == 1) {
			flag = 0;
		}
		
		model.addAttribute("flag", flag);
		
		return "modify_ok";
	}
	
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String seq = request.getParameter("seq");
		
		BoardTO to = new BoardTO();
		to = mapper.boardDelete(seq);
		
		model.addAttribute("to", to);
		
		return "delete";
	}
	
	@RequestMapping("/delete_ok.do")
	public String deleteOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String seq = request.getParameter("seq");
		
		int flag = 1;
		
		int result = mapper.boardDeleteOk(seq);
		
		if (result == 1) {
			flag = 0;
		}
		
		model.addAttribute("flag", flag);
		
		return "delete_ok";
	}
	
}
