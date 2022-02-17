package com.inf.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inf.common.annotation.LoginRequired;
import com.inf.course.domain.CourseVO;
import com.inf.course.domain.PurchaseCourseVO;
import com.inf.course.service.CourseService;
import com.inf.member.domain.MemberVO;
import com.inf.member.domain.UserVO;
import com.inf.member.service.MemberService;
import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;
import com.inf.mentoring.service.MentoringService;
import com.inf.order.domain.OrderVO;
import com.inf.order.service.OrderService;
import com.inf.review.domain.ReviewVO;
import com.inf.review.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MentoringService mentoringService;
	@Autowired
	private ReviewService reviewService;

	@GetMapping(value = { "/main", "/course" })
	@LoginRequired
	public String myCourse(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		String member_id = user.getMember_id();
		String role = user.getMember_role();
		String path = getPathByMemberRole(role);
		if (role.equals("멘토")) {
			List<CourseVO> able = courseService.ableCourse(member_id);
			List<CourseVO> await = courseService.awaitCourse(member_id);
			List<CourseVO> cancle = courseService.cancelCourse(member_id);
			model.addAttribute("ableCourse", able);
			model.addAttribute("awaitCourse", await);
			model.addAttribute("cancleCourse", cancle);
			return path + "/applyCourse";
		} else {
			List<PurchaseCourseVO> course = orderService.selectPurchaseCoursesByMemberId(member_id);
			model.addAttribute("myCourse", course);
			return path + "/myCourse";
		}
	}

	// 작성한 리뷰보기
	@GetMapping("/review")
	@LoginRequired
	public String showReview(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		List<ReviewVO> review = reviewService.selectReviewOfCourseByMemberId(user.getMember_id());
		model.addAttribute("myReview", review);
		return "/mypage/myReview";
	}

	// 멘티 - 멘토 신청
	@GetMapping("/applyMentor")
	@LoginRequired
	public String applyMentor(HttpServletRequest request, Model model) {

		return "/mypage/applyMentor";
	}

	@ResponseBody
	@PostMapping("/applyMentor")
	public Map<String, String> applyMentor(HttpServletRequest request, String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		HttpSession session = request.getSession();

		Map<String, Object> resultMap = memberService.changeRoleToMentor(member_id);
		int result = (Integer) resultMap.get("result");
		UserVO user = (UserVO) resultMap.get("user");

		if (result > 0) {
			session.setAttribute("user", user);
			map.put("result", "true");
		} else {
			map.put("result", "false");
		}

		return map;
	}

	// 멘티 - 멘토 신청 취소
	@ResponseBody
	@PostMapping("/cancleApply")
	public Map<String, String> cancleApply(HttpServletRequest request, String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		HttpSession session = request.getSession();

		Map<String, Object> resultMap = memberService.cancleApplyforMentor(member_id);
		int result = (Integer) resultMap.get("result");
		UserVO user = (UserVO) resultMap.get("user");

		if (result > 0) {
			session.setAttribute("user", user);
			map.put("result", "true");
		} else {
			map.put("result", "false");
		}

		return map;
	}

	// 멘토 - 강의 등록 신청
	@ResponseBody
	@PostMapping("/applyCourse")
	public Map<String, String> applyCourse(@RequestParam(value = "cts[]") List<Integer> category_seq,
			@RequestParam(value = "sks[]") List<String> skill_nm, CourseVO course) {
		log.info(category_seq);
		log.info(skill_nm);
		log.info(course);
		Map<String, String> map = new HashMap<String, String>();

		int result = courseService.addNewCourse(course, category_seq, skill_nm);

		if (result > 0) {
			map.put("result", "true");
			map.put("msg", "강의 등록 신청이 완료되었습니다.");
		} else {
			map.put("result", "false");
			map.put("msg", "강의 등록 실패, 다시 시도해주세요.");
		}

		return map;
	}

	// 멘토 - 강의 신청 취소
	@ResponseBody
	@PostMapping("/cancelCourse")
	public Map<String, String> cancelCourse(int course_seq) {
		log.info(course_seq);
		Map<String, String> map = new HashMap<String, String>();

		int result = courseService.cancelCourse(course_seq);

		if (result > 0) {
			map.put("result", "true");
			map.put("msg", "강의 등록 신청이 취소되었습니다.");
		} else {
			map.put("result", "false");
			map.put("msg", "등록 신청 취소 실패, 다시 시도해주세요.");
		}
		return map;
	}

	// 멘토 - 취소한 강의 재신청
	@ResponseBody
	@PostMapping("/reapplyCourse")
	public Map<String, String> reapplyCourse(int course_seq) {
		log.info(course_seq);
		Map<String, String> map = new HashMap<String, String>();

		int result = courseService.reapplyCourse(course_seq);

		if (result > 0) {
			map.put("result", "true");
			map.put("msg", "해당 강의 승인이 다시 신청되었습니다.");
		} else {
			map.put("result", "false");
			map.put("msg", "강의 승인 재신청 실패, 다시 시도해주세요.");
		}
		return map;
	}

	// 멘토 - 등록 신청 후 대기중인 강의 보기
	@GetMapping("/awaitCourse")
	@LoginRequired
	public String awaitCourse(RedirectAttributes rda) {
		rda.addFlashAttribute("await", true);
		return "redirect:/mypage/course";
	}

	// 멘토 - 신청 취소후 취소한 강의보기
	@GetMapping("/cancelCourse")
	@LoginRequired
	public String cancleCourse(RedirectAttributes rda) {
		rda.addFlashAttribute("cancle", true);
		return "redirect:/mypage/course";
	}

	// 정보 변경페이지 접근
	@GetMapping("/myInfo")
	@LoginRequired
	public String viewMyInfo(Model model) {
		return "/mypage/myInfo";
	}

	// 프로필 이미지 변경
	@ResponseBody
	@PostMapping("/changeProfileImage")
	public Map<String, String> changeProfileImage(HttpSession session, MemberVO member) {
		Map<String, String> map = new HashMap<String, String>();
		log.info(member);
		int result = memberService.changeProfileImage(member);

		if (result > 0) {
			UserVO user = (UserVO) session.getAttribute("user");
			user.setMember_profile_img_nm(member.getMember_profile_img_nm());
			session.setAttribute("user", user);
			map.put("result", "true");
			map.put("msg", "프로필 이미지 변경이 완료되었습니다.");
		} else {
			map.put("result", "false");
			map.put("msg", "프로필 이미지 변경 실패, 다시 시도해주세요.");
		}

		return map;
	}

	// 회원 정보 변경(일반)
	@ResponseBody
	@PostMapping("/changeInfo")
	public Map<String, String> changeInfo(MemberVO member, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();

		int result = memberService.changeMemberInfo(member);

		if (result > 0) {
			UserVO user = (UserVO) session.getAttribute("user");
			user.setMember_nickNM(member.getMember_nickNM());
			user.setMember_content(member.getMember_content());
			user.setMember_email(member.getMember_email());
			user.setMember_phoneNO(member.getMember_phoneNO());
			session.setAttribute("user", user);
			map.put("result", "true");
			map.put("msg", "회원 정보 변경이 완료되었습니다.");
		} else {
			map.put("result", "false");
			map.put("msg", "정보 변경 실패, 다시 시도해주세요.");
		}

		return map;
	}

	// 회원 정보 변경(전화번호)
	@ResponseBody
	@PostMapping("/changePhoneNo")
	public Map<String, String> changePhoneNo(MemberVO member, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();

		int result = memberService.changeMemberPhoneNo(member);

		if (result > 0) {
			UserVO user = (UserVO) session.getAttribute("user");
			user.setMember_phoneNO(member.getMember_phoneNO());
			session.setAttribute("user", user);
			map.put("result", "true");
			map.put("msg", "전화 번호 변경이 완료되었습니다");
		} else {
			map.put("result", "false");
			map.put("msg", "전화번호 변경 실패, 다시 시도해주세요.");
		}

		return map;
	}

	// 회원 정보 변경(비밀번호)
	@ResponseBody
	@PostMapping("/changePassword")
	public Map<String, String> changePassword(MemberVO member, String new_password, String check_password,
			HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();

		// 변경 비밀번호와 확인 비밀번호 일치 확인
		if (!new_password.equals(check_password)) {
			map.put("result", "false");
			map.put("newCheck", "false");
			map.put("msg", "변경 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		}

		Map<String, String> result = memberService.changeMemberPassword(member, new_password);
		if (result.get("isMember").equals("yes")) {
			if (result.get("result").equals("updated")) {
				map.put("result", "true");
				map.put("msg", "비밀번호 변경이 완료되었습니다.");
			} else {
				map.put("result", "false");
				map.put("msg", "비밀번호 변경 실패, 다시 시도해주세요.");
			}
		} else {
			map.put("result", "false");
			map.put("curCheck", "false");
			map.put("msg", "현재 비밀번호가 일치하지 않습니다.");
		}

		return map;
	}
	
	/* 멘토링 */
	
	// 마이페이지 - 멘토링
		@GetMapping("/myMentoring")
		@LoginRequired
		public String myMentoring(HttpServletRequest request, Model model, MenteeVO menteeVO) {
			HttpSession session = request.getSession();
			UserVO user = (UserVO) session.getAttribute("user");
			String member_id = user.getMember_id();
			String role = user.getMember_role();
			String path = getPathByMemberRole(role);
			// 등록한 해당 멘토의 전체 멘토링 / 해당 멘토링에 대한 멘티
			if (role.equals("멘토")) {
				// 등록되어있는 해당 아이디 멘토링 전체
				List<MentoringVO> applyMentoList = mentoringService.applyMentoList(member_id);
				// 강좌
				List<CourseVO> courseList = mentoringService.courseList(member_id);
				// 등록한 멘토링에 신청한 멘티정보
				List<MenteeVO> appliedMenteeList = mentoringService.appliedMenteeList(member_id);
				// 미승인 멘티
				List<MenteeVO> noCheckMenteeList = mentoringService.noCheckMenteeList(member_id);

				model.addAttribute("applyMentoList", applyMentoList);
				model.addAttribute("appliedMenteeList", appliedMenteeList);
				model.addAttribute("courseList", courseList);
				model.addAttribute("noCheckMentee", noCheckMenteeList);

				return path + "/applyMentoring";
			} else if (role.equals("멘티")) {
				// 승인 결제 완료된 멘토링
				List<MenteeVO> showMentoringList = mentoringService.showMentoringList(member_id);
				// 이제는 하지않는 멘토링
				List<MentoringVO> showRecordList = mentoringService.showRecordList(member_id);
				// 승인 대기중인 멘토링
				List<MenteeVO> noCheckMentoringList = mentoringService.noCheckMentoringList(member_id);
				// 결제 대기중인 멘토링
				List<MenteeVO> noPayMentoringList = mentoringService.noPayMentoringList(member_id);
				log.info("showMentoringList>>>>>멘티>>>>>." + showMentoringList);
				log.info("showRecordList>>>>>멘티>>>>>." + showRecordList);
				log.info("noCheckMentoringList>>>>>멘티>>>>>." + noCheckMentoringList);
				log.info("noPayMentoringList>>>>>멘티>>>>>." + noPayMentoringList);
				model.addAttribute("infoMento", showMentoringList);
				model.addAttribute("recordMento", showRecordList);
				model.addAttribute("noCheck", noCheckMentoringList);
				model.addAttribute("noPay", noPayMentoringList);

				return path + "/myMentoring";
			} else {
				return null;
			}
		}

		// 등록 - 멘토링
		@ResponseBody
		@PostMapping("/applyMentoring")
		public Map<String, Object> applyMentoring(@RequestBody MentoringVO mentoringVO) {
			log.info("mentoringVO>>>>>>>>>>>>>>mentoringVO>>>>>>" + mentoringVO);

			Map<String, Object> map = mentoringService.applyMentoring(mentoringVO);

			log.info("result>>>>>>>" + map);

			return map;
		}


		// 수락 - 멘토
		@ResponseBody
		@PostMapping("/consentMentee")
		public Map<String, Object> consentMentee(int mentee_seq) {
			log.info("consentMentee>>>>>>>>>>>>>>consentMentee>>>>>>" + mentee_seq);
			Map<String, Object> map = mentoringService.consentMentee(mentee_seq);
			log.info("result>>>>>>>" + map);

			return map;
		}


		// 삭제 - 멘토링 (status를 N으로 만들어서 보이는건 없게 데이터는 남아있게함)
		@ResponseBody
		@PostMapping("/cancelMentoring")
		public Map<String, Object> cancelMentoring(int mentoring_seq) {
			log.info(mentoring_seq);
			Map<String, Object> map = mentoringService.cancelMentoring(mentoring_seq);
			log.info("result>>>>>>>" + map);
			return map;
		}


		// 멘티 - 삭제
		@ResponseBody
		@PostMapping("/delMentoring")
		public Map<String, Object> delMentoring(int mentee_seq) {
			log.info(mentee_seq);
			Map<String, Object> map = mentoringService.delMentoring(mentee_seq);
			log.info("result>>>>>>>" + map);
			return map;
		}



		// 마이페이지 - 멘토링 구매 현황
		@GetMapping("/purchaseHistory")
		@LoginRequired
		public String purchaseHistory(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			UserVO user = (UserVO) session.getAttribute("user");
			String member_id = user.getMember_id();
			String member_role= user.getMember_role();
			// 구매내역 판매내역 매핑따로
			List<OrderVO> purchaseHistory = orderService.purchaseHistory(member_id);
			model.addAttribute("buy", purchaseHistory);
			return "/mypage/purchaseHistory";

		}

		// 마이페이지 - 멘토링 판매 현황
		@GetMapping("/salesHistory")
		@LoginRequired
		public String salesHistory(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			UserVO user = (UserVO) session.getAttribute("user");
			String member_id = user.getMember_id();
			String member_role= user.getMember_role();
			List<OrderVO> salesHistory = orderService.salesHistory(member_id);
			model.addAttribute("sale", salesHistory);
			
			return "/mypage/salesHistory";

		}

		// 회원의 권한(멘티,멘토,관리자)에 따라 경로 반환
		private String getPathByMemberRole(String role) {
			if (role.equals("멘티")) {
				return "/mypage/mentee";
			} else if (role.equals("멘토")) {
				return "/mypage/mentor";
			} else {
				return "/mypage/admin";
			}
		}

}
