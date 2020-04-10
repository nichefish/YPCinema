package service.staff;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.DTO.StaffDTO;
import repository.staff.StaffRepository;

@Service
public class StaffDetailService {
	@Autowired
	private StaffRepository staffRepository;
	
	public StaffDTO selectStaffByMNum(StaffDTO staff) {
		staff = staffRepository.selectStaffByMNum(staff);
		return staff;
	}
}
