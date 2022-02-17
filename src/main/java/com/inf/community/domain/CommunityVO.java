package com.inf.community.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class CommunityVO {
	private int community_seq;  /* 게시글번호 - PK */
	private String member_id;  /* 회원아이디 */
	private int course_seq; /* 연관강의 */
	private String community_roll; /* 카테고리 */
	private String commumity_status; /* 상태여부명 */
	private String community_title; /* 글제목 */
	private String community_contents; /* 글내용 */
	private Date community_regDT; /* 게시일 */
	private int answer_seq; /* 답변번호 */
	private String member_profile_img_nm; /* 프로필 경로 */
	private String member_nickNM; /* 닉네임 */
	private List<CommunityTagVO> cmtg_list;
	private List<String> tag_name_list;
}
