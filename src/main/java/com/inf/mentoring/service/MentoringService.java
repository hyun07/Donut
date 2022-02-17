package com.inf.mentoring.service;

import java.util.List;
import java.util.Map;

import com.inf.course.domain.CourseVO;
import com.inf.mentoring.domain.Criteria;
import com.inf.mentoring.domain.KindsVO;
import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;
import com.inf.mentoring.domain.PageMaker;
import com.inf.order.domain.OrderVO;

public interface MentoringService {
	//화면에 mentoring총 정보 뿌리기
	List<MentoringVO> getPageList(Criteria cri);
	//페이징
	int getPageMaker(Criteria cri);
	//멘티가 멘토링 신청
	Map<String, Object> applyMentee(MenteeVO menteeVO);
	//등록한 멘토링 전부
	List<MentoringVO> applyMentoList(String member_id);
	//멘토링 신청한 멘티정보
	List<MenteeVO> appliedMenteeList(String member_id);
	//멘토링 - 미승인된 멘티 정보
	List<MenteeVO> noCheckMenteeList(String member_id);
	//등록되었는지 확인
	Map<String, Object> applyMentoring(MentoringVO mentoringVO);
	//강좌 선택
	List<CourseVO> courseList(String member_id);
	//삭제
	Map<String, Object> cancelMentoring(int mentoring_seq);
	//멘티 - 신청 멘토링 
	List<MenteeVO> showMentoringList(String member_id);
	//멘티 - 들었던 멘토링 (현재 안함)
	List<MentoringVO> showRecordList(String member_id);
	//멘티 - 승인대기
	List<MenteeVO> noCheckMentoringList(String member_id);
	//멘티 - 결제 대기
	List<MenteeVO> noPayMentoringList(String member_id);
	//멘티 - 멘토링 삭제
	Map<String, Object> delMentoring(int mentee_seq);
	//멘토 - 승낙
	Map<String, Object> consentMentee(int mentee_seq);
	//멘토링페이지 nav
	List<MentoringVO> navList(KindsVO kindsVO);
	
	

	
	
	
	
	

	

	
	
}
