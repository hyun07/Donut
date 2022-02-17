/* 접속 생성 */
--create user test IDENTIFIED BY admin;
--grant dba to test;

/* 테이블 삭제 */
--SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

/* 회원 */
CREATE TABLE member (
	member_id VARCHAR2(60) NOT NULL, /* 회원아이디 */
	member_email VARCHAR2(60) NOT NULL, /* 이메일 */
	member_nickNM VARCHAR2(30) NOT NULL, /* 닉네임 */
	member_password VARCHAR2(100) NOT NULL, /* 비밀번호 */
	member_profile_img_nm VARCHAR2(200), /* 프로필이미지 */
	member_content CLOB, /* 자기소개 */
	member_phoneNo VARCHAR2(11), /* 휴대폰번호 */
	member_regDT DATE default sysdate NOT NULL , /* 가입일 */
    member_applyDT DATE NULL, /* 멘토신청일 */
	member_approveDT DATE NULL, /* 멘토승인일 */
	member_stopDT DATE NULL, /* 자격정지일 */
    member_status VARCHAR2(20) NULL, /* 회원 상태 */
	member_role VARCHAR2(10)default '멘티' NOT NULL, /* 회원분류 */
	enabled CHAR(1) default '1' NOT NULL /* 회원탈퇴유무 */
);

--CREATE UNIQUE INDEX PK_member
--	ON member (
--		member_id ASC
--	);
ALTER TABLE member ADD CONSTRAINT PK_member primary key(member_id);
ALTER TABLE member ADD CONSTRAINT member_check CHECK(enabled in('1','0'));
ALTER TABLE member ADD CONSTRAINT member_role_check CHECK(member_role in('멘티','멘토','관리자'));
ALTER TABLE member ADD CONSTRAINT member_status_check CHECK(member_status in('승인대기','승인완료','신청취소','자격정지'));   
  
/* 강좌 */
CREATE TABLE course (
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	member_id VARCHAR2(30) NOT NULL, /* 강사아이디 */
	course_NM VARCHAR2(100) NOT NULL, /* 강의명 */
	course_level VARCHAR2(20) NOT NULL, /* 난이도 */
	course_img_nm VARCHAR2(200), /* 대표이미지이름 */
	course_intro CLOB NOT NULL, /* 강의소개 */
	course_price NUMBER(6) NOT NULL, /* 정상가 */
	course_sales_price NUMBER(6), /* 할인가 */
	course_discount_rate NUMBER, /* 할인율 */
	course_applyDT DATE NOT NULL, /* 승인신청일 */
	course_regDT DATE, /* 승인일 */
	course_cancelDT DATE, /* 승인신청취소일 */
    course_stopDT DATE, /* 판매 중지일 */
	course_available_period NUMBER(2), /* 수강기한 */
	course_status VARCHAR2(20) NOT NULL /* 강좌상태 */
);

ALTER TABLE course ADD CONSTRAINT PK_course PRIMARY KEY (course_seq);   
ALTER TABLE course ADD CONSTRAINT course_check CHECK(course_status in('승인대기','승인완료','신청취소','판매중지'));
ALTER TABLE course ADD CONSTRAINT course_level_check CHECK(course_level in('입문','초급','중급이상'));

/* 수강후기 */
CREATE TABLE review (
	review_seq NUMBER NOT NULL, /* 수강후기번호 */
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	member_id VARCHAR2(30) NOT NULL, /* 수강생아이디 */
	review_content VARCHAR2(1000) NOT NULL, /* 후기내용 */
	review_rating NUMBER(1) NOT NULL, /* 평점 */
	review_regDT DATE NOT NULL /* 등록일 */
);

ALTER TABLE review ADD CONSTRAINT PK_review PRIMARY KEY (review_seq);
ALTER TABLE review ADD CONSTRAINT review_check CHECK(review_rating in(1,2,3,4,5));

/* 분류 */
CREATE TABLE category (
	category_seq NUMBER NOT NULL, /* 강의분류번호 */
	category_NM VARCHAR2(30) NOT NULL /* 강의분류명 */
);

ALTER TABLE category ADD CONSTRAINT PK_category PRIMARY KEY (category_seq);

/* 기술 */
CREATE TABLE skill (
	skill_seq NUMBER NOT NULL, /* 기술번호 */
	skill_NM VARCHAR2(30) NOT NULL /* 기술명 */
);

ALTER TABLE skill ADD CONSTRAINT PK_skill PRIMARY KEY (skill_seq);

/* 강의분류 */
CREATE TABLE course_category (
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	category_seq NUMBER NOT NULL /* 강의분류번호 */
);

ALTER TABLE course_category ADD CONSTRAINT PK_course_category PRIMARY KEY (course_seq,category_seq);

