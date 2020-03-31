package repository.admin;

import java.util.List;

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
}
