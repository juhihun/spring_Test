package com.yedam.app.book.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.app.book.service.BookService;
import com.yedam.app.book.service.BookVO;

@Controller
public class BookController {
	private BookService bookService;
	
	@Autowired
	public BookController(BookService bookService){
		this.bookService = bookService;
	}
	
	@GetMapping("bookList")
	public String bookList(Model model) { //Model = Request + Responsebody
		List<BookVO> list = bookService.bookList(); //목록을 담음
		model.addAttribute("books", list); //model의 boards 변수에 리스트를 담음(html에서 사용할 수 있게)
		return "book/bookList";
	}
	
	//등록 - 등록을 위한 페이지 요청
	@GetMapping("bookInsert")
	public String bookInsertForm() {
		return "book/bookInsert";
	}
	
	//등록 - DB에 등록하는 처리(연산, submit->커맨트객체사용)
	@PostMapping("bookInsert")
	public String bookInsertProcess(BookVO bookVO, Model model) {
		int bookInsert = bookService.insertBook(bookVO);
		String url = null;

		if(bookInsert > -1) {
			//정상적으로 등록된 경우( 'redirect:' 으로 시작되면 경로 재요청으로 이어짐)
			url = "redirect:bookList";
		}else {
			//정상적으로 등록되지 않은 경우
			url="redirect:bookInsert";
		}
		return url;
	}
	
	
	@GetMapping("rentList")
	public String rentList(Model model) { //Model = Request + Responsebody
		List<BookVO> list = bookService.rentList(); //목록을 담음
		model.addAttribute("rents", list); //model의 boards 변수에 리스트를 담음(html에서 사용할 수 있게)
		return "book/rentList";
	}
	
	
	
}