/* 강의기술 */
CREATE TABLE course_skill (
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	skill_seq NUMBER NOT NULL /* 기술번호 */
);

ALTER TABLE course_skill ADD CONSTRAINT PK_course_skill PRIMARY KEY ( course_seq, skill_seq);
        
/* 분류기술 */
CREATE TABLE category_skill (
	category_seq NUMBER NOT NULL, /* 분류번호 */
	skill_seq NUMBER NOT NULL /* 기술번호 */
);

CREATE UNIQUE INDEX PK_category_skill
	ON category_skill (
		category_seq ASC,
		skill_seq ASC
	);

ALTER TABLE category_skill ADD CONSTRAINT PK_category_skill PRIMARY KEY (category_seq,skill_seq);

/* 장바구니 */
CREATE TABLE cart (
	cart_seq NUMBER NOT NULL, /* 장바구니번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	cart_regDT DATE NOT NULL /* 등록일 */
);

ALTER TABLE cart ADD CONSTRAINT PK_cart PRIMARY KEY (cart_seq);

/* 위시리스트 */
CREATE TABLE wish_list (
	wish_seq NUMBER NOT NULL, /* 위시리스트번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	wish_regDT DATE NOT NULL /* 등록일 */
);

ALTER TABLE wish_list ADD CONSTRAINT PK_wish_list PRIMARY KEY (wish_seq);

/* 수강후기좋아요 */
CREATE TABLE review_like (
	like_seq NUMBER NOT NULL, /* 좋아요번호 */
	review_seq NUMBER NOT NULL, /* 수강후기번호 */
	member_id VARCHAR2(30) NOT NULL /* 회원아이디 */
);

ALTER TABLE review_like ADD CONSTRAINT PK_review_like PRIMARY KEY (like_seq);

/* 내학습 */
CREATE TABLE purchase_course (
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	startDT DATE NOT NULL, /* 강의시작일 */
	endDT DATE, /* 강의종료일 */
	enabled CHAR(1) NOT NULL /* 수강가능유무 */
);

ALTER TABLE purchase_course ADD CONSTRAINT PK_purchase_course PRIMARY KEY (member_id,course_seq);
ALTER TABLE purchase_course ADD CONSTRAINT purchase_course_check CHECK(enabled in('1','0'));

/* 주문내역 */
CREATE TABLE order_list (
	order_seq NUMBER NOT NULL, /* 주문번호 */
	order_id NUMBER NOT NULL, /* 주문ID */
	course_seq NUMBER NOT NULL, /* 강좌번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	name VARCHAR2(20) NOT NULL, /* 주문인 */
	phone_no VARCHAR2(11) NOT NULL, /* 연락처 */
	amounted_pay NUMBER(6) NOT NULL, /* 결제금액 */
	orderDT DATE NOT NULL /* 주문일자 */
);

ALTER TABLE order_list ADD CONSTRAINT PK_order_list PRIMARY KEY (order_seq);

ALTER TABLE course
	ADD
		CONSTRAINT FK_member_TO_course
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_course_TO_review
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE course_category
	ADD
		CONSTRAINT FK_course_TO_course_category
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE course_category
	ADD
		CONSTRAINT FK_category_TO_course_category
		FOREIGN KEY (
			category_seq
		)
		REFERENCES category (
			category_seq
		);

ALTER TABLE course_skill
	ADD
		CONSTRAINT FK_course_TO_course_skill
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE course_skill
	ADD
		CONSTRAINT FK_skill_TO_course_skill
		FOREIGN KEY (
			skill_seq
		)
		REFERENCES skill (
			skill_seq
		);

ALTER TABLE cart
	ADD
		CONSTRAINT FK_member_TO_cart
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE cart
	ADD
		CONSTRAINT FK_course_TO_cart
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE wish_list
	ADD
		CONSTRAINT FK_member_TO_wish_list
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE wish_list
	ADD
		CONSTRAINT FK_course_TO_wish_list
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE review_like
	ADD
		CONSTRAINT FK_review_TO_review_like
		FOREIGN KEY (
			review_seq
		)
		REFERENCES review (
			review_seq
		);

ALTER TABLE review_like
	ADD
		CONSTRAINT FK_member_TO_review_like
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE purchase_course
	ADD
		CONSTRAINT FK_member_TO_purchase_course
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE purchase_course
	ADD
		CONSTRAINT FK_course_TO_purchase_course
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE order_list
	ADD
		CONSTRAINT FK_course_TO_order_list
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE order_list
	ADD
		CONSTRAINT FK_member_TO_order_list
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

