package service.showReserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.DTO.ShowReserveDTO;
import repository.showReserve.ShowReserveRepository;

@Service
public class ShowReserveModifyService {
	@Autowired
	private ShowReserveRepository showReserveRepository;
	
	public void updateTicketIssue(ShowReserveDTO showReserve) {
		showReserveRepository.updateTicketIssue(showReserve);
		
	}

}
