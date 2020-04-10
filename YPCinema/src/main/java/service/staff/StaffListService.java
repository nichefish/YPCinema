package service.staff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.StaffDTO;
import repository.staff.StaffRepository;

@Service
public class StaffListService {
	@Autowired
	private StaffRepository staffRepository;

	public List<StaffDTO> selectStaffByInfo(StaffDTO staff, Model model) {
		List<StaffDTO> lists = staffRepository.selectStaffByInfo(staff);
		model.addAttribute("staffLists", lists);
		return lists;
	}
}
