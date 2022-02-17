package com.inf.mentoring.mapper;

import java.util.List;
import java.util.Map;

import com.inf.mentoring.domain.Criteria;
import com.inf.mentoring.domain.KindsVO;
import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;
import com.inf.order.domain.OrderVO;

public interface MentoringMapper {
	
	
	public List<MentoringVO> selectPageList(Map<String, Object> map);

	public int getTotalCount(Criteria cri);

	public int applyMentee(MenteeVO menteeVO);


	public List<MentoringVO> selectApplyMentoListById(String member_id);

	public List<MenteeVO> selectAppliedMenteeById(String member_id);

	public int cancelMentoringBySeq(int mentoring_seq);

	public MentoringVO selectMentoringBySeq(int mentoring_seq);

	public List<MenteeVO> selectMenteeMentoringById(String member_id);

	public List<MentoringVO> selectOldMentoringById(String member_id);

	public int insertNewMyMentee(MenteeVO menteeVO);

	public int selectDuplicatedMyMenteeByMenteeVO(MenteeVO menteeVO);

	public MenteeVO selectOnById(MenteeVO menteeVO);

	public int insertNewMyMentoring(MentoringVO mentoringVO);

	public List<MenteeVO> selectNoCheckMentoringById(String member_id);

	public List<MenteeVO> selectNoPayMentoringById(String member_id);

	public List<MenteeVO> selectNoCheckMenteeById(String member_id);
	//결제 페이지
	public MenteeVO selectPayMyMenteeBySeq(int mentee_seq);
	//멘토 - 멘토링 삭제
	public int deleteMentoringByseq(int mentoring_seq);
	//멘토 - 승락
	public int changeMenteeEnabledBySeq(int mentee_seq);
	//무료일때?
	public int insertNewMyMenteeForFree(MenteeVO menteeVO);
	//멘토링 nav
	public List<MentoringVO> selectNavListKinds(KindsVO kindsVO);
	//멘티 멘토링 삭제
	public MenteeVO selectMenteeBySeq(int mentee_seq);



	


	




	

	
		

}
