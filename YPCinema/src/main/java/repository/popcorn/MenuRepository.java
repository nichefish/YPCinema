package repository.popcorn;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
