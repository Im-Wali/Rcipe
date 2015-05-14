package com.rcipe.web.user;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rcipe.service.domain.User;
import com.rcipe.service.user.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	@RequestMapping(value = "checkedEmail", method = RequestMethod.GET)
	public @ResponseBody String checkedEmail(@RequestParam("joinEmail") String joinEmail) throws Exception {
		System.out.println(joinEmail);
		return userService.checkedEmail(joinEmail)+"";
	}
	@RequestMapping(value = "checkedNickname", method = RequestMethod.GET)
	public @ResponseBody String checkedNickname(@RequestParam("joinNickname") String nickname) throws Exception {
		return userService.checkedNickname(nickname)+"";
	}
	@RequestMapping(value = "chechkedloginUser", method = RequestMethod.POST)
	public @ResponseBody String chechkedloginUser(@RequestParam("id") String id,@RequestParam("password") String password,Model model) throws Exception {
		return userService.checkedLogin(new User(id,password));
	}
	@RequestMapping(value = "loginUser", method = RequestMethod.POST)
	public @ResponseBody String loginUser(@ModelAttribute("user") User user, HttpSession session)
			throws Exception {
		// Business Logic
		User dbUser = userService.getUser(user.getEmail());
		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}

		return "redirect:/index.jsp";
	}
//	public @ResponseBody void updatePassword( Model model , HttpSession session, @RequestParam("newPassword") String newPassword) throws Exception{
	@RequestMapping(value = "updatePassword", method = RequestMethod.GET)
		public @ResponseBody void updatePassword( @ModelAttribute("user") User user, Model model , HttpSession session, @RequestParam("newPassword") String newPassword) throws Exception{
		
		User sessionUser = new User("user01","user01@naver.com","1111","!!!!");
		System.out.println("sessionUser : "+sessionUser);
		session.setAttribute("user", sessionUser);		
		User newUser = ((User)session.getAttribute("user"));
		newUser.setPassword(newPassword);
		userService.updatePassword(newUser);
		String sessionId=((User)session.getAttribute("user")).getNickname();
		if(sessionId.equals(newUser.getNickname())){
			session.setAttribute("user", newUser);
		}        
	}
	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public @ResponseBody void deleteUser(@RequestParam("nickname") String nickname) throws Exception {
		System.out.println("deleteUser Start");
		// userService.deleteUser(user.getNickname());
		 userService.deleteUser(nickname);
	}
}
