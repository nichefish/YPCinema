package repository.cheyong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CheyongAddDTO;
import model.DTO.TheaterAddDTO;

@Repository
public class CheyongRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "cheyongMapper";
	
	public List<TheaterAddDTO> jijomgumsec(String jj) {
		String statement = namespace + ".selectJijom";
		return sqlSession.selectList(statement,jj);
	}
	
	public void insertCheyong(CheyongAddDTO dto) {
		String statement = namespace + ".insertCheyong";
		sqlSession.insert(statement,dto);
	}
	
	public List<CheyongAddDTO> selectLists(){
		String statement = namespace + ".selectAllCheyong";
		return sqlSession.selectList(statement);
	}
	
	public CheyongAddDTO selectOneList(String num) {
		String statement = namespace + ".selectOneCheyong";
		return sqlSession.selectOne(statement,num);
	}
}
