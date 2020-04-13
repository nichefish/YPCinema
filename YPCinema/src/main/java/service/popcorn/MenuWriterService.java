package service.popcorn;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import command.popcorn.MenuCommand;
import model.DTO.MenuDTO;
import model.DTO.MenuGoodsDTO;
import repository.popcorn.MenuRepository;

@Service
public class MenuWriterService {
	@Autowired
	MenuRepository menuRepository;

	public void menuWrite(MenuCommand menuCommand, HttpSession session, HttpServletRequest request) {
		MenuDTO dto = new MenuDTO();
		String menuNum = Integer.toString(menuRepository.selectSequenceNextval());
		dto.setTheaterNum(menuNum);
		dto.setTheaterNum(menuCommand.getTheaterNum());
		dto.setMenuName(menuCommand.getMenuName());
		dto.setMenuPrice(menuCommand.getMenuPrice());
		dto.setMenuContent(menuCommand.getMenuContent());
		dto.setMenuType(menuCommand.getMenuType());

		if (menuCommand.getMenuImage() != null) {
			MultipartFile mf = menuCommand.getMenuImage();
			String original = mf.getOriginalFilename();
			String originalFileExtension = original.substring(original.lastIndexOf("."));
			String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
			String path = request.getServletContext().getRealPath("/");
			path += "WEB-INF\\view\\popcorn\\update\\";
			File file = new File(path + store);
			try {
				mf.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setMenuImage(store);
		}
		menuRepository.menuInsert(dto);
	}
}
