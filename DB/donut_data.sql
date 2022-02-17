-- 예제 데이터 삽입
-- 멘토 프로필 이미지
update member set member_profile_img_nm = '1.png' where member_id = 'aa';
update member set member_profile_img_nm = '2.png' where member_id = 'bb';
update member set member_profile_img_nm = '3.png' where member_id = 'cc';
update member set member_profile_img_nm = '4.png' where member_id = 'dd';
update member set member_profile_img_nm = '5.png' where member_id = 'ee';
update member set member_profile_img_nm = '10.png' where member_id = 'ff';
update member set member_profile_img_nm = '10.png' where member_id = 'gg';
update member set member_profile_img_nm = '10.png' where member_id = 'hh';
update member set member_profile_img_nm = '9.png' where member_id = 'ii';
update member set member_profile_img_nm = '10.png' where member_id = 'jj';
update member set member_profile_img_nm = '12.png' where member_id = 'kk';
update member set member_profile_img_nm = '12.png' where member_id = 'll';
update member set member_profile_img_nm = '1.png' where member_id = 'mm';
update member set member_profile_img_nm = '4.png' where member_id = 'nn';
update member set member_profile_img_nm = '1.png' where member_id = 'oo';
update member set member_profile_img_nm = '1.png' where member_id = 'pp';
update member set member_profile_img_nm = '1.png' where member_id = 'qq';
update member set member_profile_img_nm = '1.png' where member_id = 'rr';
update member set member_profile_img_nm = '4.png' where member_id = 'ss';
update member set member_profile_img_nm = '4.png' where member_id = 'tt';
update member set member_profile_img_nm = '4.png' where member_id = 'uu';
update member set member_profile_img_nm = '10.png' where member_id = 'vv';
update member set member_profile_img_nm = '10.png' where member_id = 'ww';
update member set member_profile_img_nm = '1.png' where member_id = 'xx';
update member set member_profile_img_nm = '10.png' where member_id = 'yy';
update member set member_profile_img_nm = '10.png' where member_id = 'zz';

-- 강의 카테고리
insert into CATEGORY values(SEQ_CATEGORY.nextval,'웹개발');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'프론트엔드');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'백엔드');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'풀스택');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'모바일 앱 개발');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'프로그래밍 언어');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'알고리즘/자료구조');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'데이터 사이언스');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'데이터베이스');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'개발 도구');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'데브옵스/인프라');
insert into CATEGORY values(SEQ_CATEGORY.nextval,'게임 개발');
-- 강의 기술
insert into SKILL values(SEQ_SKILL.nextval,'HTML/CSS');
insert into SKILL values(SEQ_SKILL.nextval,'Front-End');
insert into SKILL values(SEQ_SKILL.nextval,'JavaScript');
insert into SKILL values(SEQ_SKILL.nextval,'웹 개발');
insert into SKILL values(SEQ_SKILL.nextval,'Vue.js');
insert into SKILL values(SEQ_SKILL.nextval,'React');
insert into SKILL values(SEQ_SKILL.nextval,'Back-End');
insert into SKILL values(SEQ_SKILL.nextval,'Java');
insert into SKILL values(SEQ_SKILL.nextval, 'Spring');
insert into SKILL values(SEQ_SKILL.nextval,'Node.js');
-- 분류 기술
-- 웹개발 : 'HTML/CSS' , 'Front-End' , 'JavaScript', '웹 개발'
-- 프론트엔드 : 'HTML/CSS', '웹 개발', 'Vue.js', 'React'
-- 백엔드 : 'Back-End', 'Java', 'Spring', 'Node.js', 'Vue.js'
insert into category_skill values(1,1);
insert into category_skill values(1,2);
insert into category_skill values(1,3);
insert into category_skill values(1,4);
insert into category_skill values(2,1);
insert into category_skill values(2,4);
insert into category_skill values(2,5);
insert into category_skill values(2,6);
insert into category_skill values(3,7);
insert into category_skill values(3,8);
insert into category_skill values(3,9);
insert into category_skill values(3,10);
desc course;
-- 강의
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'aa','함수형 프로그래밍과 JavaScript ES6+','입문','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',55000,38500,30,sysdate,sysdate,'승인완료');
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'bb','실전! 스프링 부트와 JPA 활용1 - 웹 애플리케이션 개발','초급','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',46000,0,0,sysdate,sysdate,'승인완료');
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'bb','스프링 핵심 원리 - 고급편','입문','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',55000,38500,30,sysdate,sysdate,'승인완료');
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'cc','모든 개발자의 실무를 위한 올인원 기본기 클래스','입문','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',0,0,0,sysdate,sysdate,'승인완료');
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'dd','실전 프로젝트로 배우는 타입스크립트','중급이상','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',0,0,0,sysdate,sysdate,'승인완료');
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'ff','Slack 클론 코딩[백엔드 with NestJS + TypeORM]','중급이상','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',50000,25000,50,sysdate,sysdate,'승인완료');
insert into course(course_seq,member_id,course_nm,course_level,course_intro,course_price,course_sales_price,course_discount_rate,course_applydt,course_regdt,course_status)
values(SEQ_COURSE.nextval,'gg','초보를 위한 쿠버네티스 안내서','초급','ES6+와 함수형 프로그래밍을 배울 수 있는 강의입니다. 이 강좌에서는 ES6+의 이터러블/이터레이터/제너레이터 프로토콜을 상세히 다루고 응용합니다. 이터러블을 기반으로한 함수형 프로그래밍, map/filter/reduce, 파이프라인, 제너레이터를 통한 지연 평가, Promise 합성, 동시성/병렬성, async/await와 비동기 에러 핸들링 등을 배울 수 있습니다. 이 강좌를 습득하고 연습하여 중급 자바스크립트 개발자로 성장하세요!',55000,0,0,sysdate,sysdate,'승인완료');

