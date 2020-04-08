package repository.cheyong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CheyongAddDTO;
import model.DTO.CheyongApplyDTO;
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
	public void insertJiwon(CheyongApplyDTO dto) {
		String statement = namespace + ".insertCheyongApply";
		sqlSession.insert(statement,dto);
	}
	public List<CheyongApplyDTO> selectJiwonList_M(String num){
		String statement = namespace + ".selectMyResumes";
		return sqlSession.selectList(statement,num);
	}
	public CheyongApplyDTO selectApplyOne(String r_num) {
		String statement = namespace + ".selectApplyOne";
		return sqlSession.selectOne(statement,r_num);
	}
	//Apply 수정
	public void updateApply(CheyongApplyDTO dto) {
		String statement = namespace + ".updateApply";
		sqlSession.update(statement,dto);
	}
	//Apply 삭제
	public void deleteApply(String r_num) {
		String statement = namespace + ".deleteApply";
		sqlSession.update(statement,r_num);
	}
	// 관리자 전체 apply 목록
	public List<CheyongApplyDTO> selectAllApply(){
		String statement = namespace + ".selectAllApplys";
		return sqlSession.selectList(statement);
	}
	// 관리자 apply 진행상황 = 열람으로 변경
	public void readBtn(String r_num) {
		String statement = namespace + ".updateReadBtn";
		sqlSession.update(statement,r_num);
	}
}
