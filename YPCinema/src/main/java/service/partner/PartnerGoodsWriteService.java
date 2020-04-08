package service.partner;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import command.PartnerGoods.PartnerGoodsCommand;
import model.DTO.PartnerGoodsDTO;
import repository.partner.PartnerGoodsRepository;



@Service
public class PartnerGoodsWriteService {
	@Autowired
	PartnerGoodsRepository partnerGoodsRepository;

	public void partnerGoodsWrite(PartnerGoodsCommand partnerGoodsCommand, HttpSession session, HttpServletRequest request) {
		PartnerGoodsDTO dto = new PartnerGoodsDTO();
		dto.setPartnerGoodsType(partnerGoodsCommand.getPartnerGoodsType());
		dto.setPartnerGoodsName(partnerGoodsCommand.getPartnerGoodsName());
		dto.setPartnerGoodsNum(partnerGoodsCommand.getPartnerGoodsNum());
		dto.setPartnerGoodsPrice(partnerGoodsCommand.getPartnerGoodsPrice());
		String storeTotal = "";

		if (partnerGoodsCommand.getPartnerGoodsImage() != null) {

			for (MultipartFile mf : partnerGoodsCommand.getPartnerGoodsImage()) {
				String original = mf.getOriginalFilename();
				String originalFileExtension = original.substring(original.lastIndexOf("."));
				String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
				String fileSize = Long.toString(mf.getSize());

				storeTotal += store + "-";

				String path = request.getServletContext().getRealPath("/");
				path += "WEB-INF\\view\\partner\\update\\";

				File file = new File(path + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		dto.setPartnerGoodsImage(storeTotal);
		partnerGoodsRepository.partnerGoodInsert(dto);
	}
}
