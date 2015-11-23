package com.icon.six.intercepter;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;

public class CommonIntercepter implements HandlerInterceptor {

	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		logger.debug("===============================  START ===============================");
		logger.debug("Request : " + request);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
		
		Map<String, Object> resultMap = boardService.selectBoardList(param);
		if(resultMap!=null){
			modelAndView.addObject("realStockInfo",resultMap.get("list"));
		}
		modelAndView.addObject("stockInfo",boardService.selectScheduleStock());
		logger.debug("===============================  END ===============================");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
