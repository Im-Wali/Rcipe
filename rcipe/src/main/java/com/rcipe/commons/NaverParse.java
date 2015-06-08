package com.rcipe.commons;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.rcipe.service.domain.Blog;


public class NaverParse {
	public static String getContent(Element element, String tagName)
	{
		 NodeList list = element.getElementsByTagName(tagName);
		 Element cElement = (Element)list.item(0);
		 
		 if(cElement.getFirstChild()!=null){
//			return cElement.getFirstChild().getNodeValue();
			 String str = cElement.getFirstChild().getNodeValue();
			   str = str.replaceAll("<b>", "");
			   str = str.replaceAll("</b>", "");
			   return str;
		 }else{
			return "";
		 }
	}
	
	public List<Blog> parse(String uri)
	{
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		List<Blog> blogList = new ArrayList<Blog>();
		try
		{
			DocumentBuilder builder = dbf.newDocumentBuilder();
			Document doc = builder.parse(uri);
			Element root = doc.getDocumentElement();
			NodeList list = root.getElementsByTagName("item");
			
			
			
		    for(int i=0; i<list.getLength();i++){
				Element element = (Element)list.item(i);
				
				Blog blog = new Blog();
				blog.setTitle(getContent(element, "title"));
				blog.setLink(getContent(element, "link"));
				blog.setDescription(getContent(element, "description"));
//				blog.setDiscount(getContent(element, "discount"));
	            blogList.add(blog);
	            System.out.println(blogList);
				//이부분이 출력 부분입니다.
//				System.out.println("** Naver Open API Connect **");
//				System.out.println("검색제목 : "+getContent(element, "title"));
//				System.out.println("문서 하이퍼텍스트(링크): "+getContent(element, "link"));
//				System.out.println("문서 요약(내용) : "+getContent(element, "description"));
//				System.out.println("블로거 이름 : "+getContent(element,"bloggername"));
//				System.out.println("블로거 하이퍼텍스트(링크) : "+getContent(element,"bloggerlink"));
			}
		}
		catch (ParserConfigurationException e){ e.printStackTrace(); }
		catch (SAXException e){ e.printStackTrace(); }
		catch(IOException e){ e.printStackTrace(); }
		return blogList;
	}
}
