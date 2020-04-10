package repository.cheyong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.CheyongAddDTO;
import model.DTO.CheyongApplyDTO;
import model.DTO.StaffDTO;
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
	//관리자(진행상황 변경)
	public void changeJinhyeng(CheyongApplyDTO dto) {
		String statement = namespace + ".updateJinhyeng";
		sqlSession.update(statement,dto);
	}
	//직원시켜주자 (admin_2)
	public void changeJinhyengStaff(CheyongApplyDTO dto) {
		String statement = namespace + ".updateJinhyengStaff";
		sqlSession.update(statement,dto);
	}
	//너는 이미 직원정보를 가지다.
	public void youStaffInfo(StaffDTO sto) {
		String statement = namespace + ".insertStaff";
		sqlSession.update(statement,sto);
	}
	//직원인지 아닌지를 확인보고 삭제스
	public int checkStaff(String m_num) {
		String statement = namespace + ".deleteStaff";
		return sqlSession.delete(statement,m_num);
	}
	//극장번호 찾기
	public String findTheaterNum(String theater_name) {
		String statement = namespace + ".findTheaterNum";
		return sqlSession.selectOne(statement,theater_name);
	}
}
