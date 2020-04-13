package service.popcorn;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import command.popcorn.GoodsCommand;
import model.DTO.GoodsDTO;
import repository.popcorn.GoodsRepository;

@Service
public class GoodsModifyService {
	@Autowired
	GoodsRepository goodsRepository;

	public void goodsModify(String goodsNum, Model model) {
		GoodsDTO dto = goodsRepository.goodsModify(goodsNum);
		model.addAttribute("goods", dto);
	}

	public void goodsModifyPro(GoodsCommand goodsCommand, HttpSession session, HttpServletRequest request) {
		GoodsDTO dto = new GoodsDTO();
		dto.setGoodsType(goodsCommand.getGoodsType());
		dto.setGoodsName(goodsCommand.getGoodsName());
		dto.setGoodsPrice(goodsCommand.getGoodsPrice());

		if (goodsCommand.getGoodsImage() != null) {
			MultipartFile mf = goodsCommand.getGoodsImage();
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
			dto.setGoodsImage(store);
		}
		goodsRepository.goodsModifyPro(dto);
	}
}
