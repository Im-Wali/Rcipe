package com.rcipe.web.commons;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rcipe.commons.MyAuthenticator;
import com.rcipe.service.domain.User;
import com.rcipe.service.user.UserService;
import com.rcipe.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/email/*")
public class EmailController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
   @RequestMapping(value = "send", method = RequestMethod.GET)
   public @ResponseBody String sendMail(@RequestParam("email") String to,@RequestParam("type") String type)
         throws Exception {
      // TODO Auto-generated method stub
      System.out.println("EmailController email : "+to);
      System.out.println("EmailController type : "+type);
      
      String host = "smtp.gmail.com";// smtp 서버
      String subject = "G-Mail을 이용한 메일발송";
      String from = "ottuguibudae@gmail.com"; // 보내는 메일
      String fromName = "Rcipe";
      String str = null;
      String content = null;
      System.out.println("type : "+ type);
      
      if(type.equals("join")){
      int num = (int) (Math.random() * 100000)+1;
      content = "[" + num + "]";
      str = num + "";
      }else if(type.equals("lose")){
         
         Random rnd =new Random();
         StringBuffer buf =new StringBuffer();
         
         for(int i=0;i<10;i++){
             if(rnd.nextBoolean()){
                 buf.append((char)((int)(rnd.nextInt(26))+97));
             }else{
                 buf.append((rnd.nextInt(10))); 
             }
             System.out.println("buf : "+buf);
         }
         System.out.println(buf.substring(0, 6));
         str = buf.substring(0, 6);
         System.out.println("str : "+ str);
         content = "임시 비밀번호 : " + str;
         
         
         User tempUser = new User();
         tempUser.setEmail(to);
         tempUser.setPassword(str);
         
         System.out.println("EmailController"+tempUser);
         
         userService.updatePassword(tempUser);
         
      }
      try {
         // 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
         Properties props = new Properties();

         // G-Mail SMTP 사용시
         props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.transport.protocol", "smtp");
         props.put("mail.smtp.host", host);
         props.setProperty("mail.smtp.socketFactory.class",
               "javax.net.ssl.SSLSocketFactory");
         props.put("mail.smtp.port", "465");
         props.put("mail.smtp.user", from);
         props.put("mail.smtp.auth", "true");

         MyAuthenticator auth = new MyAuthenticator(
               "ottuguibudae@gmail.com", "dankook89");

         Session mailSession = Session.getDefaultInstance(props, auth);

         Message msg = new MimeMessage(mailSession);
         msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(
               fromName, "UTF-8", "B")));// 보내는 사람 설정
         InternetAddress[] address = { new InternetAddress(to) };

         msg.setRecipients(Message.RecipientType.TO, address);// 받는 사람설정

         msg.setSubject(subject);// 제목 설정
         msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
         msg.setContent(content, "text/html;charset=euc-kr"); // 내용 설정 (HTML
                                                   // 형식)

         Transport.send(msg); // 메일 보내기

         System.out.println("메일 발송을 완료하였습니다.");
      } catch (MessagingException ex) {
         System.out.println("mail send error : " + ex.getMessage());
         str = "false";
      } catch (Exception e) {
         System.out.println("error : " + e.getMessage());
         str = "false";
      }
      System.out.println("str 2 : " +str);
      return str;
   }
}