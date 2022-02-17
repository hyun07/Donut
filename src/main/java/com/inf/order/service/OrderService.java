package com.inf.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.inf.course.domain.CourseVO;
import com.inf.course.domain.PurchaseCourseVO;
import com.inf.mentoring.domain.MenteeVO;
import com.inf.mentoring.domain.MentoringVO;
import com.inf.order.domain.OrderDTO;
import com.inf.order.domain.OrderListVO;
import com.inf.order.domain.OrderVO;

public interface OrderService {

	Map<String, String> addToWishList(OrderDTO order);
	Map<String, String> addToCart(OrderDTO order);
	List<CourseVO> selectAllCartItemByMemberId(String member_id);
	Map<String, String> moveToWishList(OrderDTO order);
	Map<String, String> deleteFromCart(OrderDTO order);
	List<CourseVO> selectAllWishListByMemberId(String member_id);
	Map<String, String> moveToCart(OrderDTO order);
	Map<String, String> deleteFromWishList(OrderDTO order);
	Map<String, String> purchaseCourseDirect(OrderDTO order);
	Map<String, Object> isAlreadyExistsInPurchaseCourse(OrderDTO order);
	Map<String, Object> purchaseFreeCourses(OrderListVO orderList);
	Map<String, Object> purchaseCourses(OrderListVO orderList);
	List<OrderListVO> selectAllOrderListByMemberId(String member_id);
	List<PurchaseCourseVO> selectPurchaseCoursesByMemberId(String member_id);
	
	/* 멘토링 */

	Map<String, Object> purchasePage(OrderVO orderVO);//멘티- 결제
	List<OrderVO> purchaseHistory(String member_id);//구매현황
	List<OrderVO> salesHistory(String member_id);//판매 현황
	List<OrderVO> orderList(OrderVO orderVO);//관리자 - 결제현황
	MenteeVO payMenteeList(int mentee_seq);


}
