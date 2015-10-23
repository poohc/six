package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("community")
public class CommunityController {
	
	@RequestMapping(value="communityFreeboard.do")
	public ModelAndView communityFreeboard(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/community/community_freeboard");
		return mav;
	}
	
	@RequestMapping(value="communityDiscussion.do")
	public ModelAndView communityDiscussion(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/community/community_discussion");
		return mav;
	}
	
	@RequestMapping(value="communityReview.do")
	public ModelAndView communityReview(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/community/community_review");
		return mav;
	}
	
	@RequestMapping(value="communitySpeical.do")
	public ModelAndView communitySpeical(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/community/community_speical");
		return mav;
	}
	
}
