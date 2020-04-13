package repository.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import command.payment.PaymentCommand;
import model.DTO.PaymentDTO;

@Repository
public class PaymentRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "paymentMapper";

	public Integer insertPayment(PaymentCommand paymentCommand) {
		String statement = namespace + ".insertPayment";
		return sqlSession.insert(statement, paymentCommand);
	}

	public PaymentDTO selectLastPayment(PaymentCommand paymentCommand) {
		String statement = namespace + ".selectLastPayment";
		return sqlSession.selectOne(statement, paymentCommand);
	}
	
	public PaymentDTO selectPaymentByInfo(PaymentCommand paymentCommand) {
		String statement = namespace + ".selectPaymentByInfo";
		return sqlSession.selectOne(statement, paymentCommand);
	}
	
	public PaymentDTO selectPaymentByInfo(String payment_num) {
		String statement = namespace + ".selectPaymentByInfo";
		return sqlSession.selectOne(statement, payment_num);
	}

	public List<PaymentDTO> selectPaymentAll() {
		String statement = namespace + ".selectPaymentAll";
		return sqlSession.selectList(statement);
	}

	public List<PaymentDTO> selectPaymentListByInfo(PaymentCommand paymentCommand) {
		String statement = namespace + ".selectPaymentListByInfo";
		return sqlSession.selectList(statement, paymentCommand);
	}

}
