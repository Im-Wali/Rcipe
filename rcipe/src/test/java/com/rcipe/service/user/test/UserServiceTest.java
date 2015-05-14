package com.rcipe.service.user.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rcipe.service.domain.User;
import com.rcipe.service.user.UserService;

public class UserServiceTest  {

	static public void main(String args[])throws Exception{
		ApplicationContext context =
				new ClassPathXmlApplicationContext(
																	new String[] {	"/config/*.xml"	 }
									                                                    );
		UserService	userService = (UserService) context.getBean("userServiceImpl");
		User user=new User("user01","user01@naver.com","1111","!!!!");
		System.out.println("insert Test :"+userService.insertUser(user));
		System.out.println("checkedEmail :"+userService.checkedEmail("user01@navercom"));
		System.out.println("checkedNickname :"+userService.checkedNickname(user.getNickname()));
		System.out.println("checkedLogin :"+userService.checkedLogin(user));
	}

}
