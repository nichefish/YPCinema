package service.movie;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Service;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import command.movie.MovieCommand;
import model.DTO.MovieDTO;

@Service
public class MovieInfoAPIService {


	public void getMovieInfoAPI(String movie_num, MovieCommand movieCommand) {
		// TODO Auto-generated method stub
		String movieId = movie_num.substring(0, 1);
		String movieSeq = movie_num.substring(1);
		
		String url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?collection=kmdb_new2&ServiceKey=90Q8W5G0725NI95D8G60&movieId=" + movieId + "&movieSeq=" + movieSeq;
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder;
		try {
			dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result. 여기까지 제대로 됨
			NodeList nList = doc.getElementsByTagName("Row");
			System.out.println("파싱할 리스트 수 : " + nList.getLength());  // 파싱할 리스트 수 : 34. 여기까지 제대로 됨
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				NodeList cList = nNode.getChildNodes();
				for (int k = 0; k < cList.getLength(); k++) {
					Node cNode = cList.item(k);
					if (cNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) cNode;
//						if (eElement.getTagName() == "DOCID") {			// 영화번호
//							System.out.println("tagname = " + eElement.getTagName());
//							movieCommand.setMovie_num(eElement.getTextContent().replaceAll(" ", ""));
//						}
						if (eElement.getTagName() == "title") {			// 제목
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_title(eElement.getTextContent().replaceAll(" ", ""));
						}
						if (eElement.getTagName() == "nation") {			// 제작국가
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_nation(eElement.getTextContent().replaceAll(" ", ""));
						}
						if (eElement.getTagName() == "repRlsDate") {			// 개봉일
							System.out.println("tagname = " + eElement.getTagName());
							SimpleDateFormat dt = new SimpleDateFormat("yyyyMMdd");
							movieCommand.setMovie_date(dt.parse(eElement.getTextContent().replaceAll(" ", "")));
						}
						if (eElement.getTagName() == "genre") {			// 장르
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_genre(eElement.getTextContent().replaceAll(" ", ""));
						}
						if (eElement.getTagName() == "rating") {			// 18세관람불가
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_age(eElement.getTextContent().substring(1,3));
						}
						if (eElement.getTagName() == "runtime") {			// 상영시간
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_runtime(Integer.parseInt(eElement.getTextContent().replaceAll(" ", "")));
						}
						if (eElement.getTagName() == "posters") {			// 포스터url, |로 구분
							System.out.println("tagname = " + eElement.getTagName());
							String posterUrl = eElement.getTextContent().replaceAll(" ", "");
							posterUrl = posterUrl.substring(0, posterUrl.indexOf("|"));
							movieCommand.setMovie_poster_url(posterUrl);
						}
						if (eElement.getTagName() == "stlls") {			// 스틸url, |로 구분
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_still_url(eElement.getTextContent().replaceAll(" ", ""));
						}
					}
				}
			}
			NodeList dList = doc.getElementsByTagName("director");
			for (int i = 0; i < dList.getLength(); i++) {
				Node pNode = dList.item(i);
				NodeList ppList = pNode.getChildNodes();
				for (int k = 0; k < ppList.getLength(); k++) {
					Node ppNode = ppList.item(k);
					if (ppNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) ppNode;
						if (eElement.getTagName() == "directorNm") {			// 감독명
						System.out.println("tagname = " + eElement.getTagName());
						movieCommand.setMovie_director(eElement.getTextContent().replaceAll(" ", ""));
						}
					}
				}
			}
			NodeList pList = doc.getElementsByTagName("plot");
			for (int i = 0; i < pList.getLength(); i++) {
				Node pNode = pList.item(i);
				NodeList ppList = pNode.getChildNodes();
				for (int k = 0; k < ppList.getLength(); k++) {
					Node ppNode = ppList.item(k);
					if (ppNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) ppNode;
						if (eElement.getTagName() == "plotText") {			// 영화번호
							System.out.println("tagname = " + eElement.getTagName());
							movieCommand.setMovie_plot(eElement.getTextContent().substring(1));
						}
					}
					if (movieCommand.getMovie_plot() != null) {
						break;
					}
				}
			}
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DOMException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
