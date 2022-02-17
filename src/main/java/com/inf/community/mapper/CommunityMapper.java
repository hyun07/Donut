package com.inf.community.mapper;

import java.util.List;

import com.inf.community.domain.CommunityReplyVO;
import com.inf.community.domain.CommunityTagVO;
import com.inf.community.domain.CommunityVO;
import com.inf.community.domain.TagVO;

public interface CommunityMapper {

	/* 게시판 목록 */
    public List<CommunityVO> cmnGetList();

	/* 질문답변 게시글 등록 */
	public int insertQA(CommunityVO vo);

	/* 자유주제 게시글 등록 */
	public int insertChat(CommunityVO vo);

	/* 스터디 게시글 등록 */
	public int insertStudy(CommunityVO vo);

	/* 태그이름 중복 검사 */
	public TagVO duplicateTagName(String tag_NM);

	/* 커뮤니티게시글과 태그 연결 테이블 생성 */
	public int createCommTag(CommunityTagVO communityTagVO);

	/* 태그 생성 */
	public int createTag(String tag_NM);

	/* seq로 객체 찾기 */
	public CommunityVO selectByCommSeq(int community_seq);

	/* status 변경 */
	public void changeStatus(CommunityVO vo);

	public void modifyBoard(CommunityVO communityVO);

	public void deleteByCommVO(int community_seq);

	public void deleteByCommTagVO(int community_seq);
	
	public int findCommSeqInCommTag(int community_seq);

	public void insertAnswer(CommunityVO communityVO);

	public List<CommunityVO> getAnswerList(int community_seq);

	public int insertReply(CommunityReplyVO replyVO);

	public List<CommunityReplyVO> getReplyList(int community_seq);

	public String getStatus(int community_seq);

	public int updateAnswer(CommunityVO vo);

	public int updateReply(CommunityReplyVO vo);

	public List<CommunityVO> cmnGetStatusList(CommunityVO vo);

	

	

}