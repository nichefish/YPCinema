package service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.CouponDTO;
import model.DTO.MemberDTO;
import repository.admin.CouponIssueRepository;
import repository.member.MemberRepository;

@Service
public class CouponIssueService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	CouponIssueRepository couponIssueRepository;
	public void findUser(Model model,String text) {
		MemberDTO dto = memberRepository.selectFindUser(text);
		model.addAttribute("foundUser",dto);
	}
	public void selectCoupons(Model model,String type,String userNum) {
		if(type.equals("영화")) {
			List<CouponDTO> movieLists = couponIssueRepository.selectCouponsM(type);
			model.addAttribute("selectCouponsM",movieLists);
		}else if(type.equals("VIP")||type.equals("생일")) {
			List<CouponDTO> eventLists = couponIssueRepository.selectCouponsEvent(type);
			model.addAttribute("selectCouponsM",eventLists);
		}else {
			List<CouponDTO> lists = couponIssueRepository.selectCoupons(type);
			model.addAttribute("selectCouponsM",lists);
		}
		model.addAttribute("userNum",userNum);
	}
	//쿠폰발급
	public void couponIssue(String mNum,String[] cNum, String manryo) {
		List<String> str = new ArrayList<String>();
		for(String c_num : cNum) {
			str.add(c_num);
		
		}
		Map<String,Object> numms = new HashMap<String,Object>();
		numms.put("cNums", str);
		numms.put("mNum", mNum);
		numms.put("manryo", manryo);
		couponIssueRepository.couponIssue(numms);
	}
	//생일쿠폰, 맴버쉽쿠폰
	public void happyBirthDayCoupon() {
		//생일 날짜
		List<String> sysdateMNum = couponIssueRepository.birthMNum();
		System.out.println(sysdateMNum.size());
		//숫자를 지정해줘야한다.
		String [] nums = new String[100];
		for(int i=0; i<sysdateMNum.size(); i++) {
			nums[i] = sysdateMNum.get(i);
			
		}
		System.out.println(nums[0]);
		String type="생일";
		List<CouponDTO> eventLists = couponIssueRepository.selectCouponsEvent(type);
		System.out.println("eventLists.size()의값ㄴ아ㅓㅁㅇ나러먀러먀ㅓ랴더먀럳"+eventLists.size());
		int index = 0;
		for(String str : nums) {
			eventLists.get(index).setC_num(str);
		}
		couponIssueRepository.birthDayCouponIssue(eventLists);
	}
}
