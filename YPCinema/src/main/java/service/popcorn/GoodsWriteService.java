package service.popcorn;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import command.popcorn.GoodsCommand;
import model.DTO.GoodsDTO;
import repository.popcorn.GoodsRepository;

@Service
public class GoodsWriteService {
	@Autowired
	GoodsRepository goodsRepository;

	public void goodsWrite(GoodsCommand goodsCommand, HttpSession session, HttpServletRequest request) {
		GoodsDTO dto = new GoodsDTO();
		dto.setGoodsType(goodsCommand.getGoodsType());
		dto.setGoodsName(goodsCommand.getGoodsName());
		dto.setGoodsNum(goodsCommand.getGoodsNum());
		dto.setGoodsPrice(goodsCommand.getGoodsPrice());
		String storeTotal = "";

		if (goodsCommand.getGoodsImage() != null) {

			for (MultipartFile mf : goodsCommand.getGoodsImage()) {
				String original = mf.getOriginalFilename();
				String originalFileExtension = original.substring(original.lastIndexOf("."));
				String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
				String fileSize = Long.toString(mf.getSize());

				storeTotal += store + "-";

				String path = request.getServletContext().getRealPath("/");
				path += "WEB-INF\\view\\popcorn\\update\\";

				File file = new File(path + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		dto.setGoodsImage(storeTotal);
		goodsRepository.goodInsert(dto);
	}
}