-- 강의 분류
insert into course_category values(1,1);
insert into course_category values(1,2);
insert into course_category values(2,1);
insert into course_category values(2,3);
insert into course_category values(3,1);
insert into course_category values(4,1);
insert into course_category values(5,2);
insert into course_category values(6,2);
insert into course_category values(6,3);
insert into course_category values(7,2);
insert into course_category values(7,5);
-- 강의 기술
insert into course_skill values(1,1);
insert into course_skill values(2,2);
insert into course_skill values(1,4);
insert into course_skill values(2,1);
insert into course_skill values(2,3);
insert into course_skill values(3,5);
insert into course_skill values(3,6);
insert into course_skill values(4,3);
insert into course_skill values(5,9);
insert into course_skill values(6,10);
insert into course_skill values(7,7);
insert into course_skill values(7,6);

-- 강의 이미지 업데이트
update course set course_img_nm = '327690-eng.png' where course_seq=1;
update course set course_img_nm = 'I_O_python_1.png' where course_seq=2;
update course set course_img_nm = '327901-eng.png' where course_seq=3;
update course set course_img_nm = 'lian-sql1.png' where course_seq=4;
update course set course_img_nm = '327260-eng.png' where course_seq=5;
update course set course_img_nm = 'Subscribe for more.png' where course_seq=6;
update course set course_img_nm = '3A9329DD-8AC3-44FA-AEAA-F981219DC5E2.png' where course_seq=7;

-- 강의 수강평
insert into review values(seq_review.nextval,1,'aa','그저 그래요',2,sysdate);
insert into review values(seq_review.nextval,2,'bb','그럭저럭',3,sysdate);
insert into review values(seq_review.nextval,4,'cc','좋아요!',5,sysdate);
insert into review values(seq_review.nextval,4,'dd','어려워요',1,sysdate);
insert into review values(seq_review.nextval,5,'aa','비추',2,sysdate);

--멘토링 분야

