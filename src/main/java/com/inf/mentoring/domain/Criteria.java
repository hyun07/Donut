package com.inf.mentoring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {
	//페이징 버튼
  private int pageNum;
  //한 페이징 당 가져올 수
  private int amount;
  //검색
  private String keyword;
  
  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  

}


