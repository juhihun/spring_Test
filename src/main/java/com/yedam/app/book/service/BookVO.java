package com.yedam.app.book.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookVO {
	private Integer bookNo;
	private String bookName;
	private String bookCoverimg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookDate;
	private Integer bookPrice;
	private String bookPublisher;
	private String bookInfo;
	private Integer rentPrice;
	private Integer total;
	private Integer cnt;
}
