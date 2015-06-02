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
import org.springframework.web.servlet.ModelAndView;

import com.rcipe.commons.ConvertKo;
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
	
	@RequestMapping(value = "joinUser", method = RequestMethod.POST)
	public ModelAndView joinUser(@ModelAttribute("user") User user)
			throws Exception {
		System.out.println(user);
		userService.insertUser(user);
		return new ModelAndView("forward:../../main/mainPage.jsp");
	}

	@RequestMapping(value = "checkedEmail", method = RequestMethod.GET)
	public @ResponseBody String checkedEmail(
			@RequestParam("email") String joinEmail) throws Exception {
		System.out.println(joinEmail);
		return userService.checkedEmail(joinEmail) + "";
	}

	@RequestMapping(value = "checkedNickname", method = RequestMethod.GET)
	public @ResponseBody String checkedNickname(
			@RequestParam("joinNickname") String nickname) throws Exception {
		return userService.checkedNickname(ConvertKo.convertKo(nickname)) + "";
	}

	@RequestMapping(value = "checkedPassword", method = RequestMethod.GET)
	public @ResponseBody String checkedPassword(HttpSession session)
			throws Exception {
		User user = (User) session.getAttribute("user");
		System.out.println("checkedPassword user :" + user);
		User newUser = userService.getUser(user.getEmail());
		System.out
				.println("checkedPassword password :" + newUser.getPassword());
		return newUser.getPassword() + "";
	}

	@RequestMapping(value = "chechkedloginUser", method = RequestMethod.POST)
	public @ResponseBody String chechkedloginUser(
			@RequestParam("id") String id,
			@RequestParam("password") String password, Model model)
			throws Exception {
		User user = userService.checkedLogin(new User(id, password));
		if (user == null) {
			return "false";
		} else if ("Y".equals(user.getFlag())) {
			return "none";
		}
		return "true";
	}

	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("user") User user,
			HttpSession session) throws Exception {
		// Business Logic
		User dbUser = userService.getUser(user.getEmail());
		session.setAttribute("user", dbUser);
		System.out.println("loginUser :" + dbUser);

		return "forward:../../main/mainPage.jsp";
	}
	
	@RequestMapping(value = "viewUser", method = RequestMethod.GET)
	public  String  viewUser()throws Exception{
		System.out.println("AAAAAAAAAAaa");
		return "forward:../../user/viewUser.jsp";
	}

	@RequestMapping(value = "updatePassword", method = RequestMethod.GET)
	public @ResponseBody void updatePassword(@ModelAttribute("user") User user,
			Model model, HttpSession session,
			@RequestParam("newPassword") String newPassword) throws Exception {
		System.out.println(newPassword);
		User newUser = ((User) session.getAttribute("user"));
		newUser.setPassword(newPassword);
		userService.updatePassword(newUser);
		String sessionId = ((User) session.getAttribute("user")).getNickname();
		if (sessionId.equals(newUser.getNickname())) {
			session.setAttribute("user", newUser);
		}
	}

	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public @ResponseBody void deleteUser(
			@RequestParam("nickname") String nickname) throws Exception {
		System.out.println("deleteUser Start");
		// userService.deleteUser(user.getNickname());
		userService.deleteUser(nickname);
	}
}
