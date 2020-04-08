package repository.partner;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.PartnerGoodsMenuDTO;

@Repository
public class PartnerGoodsMenuRepository {
	@Autowired
	SqlSession sqlSession;
	private final String namespace = "partnerGoodsMapper";
	
	public void partnerGoodsMenuInsert(PartnerGoodsMenuDTO dto) {
		String statement = namespace + ".partnerGoodsMenuInsert";
		sqlSession.insert(statement, dto);
	}

	public List<PartnerGoodsMenuDTO> partnerGoodsMenuList() {
		String statement = namespace + ".partnerGoodsMenuList";
		return sqlSession.selectList(statement);
	}

	public PartnerGoodsMenuDTO partnerGoodsMenuDetail(String partnerGoodsMenuNum) {
		String statement = namespace + ".partnerGoodsMenuList";
		return sqlSession.selectOne(statement, partnerGoodsMenuNum);
	}
	
	public List<PartnerGoodsMenuDTO> partnerGoodsMenuType(String partnerGoodsMenuType){
		String statement = namespace + ".partnerGoodsMenuType";
		return sqlSession.selectList(statement, partnerGoodsMenuType);
	}

	public void partnerGoodsMenuDelete(String partnerGoodsMenuNum) {
		String statement = namespace + ".partnerGoodsMenuDelete";
		sqlSession.delete(statement,partnerGoodsMenuNum);
		
	}

}