/* 멘토링 */
CREATE TABLE mentoring (
	mentoring_seq NUMBER NOT NULL, /* 멘토링번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	course_seq NUMBER, /* 강좌번호 */
	kinds_seq NUMBER, /* 멘토링분류 번호 */
	mentoring_title VARCHAR2(100) NOT NULL, /* 멘토링 제목 */
	mentoring_content VARCHAR2(1000), /* 멘토링 내용 */
	mentoring_price NUMBER(6), /* 멘토링 금액 */
	mentoring_regDT DATE NOT NULL, /* 멘토링 생성일 */
	mentoring_status VARCHAR2(20) NOT NULL, /* 멘토링 상태 */
	mentoring_materials VARCHAR2(1000), /* 멘토링 준비물 */
	mentoring_comment VARCHAR2(1000) /* 멘토 한마디 */
);

CREATE UNIQUE INDEX PK_mentoring
	ON mentoring (
		mentoring_seq ASC
	);

ALTER TABLE mentoring
	ADD
		CONSTRAINT PK_mentoring
		PRIMARY KEY (
			mentoring_seq
		);
alter table mentoring modify (mentoring_status default 'Y');
/* 멘토링신청 */
CREATE TABLE myMentee (
	mentee_seq NUMBER NOT NULL, /* 신청 번호 */
	member_id VARCHAR2(30) NOT NULL, /* 신청자 아이디 */
	member_phoneNo VARCHAR2(30) NOT NULL, /* 신청자 연락처 */
	member_email VARCHAR2(30) NOT NULL, /* 신청자 이메일 */
	mentoring_seq NUMBER NOT NULL, /* 멘토링번호 */
	mentee_regDT DATE NOT NULL, /* 신청날짜 */
	mentee_comment VARCHAR2(1000), /* 한마디 */
	enabled VARCHAR2(20), /* 신청 유무 */
	pay_enabled VARCHAR2(20) /* 결제 유무 */
);

CREATE UNIQUE INDEX PK_myMentee
	ON myMentee (
		mentee_seq ASC
	);

ALTER TABLE myMentee
	ADD
		CONSTRAINT PK_myMentee
		PRIMARY KEY (
			mentee_seq
		);
ALTER TABLE myMentee ADD CONSTRAINT myMentee_check CHECK(enabled in('승인대기','승인완료'));
ALTER TABLE myMentee ADD CONSTRAINT myMentee_pay_enabled_check CHECK(pay_enabled in('결제대기','결제완료'));
ALTER TABLE myMentee MODIFY (mentee_regdt default sysdate);

/* 분야 */
CREATE TABLE kinds (
	kinds_seq NUMBER NOT NULL, /* 멘토링분류 번호 */
	kinds_name VARCHAR2(100) NOT NULL /* 분류 명 */
);

CREATE UNIQUE INDEX PK_kinds
	ON kinds (
		kinds_seq ASC
	);

ALTER TABLE kinds
	ADD
		CONSTRAINT PK_kinds
		PRIMARY KEY (
			kinds_seq
		);

/* 멘토링구매 */
CREATE TABLE order_mento (
	order_seq NUMBER NOT NULL, /* 주문번호 */
	mentoring_seq NUMBER NOT NULL, /* 멘토링번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	buyer_name VARCHAR2(30) NOT NULL, /* 사는사람 */
	buyer_phoneNo VARCHAR2(30) NOT NULL, /* 전화번호 */
	buyer_email VARCHAR2(30) NOT NULL, /* 이메일 */
	amounted_pay NUMBER(6) NOT NULL, /* 결제금액 */
	orderDT DATE NOT NULL /* 구매날짜 */
);
ALTER TABLE order_mento MODIFY (ORDERDT default sysdate);
CREATE UNIQUE INDEX PK_order_mento
	ON order_mento (
		order_seq ASC
	);

ALTER TABLE order_mento
	ADD
		CONSTRAINT PK_order_mento
		PRIMARY KEY (
			order_seq
		);
ALTER TABLE mentoring
	ADD
		CONSTRAINT FK_member_TO_mentoring
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE mentoring
	ADD
		CONSTRAINT FK_course_TO_mentoring
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE mentoring
	ADD
		CONSTRAINT FK_kinds_TO_mentoring
		FOREIGN KEY (
			kinds_seq
		)
		REFERENCES kinds (
			kinds_seq
		);

ALTER TABLE myMentee
	ADD
		CONSTRAINT FK_member_TO_myMentee
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE myMentee
	ADD
		CONSTRAINT FK_mentoring_TO_myMentee
		FOREIGN KEY (
			mentoring_seq
		)
		REFERENCES mentoring (
			mentoring_seq
		);

ALTER TABLE order_mento
	ADD
		CONSTRAINT FK_mentoring_TO_order_mento
		FOREIGN KEY (
			mentoring_seq
		)
		REFERENCES mentoring (
			mentoring_seq
		);

