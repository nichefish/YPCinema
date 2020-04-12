package service.payment;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import command.member.MemberCommand;
import command.payment.PaymentCommand;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SendSMS {
	public void sendPaymentSMS(PaymentCommand paymentCommand, HttpServletRequest request) throws Exception {
		String api_key = "NCSW6VCZXODXGPOX"; //사이트에서 발급 받은 API KEY 
		String api_secret = "UZMGJ9ADCK2LCTIEWQRITSVRXW3J0B3T"; //사이트에서 발급 받은 API SECRET KEY 
		Message coolsms = new Message(api_key, api_secret); 
	      
		HashMap<String, String> params = new HashMap<String, String>(); 
		String content = paymentCommand.getM_num() + "님 영화를 예매해주셔서 감사합니다.";
		params.put("to", paymentCommand.getPayment_ph());
		params.put("from", "01071461970"); //사전에 사이트에서 번호를 인증하고 등록하여야 함
		params.put("type", "SMS");
		params.put("text", content); //메시지 내용
		params.put("app_version", "test app 1.2"); 
	      
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString()); //전송 결과 출력 
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage()); 
            System.out.println(e.getCode()); 
		}
	}

	public void sendMemberJoinSMS(MemberCommand memberCommand, HttpServletRequest request) {
		String api_key = "NCSW6VCZXODXGPOX"; //사이트에서 발급 받은 API KEY 
		String api_secret = "UZMGJ9ADCK2LCTIEWQRITSVRXW3J0B3T"; //사이트에서 발급 받은 API SECRET KEY 
		Message coolsms = new Message(api_key, api_secret); 
	      
		HashMap<String, String> params = new HashMap<String, String>(); 
		String content = memberCommand.getM_name() + "님 YPCinema 가입을 축하합니다. 메일인증을 꼭 해주셔야 로그인이 가능합니다.";
		params.put("to", memberCommand.getM_ph());
		params.put("from", "01071461970"); //사전에 사이트에서 번호를 인증하고 등록하여야 함
		params.put("type", "SMS");
		params.put("text", content); //메시지 내용
		params.put("app_version", "test app 1.2"); 
	      
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString()); //전송 결과 출력 
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage()); 
            System.out.println(e.getCode()); 
		}
	}
}
