package com.inf.community.service;

import java.util.List;
import java.util.Map;

import com.inf.community.domain.CommunityReplyVO;
import com.inf.community.domain.CommunityVO;

public interface CommunityService {

	/* 게시판 목록 */
    public List<CommunityVO> cmnGetList();

	/* 게시물 등록 */
	public int insertCommVO(CommunityVO communityVO);

	/* seq로 게시물 찾기 */
	public CommunityVO selectByCommSeq(int community_seq);

	/* 게시물 수정 */
	public Map<String, Object> modifyBoard(CommunityVO communityVO);

	public void getBoardDelete(int community_seq);

	public String changeStatus(int community_seq);

	public List<CommunityVO> getAnswerList(int community_seq);

	public int insertReply(CommunityReplyVO replyVO);

	public Map<Integer, List<CommunityReplyVO>> getReplyList(int community_seq);

	public int modifyAnswer(CommunityVO vo);

	public int modifyReply(CommunityReplyVO vo);

	public List<CommunityVO> cmnGetStatusList(String commumity_status, String community_roll);

	//public int registerAnswer(CommunityVO communityVO);
}
