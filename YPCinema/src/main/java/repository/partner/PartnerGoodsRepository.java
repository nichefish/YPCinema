package repository.partner;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.PartnerGoodsDTO;


@Repository
public class PartnerGoodsRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "partnerGoodsMapper";

	public void partnerGoodInsert(PartnerGoodsDTO dto) {
		String statement = namespace + ".partnerGoodsInsert";
		sqlSession.insert(statement, dto);
	}

	public List<PartnerGoodsDTO> partnerGoodsList() {
		String statement = namespace + ".partnerGoodsList";
		return sqlSession.selectList(statement);
	}

	public PartnerGoodsDTO partnerGoodsDetail(String partnergoodsNum) {
		String statement = namespace + ".partnerGoodsList";
		return sqlSession.selectOne(statement, partnergoodsNum);
	}

	public PartnerGoodsDTO partnerGoodsModify(String partnerGoodsNum) {
		String statement = namespace + ".partnerGoodsModify";
		return sqlSession.selectOne(statement, partnerGoodsNum);
	}
	
	public void partnerGoodsModifyPro(PartnerGoodsDTO dto) {
		String statement = namespace + ".partnerGoodsModifyPro";
		sqlSession.update(statement, dto);
	}
}
