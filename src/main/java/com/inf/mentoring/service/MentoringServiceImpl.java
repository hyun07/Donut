package com.inf.mentoring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inf.course.domain.CourseVO;
import com.inf.course.mapper.CourseMapper;
import com.inf.mentoring.domain.Criteria;
import com.inf.mentoring.domain.KindsVO;
import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;
import com.inf.mentoring.mapper.MentoringMapper;
import com.inf.order.domain.OrderVO;
import com.inf.order.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service("mentoringService")
@Transactional
@Log4j
public class MentoringServiceImpl implements MentoringService {

	@Setter(onMethod_ = @Autowired)
	private MentoringMapper mentoringMapper;

	@Setter(onMethod_ = @Autowired)
	private CourseMapper courseMapper;
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper orderMapper;

	@Override
	public List<MentoringVO> getPageList(Criteria cri) {
		log.info("wow >>>>>>>>>>>>>>>>>>>>>>>>  cri" + cri);
		int end = cri.getPageNum() * cri.getAmount();
		int begin = end - cri.getAmount() + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("keyword", cri.getKeyword());
		log.info("keyword >>>>>>>>>>>>>>>>>>>>>>>>" + cri.getKeyword());
		List<MentoringVO> getPageList = mentoringMapper.selectPageList(map);
		return getPageList;
	}
	

	@Override
	public int getPageMaker(Criteria cri) {
		log.info("get total count>>>>>>>>>>>>>>>" + cri);
		return mentoringMapper.getTotalCount(cri);
	}

	// 신청 - 멘티가 멘토링
		@Override
		public Map<String, Object> applyMentee(MenteeVO menteeVO) {
			String regDate = menteeVO.getMentee_regdt();
			System.out.println("regDate >>>>>>>>>>>>>>>>>>>>> " + regDate);
			regDate = regDate.replace("T", " ").replaceAll("-", "/");
			menteeVO.setMentee_regdt(regDate);
			log.info("regDate >>>>>>>>>>>>>>>" + regDate);
			log.info("menteeVO >>>>>>>>>>>>>>>" + menteeVO);
			Map<String, Object> map = new HashMap<String, Object>();
			//중복체크
			int duple = mentoringMapper.selectDuplicatedMyMenteeByMenteeVO(menteeVO);
			// 수강신청 1=신청함 0=신청안함
			log.info("duple >>>>>>>>>>>>>>>" + duple);
			if (duple > 0) {
				// 결제 여부 확인
				MenteeVO mentee = mentoringMapper.selectOnById(menteeVO);
				log.info("mentee >>>>>>>>>>>>>>>" + mentee);
				log.info("mentee.getPay_enabled() >>>>>>>>>>>>>>>" + mentee.getPay_enabled());
				if (mentee.getPay_enabled().equals("결제완료")) {
					// 수강신청 여부 ok 결제 ok
					map.put("link","/mypage/myMentoring");
					map.put("msg", "이미 진행중인 멘토링입니다.<br> 마이 페이지로 이동합니다.");
					map.put("result", "ok");
					map.put("icon", "info");
				} else {
					// 수강신청 ok 결제No 결제창으로
					map.put("link","/order/purchaseMentoring/"+mentee.getMentee_seq());
					map.put("msg", "결제가 되지않았습니다.<br> 결제 페이지로 이동합니다");
					map.put("result", "notOk");
					map.put("icon", "warning");
				}
			} else {
				// 신청 안했을때
				MentoringVO mentroingVO = mentoringMapper.selectMentoringBySeq(menteeVO.getMentoring_seq());
				int free = mentroingVO.getMentoring_price();
				if (free == 0) {
					//무료
					int result = mentoringMapper.insertNewMyMenteeForFree(menteeVO);
					map.put("result", "freePay");
					map.put("link","/mypage/myMentoring");
					map.put("msg", "신청이 완료되었습니다.<br> 마이 페이지으로 이동합니다.");
					map.put("icon", "success");
				} else {
					//유료
					int result = mentoringMapper.insertNewMyMentee(menteeVO);
					log.info("result >>>>>>>>>>>>>>>" + result);
					map.put("link","/order/purchaseMentoring/"+menteeVO.getMentee_seq());
					map.put("result", true);
					map.put("msg", "신청이 완료되었습니다.<br> 결제 페이지으로 이동합니다.");
					map.put("icon", "success");
				}
			}
			return map;
		}
	@Override
	public List<MentoringVO> applyMentoList(String member_id) {
		List<MentoringVO> applyMentoList = mentoringMapper.selectApplyMentoListById(member_id);
		log.info("applyMentoList>>>>>>>>>>>>>>>>>" + applyMentoList);
		return applyMentoList.size() == 0 ? null : applyMentoList;
	}

	@Override
	public List<MenteeVO> appliedMenteeList(String member_id) {
		List<MenteeVO> appliedMenteeList = mentoringMapper.selectAppliedMenteeById(member_id);
		log.info("appliedMenteeList>>>>>>>>>>>>>>>>>" + appliedMenteeList);
		return appliedMenteeList.size() == 0 ? null : appliedMenteeList;
	}

