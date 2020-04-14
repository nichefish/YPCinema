package repository.popcorn;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.DTO.GoodsDTO;

@Repository
public class GoodsRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "popcornMapper";

	public void goodInsert(GoodsDTO dto) {
		String statement = namespace + ".goodsInsert";
		sqlSession.insert(statement, dto);
	}

	public List<GoodsDTO> goodsList() {
		String statement = namespace + ".goodsList";
		return sqlSession.selectList(statement);
	}

	public GoodsDTO goodsDetail(String goodsNum) {
		String statement = namespace + ".goodsList";
		return sqlSession.selectOne(statement, goodsNum);
	}

	public GoodsDTO goodsModify(String goodsNum) {
		String statement = namespace + ".goodsModify";
		return sqlSession.selectOne(statement, goodsNum);
	}
	
	public void goodsModifyPro(GoodsDTO dto) {
		String statement = namespace + ".goodsModifyPro";
		sqlSession.update(statement, dto);
	}

	public void goodsDelete(String goodsNum) {
		String statement = namespace + ".goodsDelete";
		sqlSession.delete(statement,goodsNum);
	}
}
