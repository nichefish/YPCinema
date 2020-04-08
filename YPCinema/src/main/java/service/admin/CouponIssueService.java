package service.admin;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	public void happyBirthDayCoupon(HttpServletResponse response) {	
		//생일 날짜
		List<String> sysdateMNum = couponIssueRepository.birthMNum();
		String type="생일";
		List<CouponDTO> eventLists = couponIssueRepository.selectCouponsEvent(type);
		List<CouponDTO> resultLists = new ArrayList<CouponDTO>();
		if(sysdateMNum != null) {
			for(String str : sysdateMNum) {
				for(int i = 0 ; i < eventLists.size();i++) {
					CouponDTO c = new CouponDTO();
					c.setmNum(str);
					c.setC_num(eventLists.get(i).getC_num());
					resultLists.add(c);
				}
			}
		}
		couponIssueRepository.birthDayCouponIssue(resultLists);
	}
}