	@Override
	public Map<String, Object> applyMentoring(MentoringVO mentoringVO) {
		log.info("멘토링 등록 서비스impl 들어옴" + mentoringVO);
		Map<String, Object> map = new HashMap<String, Object>();
		int result = mentoringMapper.insertNewMyMentoring(mentoringVO);
		if (result > 0) {
			map.put("result", true);
			map.put("msg", "멘토링 등록 완료");
			map.put("icon", "success");
			map.put("link", "/mypage/myMentoring");
		} else {
			map.put("result", false);
			map.put("msg", "멘토링 등록 실패");
			map.put("icon", "warning");
			map.put("link", "/mypage/myMentoring");
		}
		return map;
	}

	public List<CourseVO> courseList(String member_id) {
		List<CourseVO> courseList = courseMapper.selectCourseByMemberId(member_id);
		log.info("courseList>>>>>>>>>>>>>>>>>" + courseList);
		return courseList.size() == 0 ? null : courseList;
	}

	@Override
	public Map<String, Object> cancelMentoring(int mentoring_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("멘토링 등록 서비스 impl 삭제하러 들어옴" + mentoring_seq);
		int result = mentoringMapper.cancelMentoringBySeq(mentoring_seq);
		MentoringVO mentoring;
		if (result > 0) {
			mentoring = mentoringMapper.selectMentoringBySeq(mentoring_seq);
			map.put("result", true);
			map.put("msg", "삭제 되었습니다.");
			map.put("icon", "success");
			map.put("link", "/mypage/myMentoring");

		} else {
			mentoring = null;
			map.put("result", false);
			map.put("msg", "삭제에 실패했습니다.");
			map.put("icon", "error");
			map.put("link", "/mypage/myMentoring");
		}
		return map;
	}

	@Override
	public List<MenteeVO> showMentoringList(String member_id) {
		List<MenteeVO> showMentoringList = mentoringMapper.selectMenteeMentoringById(member_id);
		log.info("등록한 멘토링 전체>>>>>>>>>>>>>" + showMentoringList);
		return showMentoringList.size() == 0 ? null : showMentoringList;
	}

	@Override
	public List<MentoringVO> showRecordList(String member_id) {
		List<MentoringVO> showRecordList = mentoringMapper.selectOldMentoringById(member_id);
		log.info("지금까지 들었던 멘토링>>>>>>>과거의 잔재>>>>>>" + showRecordList);
		return null;
	}

	@Override
	public List<MenteeVO> noCheckMentoringList(String member_id) {
		List<MenteeVO> noCheckMenteeList = mentoringMapper.selectNoCheckMentoringById(member_id);
		log.info("미승인 멘토링>>>>>>>멘토가 check해줘야함>>>>>>" + noCheckMenteeList);
		return noCheckMenteeList.size() == 0 ? null : noCheckMenteeList;
	}

	@Override
	public List<MenteeVO> noPayMentoringList(String member_id) {
		List<MenteeVO> noPayMenteeList = mentoringMapper.selectNoPayMentoringById(member_id);
		log.info("미결제 멘토링>>>>>>>>>>>>>" + noPayMenteeList);
		return noPayMenteeList.size() == 0 ? null : noPayMenteeList;
	}

	@Override
	public List<MenteeVO> noCheckMenteeList(String member_id) {
		List<MenteeVO> noCheckMenteeList = mentoringMapper.selectNoCheckMenteeById(member_id);
		log.info("미승인 멘티>>>>>>>>>>>>>" + noCheckMenteeList);

		return noCheckMenteeList.size() == 0 ? null : noCheckMenteeList;
	}

	@Override
	public Map<String, Object> delMentoring(int mentee_seq) {
		int result = mentoringMapper.deleteMentoringByseq(mentee_seq);
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("멘티삭제>>>>>>>>>>>>>" + result);
		MenteeVO mentee;
		if (result > 0) {
			mentee = mentoringMapper.selectMenteeBySeq(mentee_seq);
			map.put("result", true);
			map.put("msg", "삭제 되었습니다.");
			map.put("icon", "success");
			map.put("link", "/mypage/myMentoring");

		} else {
			mentee = null;
			map.put("result", false);
			map.put("msg", "삭제에 실패했습니다.");
			map.put("icon", "error");
			map.put("link", "/mypage/myMentoring");
		}
		return map;
	}
	@Override
	public Map<String, Object> consentMentee(int mentee_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("멘티 수락하러 들어옴>>>>>>>>>>>>>>");
		int consentMentee = mentoringMapper.changeMenteeEnabledBySeq(mentee_seq);
		if (consentMentee == 1) {
			map.put("result", true);
			map.put("msg", "승락되었습니다.");
			map.put("link", "/mypage/myMentoring.");
		}
		return map;
	}
	
	//멘토링 페이지 nav
	@Override
	public List<MentoringVO> navList(KindsVO kindsVO) {
		log.info("navList 가지러하러 들어옴>>>>>>>>>>>>>>");
		List<MentoringVO> navList = mentoringMapper.selectNavListKinds(kindsVO);
		log.info("navList 가지고 나감>>>>>>>>>>>>>>" + navList);
		return navList;
	}






}
