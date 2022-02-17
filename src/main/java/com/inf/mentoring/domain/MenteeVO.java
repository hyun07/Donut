package com.inf.mentoring.domain;

import com.inf.member.domain.MemberVO;

import lombok.Data;
@Data
public class MenteeVO {
		private int mentee_seq; //신청 번호
		private String member_id; //신청자 아이디
		private MemberVO member; //MemberVO
		private String member_phoneNO; // 신청자 연락처
		private String member_email; //신청자 이메일
		private int mentoring_seq; //멘토링번호
		private MentoringVO mentoring; //MentoringVO
		private String mentee_regdt; //신청날짜
		private String mentee_comment; //한마디
		private String enabled; //수강가능유무 (1,0)
		private String pay_enabled; //결제유무(1,0)
}
