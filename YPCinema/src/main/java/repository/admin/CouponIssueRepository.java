package repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CouponDTO;

@Repository
public class CouponIssueRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "CouponIssueMapper";

	public List<CouponDTO> selectCoupons(String type){
		String statement = namespace+ ".selectCoupons";
		return sqlSession.selectList(statement,type);
	}
	public List<CouponDTO> selectCouponsM(String type){
		String statement = namespace+ ".selectCouponsM";
		return sqlSession.selectList(statement,type);
	}
	public List<CouponDTO> selectCouponsEvent(String type){
		String statement = namespace+ ".selectCouponsEvent";
		return sqlSession.selectList(statement,type);
	}
	public void couponIssue(Map<String,Object> cNums) {
		String statement = namespace+ ".insertBalcu";
		sqlSession.insert(statement,cNums);
	}
	//생일쿠폰, 맴버쉽쿠폰
	public List<String> birthMNum() {
		String statement = namespace+ ".selectBirthMNum";
		return sqlSession.selectList(statement);
	}
	public void birthDayCouponIssue(List<CouponDTO> eventLists) {
		String statement = namespace+ ".insertBirthBalcu";
		sqlSession.insert(statement,eventLists);
	}
}
