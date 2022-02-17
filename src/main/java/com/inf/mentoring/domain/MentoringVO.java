package com.inf.mentoring.domain;

import java.sql.Date;
import java.util.List;

import com.inf.course.domain.CourseVO;
import com.inf.member.domain.MemberVO;

import lombok.Data;
@Data
public class MentoringVO {
	private int mentoring_seq; //멘토링번호
	private String member_id; //멘토아이디
	private MemberVO member; //멘토전체
	private int course_seq; //강좌번호
	private CourseVO course;
	private int kinds_seq; //멘토링 분야 번호
	private KindsVO kinds; //분야 전체
	private String mentoring_title; //멘토링 제목
	private String mentoring_content; //멘토링 내용
	private int mentoring_price; //멘토링 금액
	private Date mentoring_regDT; //멘토링 생성일
	private String mentoring_status; //멘토링 상태
	private String mentoring_materials; //멘토링 준비물
	private String mentoring_comment; //멘토 한마디
	private List<KindsVO> k_list;
	
}
