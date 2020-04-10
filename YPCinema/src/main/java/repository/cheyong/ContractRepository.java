package repository.cheyong;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ContractDTO;
import model.DTO.StaffDTO;

@Repository
public class ContractRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "contractMapper";
	// m_num으로 직원찾기
	public StaffDTO findStaff(String m_num) {
		String statement = namespace + ".findStaff";
		return sqlSession.selectOne(statement,m_num);
	}
	public void insertContract(ContractDTO cto) {
		String statement = namespace + ".insertContract";
		sqlSession.insert(statement,cto);
	}
	public List<ContractDTO> selectContractLists(String staff_num) {
		String statement = namespace + ".selectMyContracts";
		return sqlSession.selectList(statement,staff_num);
	}
}
