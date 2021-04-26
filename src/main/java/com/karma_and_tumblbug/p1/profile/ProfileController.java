package com.karma_and_tumblbug.p1.profile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.karma_and_tumblbug.p1.membership.MembershipDTO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value="/profile/**") //setting으로 가야되나
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;

	@GetMapping(value="profileset")
	public ModelAndView getProfile(ProfileDTO profileDTO, HttpSession httpSession)throws Exception{
		ModelAndView mv = new ModelAndView();
		MembershipDTO membershipDTO = (MembershipDTO)httpSession.getAttribute("membership");
		profileDTO.setId(membershipDTO.getId());
		profileDTO = profileService.getProfile(profileDTO);
		mv.addObject("dto", profileDTO);
		mv.setViewName("profile/profileset");
		return mv;
	}
	
	@GetMapping(value = "updateProfile")
	public void setProfile()throws Exception{
		
	}
	
	@PostMapping(value = "updateProfile")
	public String updateProfile(ProfileDTO profileDTO)throws Exception{
		int result = profileService.updateProfile(profileDTO);
		return "redirect:./profileset";
	}
	

	
	
	

}