ALTER TABLE order_mento
	ADD
		CONSTRAINT FK_member_TO_order_mento
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);
        
--community

/* 커뮤니티 */
CREATE TABLE community (
	community_seq NUMBER NOT NULL, /* 게시글번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	course_seq NUMBER, /* 연관강의 */
	community_roll VARCHAR2(30) NOT NULL, /* 카테고리 */
	commumity_status VARCHAR2(30), /* 여부명 */
	community_title VARCHAR2(100) NOT NULL, /* 글제목 */
	community_contents CLOB NOT NULL, /* 글내용 */
	community_regDT DATE NOT NULL, /* 게시일 */
	answer_seq NUMBER /* 답변번호 */
);

CREATE UNIQUE INDEX PK_community
	ON community (
		community_seq ASC
	);

ALTER TABLE community
	ADD
		CONSTRAINT PK_community
		PRIMARY KEY (
			community_seq
		);
        
/* 댓글 */
CREATE TABLE community_reply (
	reply_seq NUMBER NOT NULL, /* 댓글번호 */
	community_seq NUMBER NOT NULL, /* 게시글번호 */
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	reply_contents VARCHAR2(2000) NOT NULL, /* 댓글내용 */
	reply_regDT DATE NOT NULL /* 게시일 */
);

CREATE UNIQUE INDEX PK_community_reply
	ON community_reply (
		reply_seq ASC
	);

ALTER TABLE community_reply
	ADD
		CONSTRAINT PK_community_reply
		PRIMARY KEY (
			reply_seq
		);

/* 태그 */
CREATE TABLE tag (
	tag_NO NUMBER NOT NULL, /* 태그번호 */
	tag_NM VARCHAR2(30) /* 태그명 */
);

CREATE UNIQUE INDEX PK_tag
	ON tag (
		tag_NO ASC
	);

ALTER TABLE tag
	ADD
		CONSTRAINT PK_tag
		PRIMARY KEY (
			tag_NO
		);

/* 태그생성 */
CREATE TABLE community_tag (
	tag_NO NUMBER NOT NULL, /* 태그번호 */
	community_seq NUMBER NOT NULL /* 게시글번호 */
);

CREATE UNIQUE INDEX PK_community_tag
	ON community_tag (
		tag_NO ASC,
		community_seq ASC
	);

ALTER TABLE community_tag
	ADD
		CONSTRAINT PK_community_tag
		PRIMARY KEY (
			tag_NO,
			community_seq
		);

ALTER TABLE community_reply
	ADD
		CONSTRAINT FK_member_TO_community_reply
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE community_reply
	ADD
		CONSTRAINT FK_community_TO_reply
		FOREIGN KEY (
			community_seq
		)
		REFERENCES community (
			community_seq
		);

ALTER TABLE community
	ADD
		CONSTRAINT course_TO_community
		FOREIGN KEY (
			course_seq
		)
		REFERENCES course (
			course_seq
		);

ALTER TABLE community
	ADD
		CONSTRAINT member_TO_community
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE community_tag
	ADD
		CONSTRAINT FK_tag_TO_community_tag
		FOREIGN KEY (
			tag_NO
		)
		REFERENCES tag (
			tag_NO
		);

ALTER TABLE community_tag
	ADD
		CONSTRAINT FK_community_TO_community_tag
		FOREIGN KEY (
			community_seq
		)
		REFERENCES community (
			community_seq
		);
        
/* sequence */
CREATE SEQUENCE seq_course START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_category START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_skill START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_course_category START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_course_skill START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_category_skill START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_review START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cart START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_wish START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_order START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_order_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_mentoring START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_myMentee START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_kinds START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_order_mento START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE reply_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE community_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE tag_NO START WITH 1 INCREMENT BY 1;

--drop SEQUENCE seq_course;
--drop SEQUENCE seq_category;
--drop SEQUENCE seq_skill;
--drop SEQUENCE seq_course_category;
--drop SEQUENCE seq_course_skill;
--drop SEQUENCE seq_category_skill;
--drop SEQUENCE seq_review;
--drop SEQUENCE seq_cart;
--drop SEQUENCE seq_wish;
--drop SEQUENCE seq_order;
--drop SEQUENCE seq_order_id;
--drop SEQUENCE seq_mentoring;
--drop SEQUENCE seq_myMentee;
--drop SEQUENCE seq_kinds;
--drop SEQUENCE seq_order_mento;
--drop SEQUENCE reply_seq;
--drop SEQUENCE community_seq;
--drop SEQUENCE tag_NO;

/* order_sequence Function */
create or replace function get_order_seq
return number as num number;
    begin
        select seq_order.nextval
        into num
        from dual;
        return num;
    end;
/
