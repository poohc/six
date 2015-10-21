package com.icon.six.controller;

import org.apache.log4j.Logger;

public class DefaultController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	public void debug(String debugLog){
		log.debug("Class : " + this.getClass() + "," + debugLog);
	}
	
}