insert into kinds values(seq_kinds.nextval,'웹개발');
insert into kinds values(seq_kinds.nextval,'프론트엔드');
insert into kinds values(seq_kinds.nextval,'백엔드');
insert into kinds values(seq_kinds.nextval,'풀스택');
insert into kinds values(seq_kinds.nextval,'모바일 앱 개발');
insert into kinds values(seq_kinds.nextval,'프로그래밍 언어');
insert into kinds values(seq_kinds.nextval,'알고리즘/자료구조');
insert into kinds values(seq_kinds.nextval,'데이터 사이언스');
insert into kinds values(seq_kinds.nextval,'데이터베이스');
insert into kinds values(seq_kinds.nextval,'개발 도구');
insert into kinds values(seq_kinds.nextval,'데브옵스/인프라');
insert into kinds values(seq_kinds.nextval,'게임 개발');
insert into kinds values(seq_kinds.nextval,'취업상담');
insert into kinds values(seq_kinds.nextval,'인생상담');
insert into kinds values(seq_kinds.nextval,'IT현황');
insert into kinds values(seq_kinds.nextval,'기업설명');
insert into kinds values(seq_kinds.nextval,'로드맵 설계');
desc mentoring;
-- 멘토링
insert into mentoring values(seq_mentoring.nextval,'aa',1,6,'자바에 관한 모든것','쉽고 알기쉽게 자바에대한 질문에 답해드립니다.','15000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'bb',2,6,'자바스크립트에 관한 모든것','쉽고 알기쉽게 자바스크립트에대한 질문에 답해드립니다.','29000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'cc',3,4,'스프링에 관한 모든것','쉽고 알기쉽게 스프링에대한 질문에 답해드립니다.','30000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'dd',4,6,'제이쿼리에 관한 모든것','쉽고 알기쉽게 제이쿼리에대한 질문에 답해드립니다.','22000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'ee',5,8,'라이브러리에 관한 모든것','쉽고 알기쉽게 라이브러리에대한 질문에 답해드립니다.','34000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'ff',6,15,'IT에 관한 모든것','쉽고 알기쉽게 IT에대한 질문에 답해드립니다.','13000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'gg',null,13,'취업 상담','어떤기업이든 취업에 필요한 뭐든 상담 가능합니다.','12000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'hh',null,15,'현 업계의 방향성','현재 업계에서 필요로 하는 인재란 무엇인지 알려드립니다.','10000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'ii',null,14,'oo회사들어가기','oo회사 맞춤 조언','66000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'jj',null,14,'회사에 맞는 자소서','성공률업 시키는 자소서 쓰는법 알려드립니다.','34000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'kk',null,13,'자기소개서 평가','기업에 맞게 씌여있는지 평가','30000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'ll',null,2,'리엑트에 관한 모든것','쉽고 알기쉽게 리엑트에대한 질문에 답해드립니다.','22000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'mm',7,7,'인텔제이','쉽고 알기쉽게 인텔제이에대한 질문에 답해드립니다.','15000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'nn',null,3,'이클립스 관한 모든것','질문에 답해드립니다.','17000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'oo',null,14,'인생상담','상담해드립니다.','52000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'pp',null,6,'파이썬 관한 모든것','쉽고 알기쉽게 리엑트에대한 질문에 답해드립니다.','22000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'qq',null,6,'C언어 관한 모든것','쉽고 알기쉽게 C언어에대한 질문에 답해드립니다.','10000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'rr',null,1,'HTML 관한 모든것','쉽고 알기쉽게 HTML에대한 질문에 답해드립니다.','25000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'ss',null,1,'CSS 관한 모든것','쉽고 알기쉽게 CSS에대한 질문에 답해드립니다.','23000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'tt',null,2,'리엑트에 관한 모든것','쉽고 알기쉽게 리엑트에대한 질문에 답해드립니다.','22000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'uu',null,3,'입문 스프링','이제는 스프링쓰자','36000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'vv',null,6,'자바 초심자','이클립스로 쉽게 알려드립니다.','29000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'ww',null,11,'에이젝스 쉽게쓰기','실전 활용 하자','31000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'xx',null,1,'웹 페이지 만들기','웹 페이지 만들자','26000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'yy',null,12,'API사용하기','API를 사용해 만들자','33000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');
insert into mentoring values(seq_mentoring.nextval,'zz',null,17,'초보자 길라잡이','튜토리얼처럼 알려드립니다.','42000',sysdate,'Y','코로나로인해 비대면으로 실행합니다. ZOOM을 사용할 것 이므로 ZOOM과 화상채팅가 가능한 곳이 필요합니다.','사전에 질문을 준비해주시면 보다 빠르게 진행될수있습니다.');

