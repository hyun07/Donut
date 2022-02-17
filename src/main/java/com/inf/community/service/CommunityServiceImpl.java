package com.inf.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inf.community.domain.CommunityReplyVO;
import com.inf.community.domain.CommunityTagVO;
import com.inf.community.domain.CommunityVO;
import com.inf.community.domain.TagVO;
import com.inf.community.mapper.CommunityMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("communityService")
@Transactional(rollbackFor = Exception.class)
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityMapper cmnMapper;

	/* 등록된 게시물 가져오기 */
	@Override
	public List<CommunityVO> cmnGetList() {
		System.out.println("CommunityServiceImpl");
		List<CommunityVO> cmnGetList = cmnMapper.cmnGetList();
		System.out.println("Impl >>>> 전체 게시물 수 >>>>>>>> " + cmnGetList.size());

		return cmnGetList;
	}

	/* 게시물 등록 */
	@Override
	public int insertCommVO(CommunityVO communityVO) {
		System.out.println("CommunityService >>>> Impl");
		int rs = 0;

		String roll = communityVO.getCommunity_roll();

		if (roll.equals("질문답변")) {
			cmnMapper.insertQA(communityVO);
			System.out.println("QA 등록완료 >>>>> ");
		} else if (roll.equals("자유주제")) {
			cmnMapper.insertChat(communityVO);
			System.out.println("Chat 등록완료 >>>>> ");
		} else if (roll.equals("스터디")) {
			cmnMapper.insertStudy(communityVO);
			System.out.println("Study 등록완료 >>>>> ");
		} else if (roll.equals("답변")) {
			cmnMapper.insertAnswer(communityVO);
			System.out.println("답변 등록완료 >>>>> ");
		}
		
		List<String> tagList = communityVO.getTag_name_list();
		if(tagList != null) {
			CommunityTagVO communityTagVO = new CommunityTagVO();
			int rsCT = 0;
			for(String name : tagList) {
				TagVO tag = cmnMapper.duplicateTagName(name);
				
				if(tag != null) {
					communityTagVO.setTag_NO(tag.getTag_NO());
				}else {
					int tagNo = cmnMapper.createTag(name);
					communityTagVO.setTag_NO(tagNo);
				}
				communityTagVO.setCommunity_seq(communityVO.getCommunity_seq());
				rsCT = cmnMapper.createCommTag(communityTagVO);
			}
			
			if(rsCT == tagList.size()) {
				rs = 1;
			}else {
				rs = 0;
			}
		}else {
			rs = 1;
		}
		
		return rs;
	}

	/* community_seq로 게시물 찾기 */
	@Override
	public CommunityVO selectByCommSeq(int community_seq) {
		CommunityVO vo = cmnMapper.selectByCommSeq(community_seq);
		return vo;
	}

	@Override
	public String changeStatus(int community_seq) {
		System.out.println("ServiceImpl >>>>> ");
		
		CommunityVO vo = cmnMapper.selectByCommSeq(community_seq);
		System.out.println(vo);
		String status = vo.getCommumity_status();
		
		System.out.println(status);
		
		if(status.equals("해결")) {
			System.out.println("if절 접근완료");
			vo.setCommumity_status("미해결");
		}else if(status.equals("미해결")) {
			System.out.println("if절 접근완료");
			vo.setCommumity_status("해결");
		}else if(status.equals("모집중")) {
			vo.setCommumity_status("모집완료");
		}else if(status.equals("모집완료")) {
			vo.setCommumity_status("모집중");
		}
		cmnMapper.changeStatus(vo);
		log.info("변경 완료");
		
		return cmnMapper.getStatus(vo.getCommunity_seq());
		
	}

	@Override
	public Map<String, Object> modifyBoard(CommunityVO communityVO) {
		log.info("ServiceImpl >>>>>");
		cmnMapper.modifyBoard(communityVO);
		log.info("변경완료 >>>>>");
		Map<String, Object> result = new HashMap<String, Object>();
		int rsCT = 0;
		
		CommunityTagVO communityTagVO = new CommunityTagVO();
		communityTagVO.setCommunity_seq(communityVO.getCommunity_seq());
		List<String> tagList = communityVO.getTag_name_list();
		
		for(String name : tagList) {
			TagVO tag = cmnMapper.duplicateTagName(name);
			
			if(tag != null) {
				communityTagVO.setTag_NO(tag.getTag_NO());
			}else {
				int tagNo = cmnMapper.createTag(name);
				communityTagVO.setTag_NO(tagNo);
			}
			
			rsCT += cmnMapper.createCommTag(communityTagVO);
			
		}
		
		if(rsCT == tagList.size()) {
			result.put("msg", "수정하였습니다.");
		}else {
			result.put("msg", "다시 시도해주세요.");
		}
		
		result.put("seq", communityVO.getCommunity_seq());
		
		return result;
		
	}

	@Override
	public void getBoardDelete(int community_seq) {
		System.out.println("서비스 입성>>>>");
		int result = cmnMapper.findCommSeqInCommTag(community_seq);
		System.out.println(result);
		if(result > 0) {
			cmnMapper.deleteByCommTagVO(community_seq);
		}else {
			cmnMapper.deleteByCommVO(community_seq);
		}
		
	}

	@Override
	public List<CommunityVO> getAnswerList(int community_seq) {
		System.out.println("CommunityServiceImpl");
		List<CommunityVO> answerList = cmnMapper.getAnswerList(community_seq);
		System.out.println("Impl >>>> 전체 게시물 수 >>>>>>>> " + answerList.size());
		System.out.println(answerList);
		return answerList;
	}

	@Override
	public int insertReply(CommunityReplyVO replyVO) {
		System.out.println("serviceImpl >>>> ");
		int rs = cmnMapper.insertReply(replyVO);
		return rs;
	}

	@Override
	public Map<Integer, List<CommunityReplyVO>> getReplyList(int community_seq) {
		System.out.println("serviceImpl >>>> ");
		List<CommunityVO> answerList = cmnMapper.getAnswerList(community_seq);
		Map<Integer, List<CommunityReplyVO>> map = new HashMap<Integer, List<CommunityReplyVO>>();
		List<CommunityReplyVO> list = new ArrayList<CommunityReplyVO>();
		for(int i=0; i<answerList.size(); i++) {
			int rs = answerList.get(i).getCommunity_seq();
			System.out.println(rs);
			list = cmnMapper.getReplyList(rs);
			map.put(rs, list);
		}
		System.out.println(map);
		return map;
	}

	@Override
	public int modifyAnswer(CommunityVO vo) {
		System.out.println("serviceImpl >>>> ");
		int rs = cmnMapper.updateAnswer(vo);
		System.out.println(rs);
		return rs;
	}

	@Override
	public int modifyReply(CommunityReplyVO vo) {
		System.out.println("serviceImpl >>>> ");
		int rs = cmnMapper.updateReply(vo);
		System.out.println(rs);
		return rs;
	}

	@Override
	public List<CommunityVO> cmnGetStatusList(String commumity_status, String community_roll) {
		System.out.println("서비스 입성");
		
		CommunityVO vo = new CommunityVO();
		vo.setCommumity_status(commumity_status);
		vo.setCommunity_roll(community_roll);
		List<CommunityVO> list = cmnMapper.cmnGetStatusList(vo);
		
		return list;
	}

	


}
