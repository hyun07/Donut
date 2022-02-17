package com.inf.community.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CommunityReplyVO {
	private int reply_seq; /* 댓글번호 */
	private int community_seq; /* 게시글번호 */
	private String member_id; /* 회원아이디 */
	private String reply_contents; /* 댓글내용 */
	private Date reply_regDT; /* 게시일 */
	private String member_profile_img_nm; /* 프로필 경로 */
	private String member_nickNM; /* 닉네임 */
}
