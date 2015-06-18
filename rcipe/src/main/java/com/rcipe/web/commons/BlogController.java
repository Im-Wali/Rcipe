package com.rcipe.web.commons;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import com.google.gson.Gson;
import com.rcipe.commons.NaverParse;


@Controller
@RequestMapping("/blog")
public class BlogController {

	/*@Autowired(required=false)
	@Qualifier("blogServiceImpl")
	BlogService blogService;
	
	@Autowired
	ServletContext cx;
	public BlogController() {
		System.out.println("BlogController Start()....");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;*/
	
	@RequestMapping("/getBlog")
	public ResponseEntity<String> searchBlog(
			HttpServletRequest request,
			Model model) throws UnsupportedEncodingException {

		String apiKey = "a48edd2cc6ab726f26af1b8c22fa8202";
//		System.out.println("ㅊㅋㅊㅋ"+request.getParameter("blogTitle"));
		String searchQuery = URLDecoder.decode(request.getParameter("blogTitle"),"UTF-8");
//	       String searchQuery = URLDecoder.decode(request.getParameter("blogTitle"),"UTF-8");
//	       String author = URLDecoder.decode(request.getParameter("searchAuthor"),"UTF-8");
//	       System.out.println("searchAuthor !!!:"+author);
	       
	       System.out.println("searchQuery : "+searchQuery);
		
		
		/*
		 * 0: 실시간급상승검색어, 1: 지식iN,  2: 이미지, 3: 전문자료, 4: 책, 5: 영화, 
		 * 6: 영화인, 7: 지역, 8: 쇼핑, 9: 자동차, 10: 백과사전, 11: 블로그검색, 
		 * 12: 카페 검색, 13: 카페글 검색, 14: 웹문서 검색, 15: 뉴스 검색, 16: 추천검색어
		 * 17: 성인 검색어 판별, 18: 오타변환, 19: 바로가기
		 */
		String[] targets = {"rank", "kin", "image", "doc", "book", "movie", "movieman",
				"local", "shop", "car", "encyc", "blog", "cafe", "cafearticle", "webkr",
				"news", "recmd", "adult", "errata", "shortcut"};
		String uri = "";

		try{
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&target="+ targets[11] +"&query=" + 
					URLEncoder.encode(searchQuery, "UTF-8")+"&display=8";
		}catch(UnsupportedEncodingException e){
			System.out.println(e);
		}

		NaverParse naverAPI = new NaverParse();
		// 	naverAPI.parse(uri);

		HashMap<String,Object> result = new HashMap<String,Object>();

		result.put("data", naverAPI.parse(uri));
		String jsonString = new Gson().toJson(result);
		System.out.println("jsonString : "+jsonString);
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);

	}
}
