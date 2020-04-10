package repository.staff;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.StaffDTO;

@Repository
public class StaffRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "staffMapper";
	
	public List<StaffDTO> selectStaffByInfo(StaffDTO staff) {
		String statement = namespace + ".selectStaffByInfo";
		return sqlSession.selectList(statement, staff);
	}

	public StaffDTO selectStaffByMNum(StaffDTO staff) {
		String statement = namespace + ".selectStaffByMNum";
		return sqlSession.selectOne(statement, staff);
	}

}
