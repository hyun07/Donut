package com.inf.mentoring.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {

  private int startPage; //시작 페이지
  private int endPage; //끝 페이지
  private boolean prev, next; //이전 다음

  private int total; //전체 페이지
  private Criteria cri; //Criteria에 값 가져오기

  public PageMaker(Criteria cri, int total) {

    this.cri = cri;
    this.total = total;
    //보여지는 페이지 수
    this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
    //시작페이지
    this.startPage = this.endPage - 9;

    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

    if (realEnd <= this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1;

    this.next = this.endPage < realEnd;
  }
  
}

