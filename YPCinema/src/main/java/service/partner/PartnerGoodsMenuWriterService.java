package service.partner;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import command.PartnerGoods.PartnerGoodsMenuCommand;
import model.DTO.PartnerGoodsMenuDTO;
import repository.partner.PartnerGoodsMenuRepository;


@Service
public class PartnerGoodsMenuWriterService {
	@Autowired
	PartnerGoodsMenuRepository partnerGoodsMenuRepository;

	public void partnerGoodsMenuWrite(PartnerGoodsMenuCommand partnerGoodsMenuCommand, HttpSession session, HttpServletRequest request) {
		PartnerGoodsMenuDTO dto = new PartnerGoodsMenuDTO();
		dto.setPartnerGoodsMenuNum(partnerGoodsMenuCommand.getPartnerGoodsMenuNum());
		dto.setTheaterNum(partnerGoodsMenuCommand.getTheaterNum());
		dto.setPartnerGoodsMenuName(partnerGoodsMenuCommand.getPartnerGoodsMenuName());
		dto.setPartnerGoodsMenuPrice(partnerGoodsMenuCommand.getPartnerGoodsMenuPrice());
		dto.setPartnerGoodsMenuContent(partnerGoodsMenuCommand.getPartnerGoodsMenuContent());
		dto.setPartnerGoodsMenuType(partnerGoodsMenuCommand.getPartnerGoodsMenuType());

		String storeTotal = "";

		for (MultipartFile mf : partnerGoodsMenuCommand.getPartnerGoodsMenuImage()) {
			String original = mf.getOriginalFilename();
			String originalFileExtension = original.substring(original.lastIndexOf("."));
			String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
			String fileSize = Long.toString(mf.getSize());

			storeTotal += store + "-";

			String path = request.getServletContext().getRealPath("/");
			path += "WEB-INF\\view\\partner\\update\\";

		}
		dto.setPartnerGoodsMenuImage(storeTotal);
		partnerGoodsMenuRepository.partnerGoodsMenuInsert(dto);
	}
}
