package repository.popcorn;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CartDTO;
import model.DTO.MenuDTO;
import model.DTO.MenuGoodsDTO;

@Repository
public class MenuRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "popcornMapper";
	
	public Integer selectSequenceNextval() {
		String statement = namespace + ".selectSequenceNextval";
		return sqlSession.selectOne(statement);
	}
	
	public void menuInsert(MenuDTO dto) {
		String statement = namespace + ".menuInsert";
		sqlSession.insert(statement, dto);
	}

	public List<MenuDTO> menuList() {
		String statement = namespace + ".menuList";
		return sqlSession.selectList(statement);
	}

	public MenuDTO menuDetail(String menuNum) {
		String statement = namespace + ".menuList";
		return sqlSession.selectOne(statement, menuNum);
	}
	
	public List<MenuDTO> menuType(String menuType){
		String statement = namespace + ".menuType";
		return sqlSession.selectList(statement, menuType);
	}

	public void menuDelete(String menuNum) {
		String statement = namespace + ".menuDelete";
		sqlSession.delete(statement,menuNum);
	}

	public void menuGoodsInsert(MenuGoodsDTO menuGoods) {
		String statement = namespace + ".menuGoodsInsert";
		sqlSession.insert(statement, menuGoods);
	}
	public void cartAdd(CartDTO cart) {
		String statement = namespace + ".cartInsert";
		sqlSession.insert(statement, cart);
	}

	public void menuCartRemove(Map<String, Object> condition) {
		String statement = namespace + ".cartRemove";
		sqlSession.delete(statement, condition);
	}

	public List<CartDTO> cartList(String userId) {
		String statement = namespace + ".cartList";
		return sqlSession.selectList(statement, userId);
	}

	public Integer wishAdd(String menuNum, String userId) {
		CartDTO dto = new CartDTO();
		dto.setMenuNum(menuNum);
		dto.setUserId(userId);
		String statement = namespace + ".wishCount";
		Integer i = sqlSession.selectOne(statement, dto);

		if (i == 0) {
			statement = namespace + ".wishInsert";
			sqlSession.insert(statement, dto);
			i = 1;
		} else {
			statement = namespace + ".wishDelete";
			sqlSession.delete(statement, dto);
			i = 0;
		}
		return i;
	}

	public List<MenuDTO> wishList(String userId) {
		String statement = namespace + ".wishList";
		return sqlSession.selectList(statement, userId);
	}

	public void removeCart(CartDTO cart) {
		String statement = namespace + ".cartCartRemove";
		sqlSession.delete(statement, cart);
	}
	

}
