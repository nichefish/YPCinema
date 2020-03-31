package service.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.BalcuDTO;
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
		}else {
			List<CouponDTO> lists = couponIssueRepository.selectCoupons(type);
			model.addAttribute("selectCoupons",lists);
		}
		model.addAttribute("userNum",userNum);
	}
	public void couponIssue(String mNum,String cNum, String manryo) {
		//날짜
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time)+manryo;
		System.out.println("ttttttttttttttttttttttttttttttttttttttttttt"+time1);
		BalcuDTO dto = new BalcuDTO();
		dto.setmNum(mNum);
		dto.setcNum(cNum);
	}
}
