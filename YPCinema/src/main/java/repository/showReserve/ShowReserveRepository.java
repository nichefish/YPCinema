package repository.showReserve;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import command.payment.PaymentCommand;
import command.showtime.ShowtimeCommand;
import model.DTO.ShowReserveDTO;

@Repository
public class ShowReserveRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "showReserveMapper";
	
	public Integer insertReserve(ShowReserveDTO showReserve) {
		String statement = namespace + ".insertReserve";
		return sqlSession.insert(statement, showReserve);
	}

	public List<ShowReserveDTO> selectShowReserveListByPayInfo(PaymentCommand paymentCommand) {
		String statement = namespace + ".selectShowReserveListByPayInfo";
		return sqlSession.selectList(statement, paymentCommand);
	}

	public List<ShowReserveDTO> selectShowReserveListByShowInfo(ShowtimeCommand showtimeCommand) {
		String statement = namespace + ".selectShowReserveListByShowInfo";
		return sqlSession.selectList(statement, showtimeCommand);
	}

	public List<ShowReserveDTO> selectShowReserveListByMemberInfo(String m_num) {
		String statement = namespace + ".selectShowReserveListByMemberInfo";
		return sqlSession.selectList(statement, m_num);
	}

	public Integer updateTicketIssue(ShowReserveDTO showReserve) {
		String statement = namespace + ".updateTicketIssue";
		return sqlSession.update(statement, showReserve);
	}
}
