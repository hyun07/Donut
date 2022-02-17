package com.inf.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inf.community.domain.CommunityReplyVO;
import com.inf.community.domain.CommunityVO;
import com.inf.community.service.CommunityService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community")
public class CommunityContorller {

	@Resource(name = "communityService")
	private CommunityService communityService;

	/* 질문답변 - 전체 리스트 */
	@GetMapping("/questions")
	public String questions(Model model) {

		System.out.println("커뮤니티 접근 >>>> ");
		List<CommunityVO> cmnGetList = communityService.cmnGetList();
		System.out.println("controller >>>> 전체 게시물 >>>>>>>> " + cmnGetList);

		model.addAttribute("cmnlist", cmnGetList);

		return "community/questions";
	}

	@GetMapping("/chats")
	public String chats() {
		return "community/chats";
	}

	@GetMapping("/studies")
	public String studies() {
		return "community/studies";
	}
	
	@GetMapping(value = "/category")
	public String unsolvedList(Model model, @RequestParam("commumity_status") String commumity_status, @RequestParam("community_roll") String community_roll){
		
		System.out.println("커뮤니티 접근 >>>> ");
		List<CommunityVO> cmnGetList = communityService.cmnGetStatusList(commumity_status,community_roll);
		System.out.println("controller >>>> 전체 게시물 >>>>>>>> " + cmnGetList);

		model.addAttribute("cmnlist", cmnGetList);
		
		return "redirect:community/questions";
	}

	/* 게시물등록하기 */
	@ResponseBody
	@RequestMapping(value = "/createPost", method = RequestMethod.POST)
	public Map<String, Object> createPost(@RequestBody CommunityVO communityVO) {
		System.out.println("create 접근 >>>> ");		
		System.out.println(communityVO);
		
		int result = communityService.insertCommVO(communityVO);
		Map<String, Object> rs = new HashMap<String, Object>();
		if(result > 0) {
			System.out.println("controller >>> 게시물 입력 성공");
			rs.put("msg", "등록에 성공하였습니다.");
		}else {
			System.out.println("controller >>> 게시물 입력 실패");
			rs.put("msg", "등록에 실패하였습니다.");
		}

		return rs;
	}
	
	// 게시물 상세페이지
	@GetMapping("/{community_seq}")
	public String communityDatail(@PathVariable("community_seq") int community_seq, Model model) {
		System.out.println("detail 접근 >>>> ");
		System.out.println(community_seq);
		
		CommunityVO vo = communityService.selectByCommSeq(community_seq);
		List<CommunityVO> answerList = communityService.getAnswerList(community_seq);
		Map<Integer, List<CommunityReplyVO>> replyList = communityService.getReplyList(community_seq);
		System.out.println(replyList);
		
		model.addAttribute("answerList", answerList);
		model.addAttribute("community" , vo);
		model.addAttribute("replyList", replyList);
		
		return "community/communityDetail";
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("community_seq") int community_seq, Model model) {
		
		CommunityVO communityVO = communityService.selectByCommSeq(community_seq);
		
		model.addAttribute("community", communityVO);
		
		return "community/modify";
	}
	
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public Map<String, Object> modify(@RequestBody CommunityVO communityVO){
		
		System.out.println("컨트롤러 성공 >>>");
		log.info(communityVO);
		Map<String, Object> result = communityService.modifyBoard(communityVO);
		
		System.out.println(result);

		return result;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("community_seq") int community_seq, RedirectAttributes redirect) {
		System.out.println("컨트롤러 입성 >>>>> ");
		try {
			communityService.getBoardDelete(community_seq);
			redirect.addFlashAttribute("mssg", "삭제가 완료되었습니다.");
			
		} catch (Exception e) {
			redirect.addFlashAttribute("mssg", "오류가 발생되었습니다.");
		}
		
		return "redirect:questions";
	}

	@ResponseBody
	@RequestMapping(value = "/changeStatus",  produces = "application/text; charset=UTF-8")
	public String changeStatus(@RequestParam int community_seq){
		
		System.out.println("컨트롤러 성공 >>>");
		String rs = communityService.changeStatus(community_seq);
		System.out.println(rs);
		return rs;
	}
	
	@ResponseBody
	@RequestMapping(value = "/registerAnswer", method = RequestMethod.POST)
	public Map<String, Object> registerAnswer(@RequestBody CommunityVO communityVO) {
		System.out.println("create 접근 >>>> ");		
		System.out.println(communityVO);
		
		int result = communityService.insertCommVO(communityVO);
		Map<String, Object> rs = new HashMap<String, Object>();
		if(result > 0) {
			System.out.println("controller >>> 답글 입력 성공");
			rs.put("msg", "등록에 성공하였습니다.");
			
		}else {
			System.out.println("controller >>> 답글 입력 실패");
			rs.put("msg", "등록에 실패하였습니다.");
		}

		return rs;
	}
	
	@ResponseBody
	@RequestMapping(value = "/registerReply", method = RequestMethod.POST)
	public Map<String, Object> registerReply(@RequestBody CommunityReplyVO replyVO) {
		System.out.println("create 접근 >>>> ");		
		System.out.println(replyVO);
		
		int result = communityService.insertReply(replyVO);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			System.out.println("controller >>> 답글 입력 성공");
			map.put("result", "ok");
		}else {
			System.out.println("controller >>> 답글 입력 실패");
		}
		return map;
	}
	
	@GetMapping(value = "/replyList")
	public String replyList(@RequestParam("community_seq") int community_seq, Model model){
		System.out.println("컨트롤러 입성완료");
		
		Map<Integer, List<CommunityReplyVO>> replyList = communityService.getReplyList(community_seq);
		int rs = replyList.size();
		model.addAttribute("replyList", replyList);
		//community/communityDetail
		//{community_seq}
		return "community/communityDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyAnswer", method = RequestMethod.POST)
	public Map<String, Object> modifyAnswer(@RequestBody CommunityVO vo) {
		System.out.println("create 접근 >>>> ");		
		System.out.println(vo);
		int result = communityService.modifyAnswer(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			System.out.println("controller >>> 답글 입력 성공");
			map.put("result", "ok");
		}else {
			System.out.println("controller >>> 답글 입력 실패");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyReply", method = RequestMethod.POST)
	public Map<String, Object> modifyReply(@RequestBody CommunityReplyVO vo) {
		System.out.println("create 접근 >>>> ");		
		System.out.println(vo);
		int result = communityService.modifyReply(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			System.out.println("controller >>> 답글 입력 성공");
			map.put("result", "ok");
		}else {
			System.out.println("controller >>> 답글 입력 실패");
		}
		return map;
	}
	
}
