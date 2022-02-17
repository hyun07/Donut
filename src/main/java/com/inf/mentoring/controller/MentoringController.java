package com.inf.mentoring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inf.common.annotation.LoginRequired;
import com.inf.member.domain.UserVO;
import com.inf.mentoring.domain.Criteria;
import com.inf.mentoring.domain.KindsVO;
import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;
import com.inf.mentoring.domain.PageMaker;
import com.inf.mentoring.service.MentoringService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/")
@Log4j
public class MentoringController {

		@Autowired
		private MentoringService mentoringService;
		
		@GetMapping("/mentoring")
		public String allMentor(Model model, Criteria cri, KindsVO kindsVO) throws Exception{
			log.info("MentorList Contriller Get >>> cri >>> " + cri);
			log.info("mentoring page Nav>>>>>List>>>" + kindsVO);
			if(cri == null) {
				cri = new Criteria();
			}else {
				List<MentoringVO> mentors = mentoringService.getPageList(cri);
					
				log.info("mentors >>>>>>>>>> " + mentors.size());
				log.info("mentors >>>>>>>>>>>>>>>>>>>>>>>>>>> " + mentors);

				int total = mentoringService.getPageMaker(cri);
				PageMaker pageMaker = new PageMaker(cri, total);
				
				log.info("pageMaker >>>>>>>>>> " + pageMaker);
				model.addAttribute("pageMaker", pageMaker);
				model.addAttribute("mentors", mentors);
				
				List<MentoringVO> navList = mentoringService.navList(kindsVO);
				log.info("navList >>>>>>>>kinds>>>>>>>>" + kindsVO);
				model.addAttribute("nav",navList);
			}
			
	
			return "mento/mentoring";
		}
		

		//멘토 가입apply
		@ResponseBody
		@PostMapping("/mentoring")
		public Map<String, Object> applyMentee(HttpServletRequest request ,MenteeVO menteeVO, Model model) {
			System.out.println("Mentee regist>>>>>>>>>>>" + menteeVO);
			Map<String, Object> map = mentoringService.applyMentee(menteeVO);
			UserVO userVO = (UserVO) request.getSession().getAttribute("user");
			System.out.println("user>>>>>>>>>>>>>" + userVO );		
			return map;
		}
	
		
	
		
}

