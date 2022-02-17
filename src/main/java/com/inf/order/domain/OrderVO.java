package com.inf.order.domain;

import java.util.Date;

import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;

import lombok.Data;

@Data
public class OrderVO {
	private int order_seq; //주문번호
	private int mentoring_seq; //멘토링번호
	private MentoringVO mentoring;
	private String member_id;
	private String buyer_name; //회원아이디
	private String buyer_phoneNO; //전화번호
	private String buyer_email; //이메일	
	private int amounted_pay; //결제금액
	private Date orderDT; //주문일자

}