--myMentee 예제
insert into myMentee values (seq_myMentee.nextval, 'aaa', '01001010101','aaa@aaa.com',8, 
to_date('2022/01/21 11:47','yyyy/mm/dd hh24:mi'),'제발 들어가라','승인완료','결제완료');
insert into myMentee values (seq_myMentee.nextval, 'aaa', '01001010101','aaa@aaa.com',5, 
to_date('2022/01/21 11:47','yyyy/mm/dd hh24:mi'),'제발 들어가라','승인완료','결제대기');
insert into myMentee values (seq_myMentee.nextval, 'aaa', '01001010101','aaa@aaa.com',6, 
to_date('2022/01/21 11:47','yyyy/mm/dd hh24:mi'),'제발 들어가라','승인완료','결제대기');
insert into myMentee values (seq_myMentee.nextval, 'aaa', '01001010101','aaa@aaa.com',1, 
to_date('2022/01/21 11:47','yyyy/mm/dd hh24:mi'),'제발 들어가라','승인완료','결제완료');
-- community
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'aa',null,'질문답변','미해결','자바란?','자바란 무엇일까요?',to_date('22/01/06','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'bb',null,'질문답변','미해결','자바란?','자바란 무엇일까요?',to_date('22/01/06','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'cc',null,'질문답변','미해결','자바란?','자바란 무엇일까요?',to_date('22/01/06','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'dd',null,'질문답변','미해결','삼다수','미네랄',to_date('22/01/07','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'ee',null,'질문답변','미해결','test','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'dd',null,'질문답변','미해결','제목','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'ff',null,'질문답변','미해결','테스트','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'gg',null,'질문답변','미해결','test1','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'hh',null,'질문답변','미해결','제목','<p>테스트</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'ii',null,'질문답변','미해결','test','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'jj',null,'질문답변','미해결','제목','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'kk',null,'질문답변','미해결','123','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'ll',null,'질문답변','미해결','파이썬','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'mm',null,'질문답변','미해결','자바','<p>test</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'nn',null,'질문답변','미해결','test','<p>테스트</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'oo',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'pp',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'qq',null,'질문답변','미해결','ㅇ','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'rr',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'ss',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'tt',null,'질문답변','미해결','ㄹㄹ','<p>ㅇㅇ</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'uu',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'vv',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'ww',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'xx',null,'질문답변','미해결','test','<p>dd</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'yy',null,'질문답변','미해결','제목','<p>d</p>',to_date('22/01/13','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'zz',null,'질문답변','미해결','제목','<p>dd</p>',to_date('22/01/14','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'aaa',null,'질문답변','해결','최종변경 최종변경','<p>최종 테스트중~!</p>',to_date('22/01/18','RR/MM/DD'),null);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'aaa',null,'답변',null,'답변제목','<p>ㅁㄷㄶㅁㅎㅁㄴㅇㄹ</p>',to_date('22/02/04','RR/MM/DD'),1);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'aaa',null,'답변',null,'답변제목','<p>ㅁㄷㄶㅁㅎㅁㄴㅇㄹ</p>',to_date('22/02/04','RR/MM/DD'),2);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'aaa',null,'답변',null,'답변제목','<p>ㅁㄷㄶㅁㅎㅁㄴㅇㄹ</p>',to_date('22/02/04','RR/MM/DD'),3);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'aaa',null,'답변',null,'답변제목','<p>ㅁㄷㄶㅁㅎㅁㄴㅇㄹ</p>',to_date('22/02/04','RR/MM/DD'),4);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'bbb',null,'답변',null,'답변제목','<p>ㅁㄷㄶㅁㅎㅁㄴㅇㄹ</p>',to_date('22/02/04','RR/MM/DD'),5);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'bbb',null,'답변',null,'답변제목','<p>ㅁㄷㄶㅁㅎㅁㄴㅇㄹ</p>',to_date('22/02/04','RR/MM/DD'),6);
Insert into community (COMMUNITY_SEQ,MEMBER_ID,COURSE_SEQ,COMMUNITY_ROLL,COMMUMITY_STATUS,COMMUNITY_TITLE,COMMUNITY_CONTENTS,COMMUNITY_REGDT,ANSWER_SEQ) values (community_seq.nextval,'bbb',null,'답변',null,'답변제목','ar로 test',to_date('22/02/04','RR/MM/DD'),7);

-- 확인
--select * from member;
--select * from category;
--select * from skill;
--select * from category_skill;
--select * from course;
--select * from course_category;
--select * from course_skill;
--select * from review;
--select * from mentoring;
--select * from myMentee;
--select * from community;
commit;
