package repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CouponDTO;

@Repository
public class CouponRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "couponMapper";
	
	public List<CouponDTO> selectLists(){
		String statement = namespace + ".selectLists";
		return sqlSession.selectList(statement);
	}
	public List<CouponDTO> menuType(){
		String statement = namespace + ".selectmenuTypes";
		return sqlSession.selectList(statement);
	}
	public List<CouponDTO> menuName(String menuType){
		String statement = namespace + ".selectmenuNames";
		return sqlSession.selectList(statement,menuType);
	}
	public void couponAdd(CouponDTO dto) {
		String statement = namespace + ".insertCoupon";
		sqlSession.insert(statement,dto);
	}
	public void deleteCoupon(Map<String,Object> nums) {
		String statement = namespace + ".deleteCoupons";
		sqlSession.delete(statement,nums);
	}
}
