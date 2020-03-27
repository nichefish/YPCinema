package repository.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CompanyDTO;


@Repository
public class CompanyRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "companyMapper";
	
	public Integer insertCompany(CompanyDTO dto) {
		String statement = namespace + ".insertCompany";
		return sqlSession.insert(statement, dto);
	}

	public CompanyDTO selectByUserInfo(CompanyDTO company) {
		String statement = namespace + ".selectByUserInfo";
		return sqlSession.selectOne(statement, company);
	}

	public List<CompanyDTO> selectCompanyAll() {
		String statement = namespace + ".selectCompanyAll";
		return sqlSession.selectList(statement);
	}

	public Integer modifyCompany(CompanyDTO company) {
		String statement = namespace + ".modifycompany";
		return sqlSession.update(statement, company);
	}

}
