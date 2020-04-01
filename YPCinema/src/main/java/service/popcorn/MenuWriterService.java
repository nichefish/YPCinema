package service.popcorn;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import command.popcorn.MenuCommand;
import model.DTO.MenuDTO;
import repository.popcorn.MenuRepository;

@Service
public class MenuWriterService {
	@Autowired
	MenuRepository menuRepository;

	public void menuWrite(MenuCommand menuCommand, HttpSession session, HttpServletRequest request) {
		MenuDTO dto = new MenuDTO();
		dto.setMenuNum(menuCommand.getMenuNum());
		dto.setTheaterNum(menuCommand.getTheaterNum());
		dto.setMenuName(menuCommand.getMenuName());
		dto.setMenuPrice(menuCommand.getMenuPrice());
		dto.setMenuContent(menuCommand.getMenuContent());
		dto.setMenuType(menuCommand.getMenuType());

		String storeTotal = "";

		for (MultipartFile mf : menuCommand.getMenuImage()) {
			String original = mf.getOriginalFilename();
			String originalFileExtension = original.substring(original.lastIndexOf("."));
			String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
			String fileSize = Long.toString(mf.getSize());

			storeTotal += store + "-";

			String path = request.getServletContext().getRealPath("/");
			path += "WEB-INF\\view\\popcorn\\update\\";

		}
		dto.setMenuImage(storeTotal);
		menuRepository.menuInsert(dto);
	}
}
